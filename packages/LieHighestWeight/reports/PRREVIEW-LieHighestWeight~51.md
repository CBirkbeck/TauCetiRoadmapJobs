# Review of LieHighestWeight (pull request #1220 at 3dff437)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

The folder is unchanged since `4040fe8`; the head commit repairs the two dependency bullets of the family index, and they now agree with the roadmap. This full pass finds three things:

- one P2: the global PBW symmetrization equivalence is stated here as new, but ScatteringDiagrams §0.4 on main already owns it, at greater generality, and is not cited;
- two P3: two sentences of the description describe an earlier head; four small wording leftovers in the README.

The gate passes apart from `outside-folder` for the family index, which this pull request owns.

`README.md` and `Suggested.lean` are the folder's two files; the family index is `TauCetiRoadmap/RepresentationTheory/README.md`. `Mathlib/…` and `TauCeti/…` paths are at the manifest pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`). Main was read at `252dfa4`.

## R01 (P2) — Global PBW symmetrization has an owner on main that this roadmap restates and does not cite

**Location:**

- `README.md:51–52`: “Layer 7 adds global normalized symmetrization and multiplicative assembly of the degreewise center symbols.”
- `README.md:76–79`: “this roadmap's additional exports are the normalized symmetrization and the first-order bracket on the native Rees zero fibre.”
- `README.md:1838–1842`: “The theorem `exists_pbwSymmetrization` itself applies to every Lie algebra over every characteristic-zero field: average ordered monomials over permutations with coefficient 1/m!”.
- `Suggested.lean:224–233`: the first clause of `exists_pbwSymmetrization`.
- Family index `:84–85`: “the highest-weight roadmap adds the normalized symmetrization”.

**Claim:** The linear equivalence `Sym(L) ≃ U(L)` with the permutation-average formula is a new target of this roadmap, stated over characteristic-zero fields.

**Witness:** On main, `TauCetiRoadmap/ScatteringDiagrams/Suggested.lean:85` states `exists_pbwSymmetrizationEquiv (R g) [CommRing R] [Algebra ℚ R] [LieRing g] [LieAlgebra R g]`: a linear equivalence `SymmetricAlgebra R g ≃ₗ[R] UniversalEnvelopingAlgebra R g` sending a product of d generators to `1/d!` times the sum over all orders. Its `README.md:41–43` says §0.4 “owns its symmetrization form over commutative ℚ-algebras for arbitrary Lie algebras”, and `:327–329` adds that the map is filtered. Taking R = K gives the first clause here (a list in place of `Fin d → g`). This README does not mention ScatteringDiagrams.

**Repair:** Cite the owner, and keep here only what §0.4 does not state: the adjoint equivariance, the two-sided filtration statement, and the centre comparisons.

- **Scope and ownership.** Add: “The linear symmetrization equivalence `Sym_R(g) ≃ U_R(g)` with the permutation-average formula, for every Lie algebra over a commutative ℚ-algebra, is ScatteringDiagrams §0.4 (`exists_pbwSymmetrizationEquiv`). Layer 7 adds its equivariance for the adjoint actions, the equality of the degree and PBW filtrations under it, and the multiplicative assembly of the degreewise centre symbols.” Reword `:51–52` and `:76–79` to match.
- **Supplier contracts.** Under “From other roadmaps”, add ScatteringDiagrams §0.4 with that statement and its hypotheses.
- **§7.1 (`:1838–1842`).** Replace “average ordered monomials over permutations with coefficient 1/m!, with its product formula, commutator equivariance, inverse and filtration API” by: “for the symmetrization map of ScatteringDiagrams §0.4, prove commutator equivariance and the filtration statement”. Add ScatteringDiagrams §0.4 to the *Needs* of §7.2 and of the Layer 7 Dependencies.
- **`Suggested.lean`.** Replace `exists_pbwSymmetrization` by the statement below, which quantifies over every linear map with the averaging formula and so restates nothing of §0.4. It elaborates at the pins with `lake env lean`; the only warning is the `sorry`. Update the README name and the module docstring (“the adjoint equivariance and filtration of PBW symmetrization”).

```lean
/-- Every linear map `Sym(L) → U(L)` with the permutation-average formula of PBW symmetrization
is equivariant for the adjoint actions and identifies the degree and PBW filtrations. -/
theorem pbwSymmetrization_lie_and_mem_pbwFiltration_iff (K : Type u) [Field K] [CharZero K]
    (L : Type v) [LieRing L] [LieAlgebra K L]
    (e : SymmetricAlgebra K L →ₗ[K] UniversalEnvelopingAlgebra K L)
    (he : ∀ l : List L, e ((l.map (SymmetricAlgebra.ι K L)).prod) =
        ((l.length.factorial : K)⁻¹) •
          ∑ sigma : Equiv.Perm (Fin l.length),
            (List.ofFn (fun i => UniversalEnvelopingAlgebra.ι K (l.get (sigma i)))).prod) :
      (∀ (x : L) (p : SymmetricAlgebra K L), e ⁅x, p⁆ =
        UniversalEnvelopingAlgebra.ι K x * e p - e p * UniversalEnvelopingAlgebra.ι K x) ∧
      (∀ n : ℕ, ∀ p : SymmetricAlgebra K L,
        p ∈ (⨆ k ≤ n, TauCeti.SymmetricAlgebra.homogeneousSubmodule K L k) ↔
        e p ∈ TauCeti.UniversalEnvelopingAlgebra.pbwFiltration K L n) := sorry
```

- **Family index `:84–85`.** Replace “adds the normalized symmetrization and” with “adds the adjoint equivariance and filtration of PBW symmetrization, the assembly of the centre symbols and”.
- **Direction of supply.** ScatteringDiagrams is on main, so the citation is allowed. Its own contract table takes PBW from Tau Ceti (`pbwAssociatedGradedEquiv`, its `README.md:92`), so it consumes nothing from this roadmap. I ran the dependency check on a scratch copy with the citation added: 0 problems. The edge count stayed at 2135, so I could not confirm that the new edge was read; rerun the check after the edit.

**Tested instance:** the hypothesis `he` determines e, since products of generators span.

| Instance | Values | Result |
| --- | --- | --- |
| L = 0 | the empty list gives e(1) = (0!)⁻¹·1 = 1; both filtrations are K at every n | both clauses hold |
| abelian line Kx | e(xⁿ) = (1/n!)·n!·xⁿ = xⁿ; `[x,p]=0` on both sides; xⁿ has degree ≤ m iff n ≤ m on both sides | both clauses hold |
| `[x,y]=y`, list `[x,y]` | e(xy) = (XY+YX)/2 = YX + Y/2, in F₂ and not in F₁ | filtration clause holds |

## R02 (P3) — Two sentences of the description describe an earlier head

**Location:** description, “Review considerations”:

- “The family index `TauCetiRoadmap/RepresentationTheory/README.md` retains two incorrect dependency sentences … its dependency paragraph still needs repair.”
- “The generated summary contains two stale claims: a stable type-A gap-bound change and compact-group center applications as targets.”

**Claim:** The index and the generated summary are wrong at this head.

**Witness:**

- Index `:82–85` now reads “Both consume Tau Ceti's ordered PBW basis and filtration directly”, and `:91–95` reads “The highest-weight roadmap supplies the split Serre presentation that the Lie-group roadmap's complexification layer consumes”. Both agree with `README.md:76–77` and `:139`.
- The `roadmap-summary` block at this head has no gap-bound clause, and it says “compact-group applications and distributional Fourier reconstruction pass to their owning roadmaps”.

**Repair:** Delete both bullets. After R01, also change “Layer 7 adds global normalized PBW symmetrization” in the Layer 7 bullet to name the equivariance and filtration statements.

## R03 (P3) — Four wording leftovers in the README

**Location and witness:**

- `README.md:1720`: “written centralCharacter base λ below”. The name is not used again, and it is not a declaration of this roadmap; the pinned `TauCeti.centralCharacter` (`TauCeti/RingTheory/Semisimple/CentralCharacter.lean:99`) is a different map.
- `README.md:1500`: “formalCharacter_coeff pins the local alias to the actual Cartan weight-space dimension”. No alias is defined anywhere in the README.
- `README.md:1850`: “(degree 0 predecessor is⊥)”, a missing space.
- `README.md:3293–3294`: “the minuscule Pieri targets of Layer 6”. Layer 6 has no such target: `:1616–1617` says the rule “is native” and `:1627` that neither proof is repeated.

**Repair:**

- `:1720`: delete “, written centralCharacter base λ below,”.
- `:1500`: replace the sentence with “`formalCharacter_coeff` identifies each coefficient with the dimension of the Cartan weight space.”
- `:1850`: “is ⊥”.
- `:3293–3294`: “and the Pieri rules consumed in Layers 6 and 9”.

## Verified sound

### Gate, build, signatures, padding

- **The worker's gate.** Every rule passes at this head, with `build=0 OK`.
- **My rerun of the gate.** `outside-folder=1` for the family index, which is the pull request's own file. Every other rule is 0. The outside-folder diff command of the brief returns nothing.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2135 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 8 s with 15 `sorry` warnings and nothing else. The file has 15 theorems and 10 definitions with real bodies, no `set_option`, no sorried data and no admitted example.
- **Signatures.** I compared the 25 elaborated types in the worker's signature file with the README statements. The two flagged as having lost a binder keep `[IsTriangularizable K H L]` as `inst_7`. `LieModule.isotypicMultiplicity R L M S` takes the module before the irreducible (`TauCeti/Algebra/Lie/Multiplicity.lean:126`), as the Littlewood–Richardson headline uses it. Nothing changed.
- **One-tactic probe.** On a scratch copy each `sorry` became `first | rfl | (simp; done) | infer_instance | decide | exact?`. All 15 fail, so I found no padding.
- **Names.** A scripted sweep of 492 backticked names in the README against the declarations of both pins left 26 unmatched; each is a file or module name, a structure field, a transposed matrix or a generated instance name, and I resolved each by hand.

### Headlines

Stated: the Layer 0 basis; the zero-fibre bracket and its Poisson evaluation; the invariant-form sign; PBW symmetrization (see R01); the split Serre presentation; split G₂ and F₄; the dimensions of E₆, E₇, E₈; the complexified division octonions and compact G₂; the Littlewood–Richardson multiplicities; the product centre; closed-alcove uniqueness. The docstring names three that are not statable (formally real Albert algebra with compact F₄, the Vinberg E₈ model, the Freudenthal E₆/E₇ models) with the missing carrier; `TauCeti.AlbertAlgebra` at the pin is built on the split `TauCeti.Octonion`. A grep of the pin found no proof of any stated headline: no injectivity of a Serre lift or of `g₂ToDerivationLieAlgebra`, no `f₄` identification, no finrank of `e₆`, `e₇`, `e₈`, no closed-alcove uniqueness, no bracket on the Rees zero fibre, no tensor multiplicity of `glIrreducible`, and no statement about derivations of `DivisionOctonionReal`.

### Adversarial table

| Statement | Instance | Values on each side | Result |
| --- | --- | --- | --- |
| `normalizedPolynomialTensorBasis`, all clauses | 0≤m,n≤3, two random invertible rational g each | 1082 equalities (Gram entries and `det^r`-twisted intertwining) in exact arithmetic, 0 failures; index count (m+1)(n+1) | Keep |
| same, Gram diagonals | (1,1); (2,1); (3,2) at r=2 | 1, 1/2, 1, 2; 1, 1/3, 1/3, 1, 3/2, 3/2; 2, 2: formula and computed agree | Keep |
| §0.1 item 5 | m=2, n=2, 3, 5 | `F²w₁`: (2,8,2), (2,12,6), (2,20,20) = (2,4n,n(n−1)); `Fw₂`: (1,0,−1), (1,1,−2), (1,3,−4) = (1,n−2,−(n−1)); `w₃` = (1,−2,1) | Keep |
| `polynomialAction` | swap on x⊗y−y⊗x, m=n=r=1 | image −(x⊗y−y⊗x), det = −1 | Keep |
| `exists_reesZeroFiberBracket` | `[x,y]=y`; abelian; lift a+ħd | B(x,y)=y; B=0; commutator changes by ħ[d,b] with [d,b]∈ħ·Rees, class 0 | Keep |
| `symmetricGradient` | b=(x,y), ξ=(2,3); b′=(x+y,y) | x² ↦ 4x, xy ↦ 3x+2y; (u−v)² has partials 4, −4 at (5,3), giving 4(x+y)−4y = 4x | Keep |
| `lift_reesZeroFiberBracket_eq_lie_symmetricGradient` | `[x,y]=y` at (2,3); sl₂ | (x,y): 3 = 3; (x²,y): 12 = 12; {e,h²+4ef} = −4eh+4eh = 0 on both sides | Keep |
| §3.2 ordered product | a=0,b=1,c=1,d=0; general monomials | x⋆y = yx+ħy; first-order coefficient bc·y^(a+c)x^(b+d−1) = (∂ₓp)y(∂_y q) | Keep |
| §3.2 symmetrized | p=x, q=y | D(xy)=y/2; B_sym(x,y) = y − y/2 = y/2 | Keep |
| `exists_pbwSymmetrization` | L=0; abelian line; `[x,y]=y` | 1; xⁿ; YX+Y/2 | Restated: R01 |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ V(1), V(2); λ=0; sl₃ adjoint | exponents 1, 2, 0, 4; signs −1, +1, +1, +1; a nonzero form on K cannot be skew, and the sign is not −1 | Keep |
| §6.2 fixed-point sum | GL₂, λ=(1,0), t=(2,3); A₁, n=1 | −4+9 = 5 = 2+3; z³/(z²−1) − z⁻¹/(z²−1) = z+z⁻¹ | Keep |
| §7.1 translation | A₁, ρ(h)=1 | τ₋ρ(h²+2h) = h²−1; τρ gives h²+4h+3 | Keep |
| `serreLift_injective_of_base`, height reduction | A₂; B₂ with α₁ long | (1,1)→(−1,2); (3,0)→(−3,3) mixed; (0,2)→(2,−2); (3,−2)→(−3,4) mixed; untransposed (−2,3)→(4,−3) mixed and (2,0)→(−2,2); 2+6=8, 2+8=10 | Keep |
| Division octonions | i, j, ℓ | (ij)ℓ=(0,k), i(jℓ)=(0,−k); ℓiℓ=i, so (ℓiℓ)j=k; ℓ(i(ℓj))=ℓ(0,k)=(k,0) | Keep |
| Albert determinant | diag(1,2,3); (3,1,1) with x₁=1 | (216−252+72)/6 = 6; 3−1·N(1) = 2 | Keep |
| `finrank_e6_e7`, `finrank_e8` | rank + roots | 6+72=78; 7+126=133; 8+240=248=80+84+84 | Keep |
| `compact_g2_derivation_divisionOctonion` | dimension | 14 = 2+12 | Keep |
| LR headline | n=2, λ=μ=(1); n=1; n=0 | counts 1, 1 and 2·2=3+1; (1,1) excluded; 1 = 1 | Keep |
| `exists_productCenterEquiv` | Z=K, S=sl₂, characteristic 3 | [h,e³]=6e³=0; [f,e³]=−(3e²h+6e²)=−3e²(h+2)=0; 1⊗e³ central | Keep |
| gl_N worked example | staircase ν; gl₂ (3/2,1/2) | C(ν−ε_t)−C(ν) = −3N+3+4t, differences 4(t−s); 15/4−1/4 = 7/2 | Keep |
| alcove headline | A₁: x=2/3, 1, 0 | orbit {±2/3+2k} meets [0,1] once; x↦2−x fixes 1; x↦1−x of `W_ext` sends 2/3 to 1/3; stabilizer of 0 has order 2 | Keep `f x = x` |
| Lie–Poisson sign across roadmaps | `[x,y]=y` | here {x,y}=y; LieGroupoidsPoisson §G4.6A (`:1325`, `:1350`) positive, {x,y}=y | Agree |

### Sources: the seeded sample

No locator in the README is marked unverified. For each target I opened the cached text at the locator and checked the number, the printed page and the hypotheses. Both Etingof texts and Baez print the PDF page numbers; Garnier's page markers drift, so I used its footers; Schafer's printed pages are the PDF pages minus 6.

| Target | Passage read | Outcome |
| --- | --- | --- |
| 0.1 | EtingofLieGroupsLieAlgebras line 2484 (§11.4, p. 62), line 2507 (model, p. 63), line 2516 (Thm 11.16, pp. 63–64), line 2597 (Thm 11.18, p. 65) | As cited. The normalizations are stated as derived; computed above. |
| 3.1 | GuttDeformationQuantization lines 899–922 (Lecture 1, slide 14): line 902 the convention, line 905 the symmetrization | As cited, for the real convention only. |
| 3.2 | same slide | Consistent with B_sym = ½{,}. Humphreys §20.3 is under Not verifiable. |
| 5.1 | EtingofLieGroupsLieAlgebras lines 6700, 6708, 6712–6718 (Ex. 32.13, Prop. 32.14 and proof, pp. 165–166); EtingofRepresentationsLieGroups line 3469 (§17.2, p. 81) | As cited. The source treats complex simple algebras; the README states its extension and inputs. |
| 6.1 | EtingofLieGroupsLieAlgebras line 5955 (Prop. 30.4, p. 148), lines 5979–5981 (step (3)⇒(2), p. 149), line 5989 (Cor. 30.5), lines 6004 and 6010 (Cor. 30.7, p. 149, proof p. 150) | As cited. |
| 6.2 | EtingofLieGroupsLieAlgebras lines 5185, 5190 (Prop. 26.3, Thm 26.4, p. 131) | As cited; the fixed-point form is stated as derived. |
| 7.1 | EtingofLieGroupsLieAlgebras lines 4818, 4827, 4839, 4880–4896 (Thm 24.2, first line of proof, Lemma 24.3, parts (iii)–(iv), pp. 122–124); EtingofRepresentationsLieGroups lines 2153, 2207, 2987, 3041 | As cited. |
| 7.2 | EtingofRepresentationsLieGroups lines 2153, 2207, 2987, 3041 (Thm 10.1, Rem. 10.2, Thm 13.5, Thm 14.1, pp. 51–52, 69, 70–71) | As cited. |
| 9.1 | EtingofLieGroupsLieAlgebras line 3711 (Cor. 18.9, p. 93); Stembridge2002LR line 109 (second Corollary, p. 3) | As cited. |
| 9.2 | EtingofRepresentationsLieGroups line 2213 (Ex. 10.3, pp. 52–53), lines 2987, 3041 | As cited. |
| 9.3 | Dixmier §1.6 | Not verifiable; the argument rests on Mathlib's include-right centralizer theorem. |
| 10.1 | GarnierAlcoves line 231 (Thm 1.3.2, p. 5), line 276 (Thm 1.3.5, p. 5), lines 346 and 389 (§2.2, Prop.-Def. 2.2.1, pp. 7–8), line 642 (Cor. 2.2.7, p. 10), line 1161 (Prop. 2.3.1, p. 16) | As cited. |

Outside the sample I also opened: SchaferNonassociative lines 1022 and 1461 (printed pp. 28 and 41) and equations (39)–(42′) at lines 1438–1453; GaribaldiE8 line 382; LandsbergManivelMagicSquare lines 66–79; BaezOctonions lines 340, 397–398, 1481, 1687, 1856, 2013, 2040, 2096, 2122, 2133. Each is as cited.

### Pinned declarations opened

- `TauCeti/LinearAlgebra/RootSystem/AffineCartanMatrix.lean:103, :150, :199, :329, :349` and `TauCeti/LinearAlgebra/Matrix/Submatrix.lean` (`matrixSymmetryGroup`): as the Layer 10 contract says, with `[IsDomain R] [P.IsRootSystem]`.
- `TauCeti/LinearAlgebra/RootSystem/Weyl/Affine/Alcove.lean:258, :284, :325, :379, :389`: covering and freeness on open alcoves; no closed-alcove uniqueness.
- `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Symmetrization.lean:78, :182, :255, :316, :376, :412`: degreewise symmetrization only.
- `TauCeti/Algebra/Lie/HighestWeight/Dual.lean:92, :142`; `CentralCharacter/Basic.lean:191`; `CentralCharacter/OrbitSeparation.lean:117`; `CentralCharacter/HarishChandra.lean:102`.
- `TauCeti/Algebra/Lie/Multiplicity.lean:126`; `TauCeti/RingTheory/MvPolynomial/Symmetric/Schur/LittlewoodRichardson.lean:313` (argument order `LRTableau λ ν μ`); `TauCeti/Combinatorics/Young/LittlewoodRichardson/Yamanouchi.lean:320`.
- `TauCeti/Algebra/Lie/SpecialLinear/Diagonal.lean:304, :310`; `TauCeti/Algebra/Lie/GeneralLinear/TraceForm.lean:116, :177`; `GeneralLinear/Radical.lean:383`; `TauCeti/Algebra/Lie/Derivation/Basic.lean:317`; `TauCeti/Algebra/Lie/E7/Minuscule/Basic.lean:73–126`.
- `Mathlib/RingTheory/TensorProduct/Basic.lean:124, :137`; `Mathlib/Algebra/Lie/CartanExists.lean`.

### Cross-roadmap citations and open work

All of the following resolve on main `252dfa4`: RootSystems Layers 1–6 (`:428`–`:1035`); ClassicalGroups Layers 2–4 (`:216, :237, :272`); SchurWeyl Layer 7 (`:580`); LieGroups Layers 4, 6, 7 (`:463, :673, :787`); SpinRepresentations Layer 9 (`:1010`); ReflectionInvariantTheory §2 (`:19`); CharacteristicClasses C5 (`:1344`); LieGroupoidsPoisson §G4.6A/B (`:1325`); PseudodifferentialOperators §3.1 (`:692`); TensorProductCombinatorics §§1.5, 1.6, 2.6 (`:599, :694, :1191`); GroebnerGeometry G4 (`:252`); ChevalleyGroups C2 (`:241`); ReductiveGroups 10C (`:4223`).

- TangentialBordism §§9.1–9.2 exist only at the head of #942 (`:2701`, `:2752`). The README names them as owners, not suppliers, and the merge-order block names #942.
- #1797 changes the same folder and conflicts with this head; the description orders it before this pull request and states the rebase.
- `AdoIwasawa/Suggested.lean:111–113` still names three former declarations; the former-name table at `README.md:81–93` maps each, and the targeted build of that module passes.
- Search of main and the open heads for the other fourteen headline names and their objects found one further match: ChevalleyGroups C2 `DynkinType.serreLift_injective`, a stated consumer of Layer 7. The only second owner is the one in R01.
- ClassicalGroups on main cites this roadmap for the highest-weight classification, which the former-numbering table redirects to Tau Ceti; the dependency check reports no cycle.

## Not verifiable

- **Dixmier, *Enveloping Algebras*, §1.6** (`README.md:2834`). Not in the sources cache or the manifest; this review edits no manifest, so I did not request it.
- **HumphreysIntroLieAlgebras §20.3** (`README.md:1389`), **BourbakiLie78** and **GoodmanWallachSymmetry.** Settled as uncertified, cited by locator only.
- **Background entries in References, not opened:** Serre 1987, Fulton–Harris 1991, Humphreys 2008, Jantzen, Molev 2007. No target's statement depends on them.

## Source issues

- **Misprint** in EtingofLieGroupsLieAlgebras at Theorem 11.16, proof of (iii), printed p. 64: the source sends the m-th lowered vector to a multiple of x^m y^(n−m); it should be x^(n−m) y^m, since the vector killed by x∂_y is xⁿ; affects the proof.
- **Misprint** in EtingofLieGroupsLieAlgebras at Theorem 24.2, proof of (iii), printed p. 123: the source names the easy case as a single index with nonnegative coefficient; it should be a single index with positive coefficient, all coefficients being nonnegative already; affects the proof.
- **Error** in GarnierAlcoves at §2.2, printed p. 7: the source calls a fundamental weight minuscule when its highest-root coefficient is 1, and says these represent all classes of P/Q; it should use the highest coroot for weights (B_n's ϖ₁ fails), and they represent only the nonzero classes; affects a stated result.

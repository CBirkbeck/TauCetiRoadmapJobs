# Review of InductionRestriction (pull request #2639 at 20870e7)
Folder: `TauCetiRoadmap/RepresentationTheory/InductionRestriction/`
**Verdict:** needs changes

**Summary.** Changes are needed for one finding. This head repairs all four findings of the previous round, and the four headline theorems are now stated in `Suggested.lean` at their true generality and hold on every instance tried. The remaining finding is in §7.5: it describes the tensor factorization as proved only over algebraically closed fields, but Tau Ceti already proves its two stated facts over every commutative ring, so it asks again for pinned results and leaves the missing statement unsaid. There are also three small corrections and two format notes, none blocking. For the humans: the most-cited text, Isaacs, could not be read legally, so wording and arrangement were checked against it only at chapter level.

## R01 (P2) — The §7.5 tensor-factorization target restates Tau Ceti theorems that hold over every commutative ring, not only over an algebraically closed field

As written, an implementer is asked to prove pinned results again, and the result that is actually missing is never stated. The supplier contract also gives the pinned hypotheses wrongly. The API paragraph of §7.5 (README lines 676–681) says that the multiplicity projective representation has factor set `β⁻¹` and that `V ⊗ X` is an ordinary representation of `T`. It goes on: "Tau Ceti proves this over an algebraically closed field … and the target is the same statement under `hScalar` over any field". Under From Tau Ceti (lines 984–987) the same declarations carry "(algebraically closed, `Type`)". At the pin, in `TauCeti/RepresentationTheory/Induction/Clifford/TensorFactorization.lean`:

- `IsProjectiveInertiaExtension.tensorRep` (line 108) makes `V ⊗ X` an ordinary representation for every compatible extension, and `isProjectiveRep_homAction` (line 248) gives `Hom_N(V, W)` factor set `β⁻¹` for every `W`. Both lie in sections over `[CommRing k]` (lines 86 and 122), with `k`, `G` and the carriers in arbitrary universes. `evalTensor` (line 259) is in the same section, and `evalTensor_surjective` (line 292) holds over every field.
- Only `evalTensor_injective` (line 303) and `tensorRepEquiv` (line 329) assume `[IsAlgClosed k] [Simple A]` (line 299). None of these declarations is restricted to `Type`.
- `FDRep.cliffordBalancedEvaluationEquiv` (`Clifford/Extension/Evaluation.lean` line 246, every field) already reconstructs every `W` whose restriction to `N` is semisimple and `V`-isotypic as `Hom_N(V, W) ⊗_{End V} V`. Under `hScalar`, `End V` is `k`.

Smallest change: cite these declarations in §7.5 and state as the target only what is missing. For simple `V` with `hScalar` over any field, and `W` whose restriction to `N` is semisimple and `V`-isotypic, the evaluation `V ⊗_k Hom_N(V, W) → W` (`evalTensor`) is bijective. One route is to compare it with `cliffordBalancedEvaluationEquiv` through `End V ≅ k`. Alternatively, drop the target and cite. In lines 984–987, give each declaration its own hypotheses: the parenthesis is right only for `cohomologyClass_factorSet_eq_cliffordObstruction`.

## C01 — The Serre reference puts Brauer's characterization of characters and the cyclotomic splitting field in §§9–10

The References entry (lines 1002–1004) cites Part II "§9–10 (the Grothendieck ring, Artin's and Brauer's induction theorems, Brauer's characterization of characters, the cyclotomic splitting field)". In the published contents, Ch. 9 is Artin's theorem (with §9.1 on the ring `R(G)`) and Ch. 10 is Brauer's theorem. The characterization of characters is §11.1, and realizability over cyclotomic fields is §12.3. Would write "§§9–12", or give the two sections. The body citation in §6.1 ("over ℂ: Serre, Part II, §9–10") is right as it stands.

## C02 — §5.3 does not cite two clauses of the correspondence that the pin already proves beyond the algebraically closed case

The lying-over clause of `clifford_correspondence` (`Ind U` lies over `V`) is `FDRep.liesOver_indFDRep_of_inertia` (`Clifford/LiesOver.lean` line 45), over every field. The injectivity clause is `FDRep.nonempty_iso_of_liesOver_inertia_of_nonempty_iso_indFDRep` (`Clifford/Injectivity.lean` line 54), over every field of characteristic zero with `G` finite. §5.3 names only the algebraically closed, characteristic-zero `FDRep.cliffordCorrespondence` (line 455), so an implementer may redo both. Would add them to §5.3's *Needs:* line. The statement stays as it is: simplicity, surjectivity and positive characteristic are new.

## C03 — The description does not say that the revision drops the roadmap's only roadmap supplier

The roadmap on main consumes SemisimpleAlgebras Layers 1–2 for the comparison of the scalar Schur hypothesis with split Wedderburn presentations (main's README, lines 517 and 923). The head has no roadmap supplier and records that comparison as Tau Ceti's `TauCeti.nonempty_splitWedderburnAlgebraPresentation_iff_scalarSchur` (lines 874–876). The description says only "There are no roadmap suppliers." Would add: "The version on main consumed SemisimpleAlgebras Layers 1–2 for the scalar-Schur/split-Wedderburn comparison; that comparison is now Tau Ceti's `TauCeti.nonempty_splitWedderburnAlgebraPresentation_iff_scalarSchur`, so the revision drops its only roadmap supplier."

## N01 — `IsSemisimpleRepresentation` under From Mathlib (line 901) lacks its namespace

At the pin it is `Representation.IsSemisimpleRepresentation` (`Mathlib/RepresentationTheory/Semisimple.lean` line 34). The bare name is unknown to Lean.

## N02 — Two declarations of `Suggested.lean` are not named in the README

`AbstractUCE.relationsInsideDerived` (line 170) and `AbstractUCE.projection_mk` (line 184) appear nowhere in the README. Would name them in §7.1, for instance next to `AbstractUCE.Cover`.

## Questions for the author

- §§5.2, 5.3, 7.5 and 7.6 state results over every field, and §5.2 also for infinite `G`, citing Isaacs Ch. 6 and Ch. 11 among other sources. Isaacs works with complex characters of finite groups. Which result of Curtis–Reiner §11 supports the correspondence of §5.3 over an arbitrary field? Or would the Isaacs locators better say "over ℂ", as §6.1 does for Serre? Neither text could be read legally (Wiley and AMS paywalls).

## Earlier findings

Each finding of the previous round, checked against this head:

- **R01 (Clifford correspondence over every field): repaired.** §5.3 line 434 now reads "no invertibility of `|G|` in `k` and no splitting hypothesis is assumed". `clifford_correspondence` (Lean line 127) keeps only `[Finite G]`. The route is the isotypic-part argument.
- **R02 (§6.1 needs only characteristic zero): repaired.** Line 492 reads "a field of characteristic zero; `k` need not split `G`", with the orthogonality route.
- **R03 (§7.7 statable): repaired.** `exists_cliffordMultiplicityFunctor_obj_iso` (Lean line 332) is stated, and the docstring (lines 22–33) now lists only §7.8 as not statable.
- **R04 (§7.4 product model): repaired.** Lines 625–632 consume `TauCeti.FactorSet.Extension`, and the Lean block is gone.
- **C01 (Serre Part II): repaired.**
- **C02 (citations that cannot be followed): repaired.** The unidentified Borcherds page is replaced by Weibel (checked below), and Karpilovsky by Isaacs Ch. 11 (unreadable).
- **C03 (adapters): settled.** The cocycle and twisted-coordinate adapters are removed. The two §2.1 adapters are kept, and the docstring (lines 35–37) gives the reason: PolynomialGaloisGroupsPartIII on main cites both names (its README lines 264–265, 675–677, 697).
- **C04 (§2.3 targets): repaired.** Lines 175–176 now say "neither statement is a target".
- **C05 (finiteness in §5.2): repaired.** Both instances are dropped.
- **C06 (first Check of §7.2): repaired** (line 594).
- **C07 (trivial `G`): repaired** (line 551 and Lean line 227).
- **C08 (Hopf's formula): repaired** (Lean line 222).
- **C09 (dropped ids): repaired.** The mapping paragraph at lines 862–873 covers them.
- **C10 (Example of §3.1): repaired.** Line 252 now gives the coefficient rings ("over every `k` … over `ℚ`").
- **C11 (description): repaired.**
- **N01 (headline lists): repaired.**
- **Earlier questions:** the Isaacs edition is now Academic Press 1976 with the AMS Chelsea reprint, and projective representations are cited as Ch. 11. Serre §7.2 and §7.4 match the published section titles, and §4.1 cites §7.4.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 0.1 generator formulas | `S = 1`; outer relation; composite | `⟦xg ⊗ ⟦tx⁻¹ ⊗ a⟧⟧ ↦ ⟦tg ⊗ a⟧ = image of ⟦g ⊗ ⟦t ⊗ a⟧⟧`; inverse then forward gives `⟦g ⊗ a⟧` | holds | none |
| 2.1 adapters | `f = id`; `I = 1`; `I = G` | restriction is `e`; invariants `V`, quotient `G`; invariants `V^G`, trivial quotient | definitions complete; names cited on main | none (C03 settled) |
| 2.3 normalization Checks | `S₃ ⊃ ⟨(12)⟩`; `𝔽₂, C₂`; `ℝ, C₃` | `(3+3+0)/6 = 1`; `2⁻¹ = 0` gives `0`; `(4+1+1)/3 = 2 = dim_ℝ ℂ` | Checks true | none |
| 3.1 biproduct (Lean) | `S₃`, `H = K = ⟨(12)⟩`, sign; `K = 1` | two double cosets, `1+2 = 3`; `(3,−1) = (1,−1)+(2,0)`; `HasFiniteBiproducts (Rep k K)` not inferred (probe) | true; hypothesis justified | none |
| 4.1 identity component | `C₂`, `H = 1`, `V = k` | `dim End(k[C₂]) = 2 = 1 + 1`; `f = c ↦ (c, 0)` | holds | none |
| 4.3 conjugate form | `Q₈`, `H = ⟨i⟩`, `s = j` | `j⁻¹ij = −i` in both forms; Mackey subgroup `H` both sides | forms agree | none |
| 4.4 real `Q₈` | map `⟦g⊗v⟧ ↦ g⁻¹v` | `(hg)⁻¹hv = g⁻¹v`; `⟦gx⁻¹⊗v⟧ ↦ xg⁻¹v`; `2 + 2 = 4 = dim ℍᵒᵖ` | holds | none |
| 5.1 isotypic | `C₃/ℚ`; `𝔽₃, C₂, W = 1³` | `finrank(U ⟶ ℚ[C₃]) = 2`, one copy; `⟨1,χ_W⟩ = (3+3)/2 = 3 = 0` | Checks true | none |
| 5.2 structural (headline) | `C₄/ℚ`, `N = ⟨g²⟩`; `GL₂(𝔽₂) ⊃ A₃`; `G = ℤ ⊃ 2ℤ` on `ℚ²` | `e=2, T=G, 2=2·1·1`; `e=1, T=S₃, 2=1·1·2`; infinite `G`: `e = 2`, `[G:T] = 1` | holds, every field, any `G` | none |
| 5.2 character (headline) | same; convention of `conjNormalFDRep` | `χ(g²) = −2 = 2·(−1)`; pin acts by `g⁻¹ x g` (Conjugate.lean 677–684), left transversal matches `cliffordSum` | holds | none |
| 5.3 correspondence (headline) | `S₄⊃V₄/ℚ`; `A₄⊃V₄/ℚ`; `S₃⊃A₃/𝔽₄` | `|T|=8`, `Ind` dims 3, 3; non-split, `Ind χ` simple of dim 3; `|G|=0`, `Ind λ` simple of dim 2 | holds without `hG`, splitting | C02 |
| 6.1 lattice | `S₃/ℚ`; `C₃/ℚ` | `(3,1,0) = χ₁+χ₃`; `(1,0,0)` outside, six times it inside; basis `1,(2,−1,−1)`, norm `2 ≠ 0` | holds in char 0; pin needs alg. closed (VirtualCharacter.lean 296) | none |
| 7.1 UCE (headline) | `A₅`; `G = 1`; `C₂`; Weibel p. 37 | kernel order 2; `F ≅ ℤ`, `[F,F]=1`; image `[G,G]=1`; Ex. 5.3.4 kernel `(R∩[F,F])/[R,F]` | holds; locators correct | none |
| 7.2 cocycles, `PGL` | Pauli `X, Z`; constant `c`; `diag(1,−1)` | `α(a,b)=1`, `α(b,a)=−1`; `c·c = c·c`; factor set `1` twice, images differ | Checks true | none |
| 7.4 extension, lifting | `C₂`, `α(g,g)=−1`; `Q₈ → C₂²` | `c(g)² = −1` impossible over `ℝ`; `(1,g)² = (−1,1)`; kernel `{±1} = [Q₈,Q₈]` | holds | none |
| 7.5 obstruction (headline) | `Q₈⊃{±1}/ℂ`; `A₃◁S₃/ℚ`; scalars between extensions | class nonzero (`−1 ∈ [Q₈,Q₈]`); `End = ℚ(ω)`, no class; `c` constant on `N`-cosets | holds, every field | none |
| 7.5 API, tensor factorization | pin, TensorFactorization.lean | `tensorRep` and `isProjectiveRep_homAction` over `CommRing` (86, 122); `IsAlgClosed` only from line 299 | target duplicates pin | R01 |
| 7.6 operator presentation | associativity of `U_qU_rU_t`; product | both sides give `s(q)s(r)s(t)s(qrt)⁻¹ ∈ N`; `(s(q),dU_q)(s(r),eU_r) ~ (dσ_q(e)a(q,r), qr)` | identities true | none |
| 7.7 essential image (headline) | `A₃◁S₃/ℚ`; `ℤ ⊃ 2ℤ`, sign; `M = 0` | `(ℚ(ω)/ℚ,σ,1) ≅ M₂(ℚ)`, `Ind U = (4,0,−2) = 2·(2,0,−1)`; algebra `ℚ[x]/(x²+1)`; `W = 0` | true, including infinite `Q` | none |
| 7.8 restriction | `T' = N` | crossed product `Dᵒᵖ`; `M ⊗_D V` is `dim_D M` copies | Check true | none |
| Convention 5 | `S₃`, `s = (123)`, `H = ⟨(12)⟩` | `s(12)s⁻¹ = (23)`; `s⁻¹(12)s = (13)` | holds | none |

- Source locators checked against the text: 2 of 22 (Weibel2013 lines 1941–1981: Definition 5.3.1, Lemmas 5.3.2–5.3.3, Example 5.3.4 and Theorem 5.4, chapter p. 37), both correct. The 4 Serre locators (§7.2, §7.4 twice, §§9–10) were checked against the published section titles (C01). The remaining 16 are unreadable.
- Tau Ceti declarations opened at the pin:
  - `Induction/LiesOver.lean` 59; `Induction/Conjugate.lean` 677, 683; `Induction/Inertia.lean` 94; `Induction/FiniteDimensional/Basic.lean` 375.
  - `Clifford/Equivalence.lean` 64, 227; `Clifford/Obstruction.lean` 87, 162, 250, 304, 318; `Clifford/TensorFactorization.lean` 86, 108, 122, 227, 248, 259, 292, 299, 303, 329.
  - `Clifford/Correspondence.lean` 217, 226; `Clifford/Injectivity.lean` 50, 54; `Clifford/LiesOver.lean` 45; `Clifford/Surjectivity.lean` 84, 135; `Clifford/Extension/Evaluation.lean` 246; `Clifford/Extension/Gauge.lean` 44, 53.
  - `CharacterTable/Pairing.lean` 231, 259; `CharacterTable/VirtualCharacter.lean` 127, 296, 328; `CharacterTable/Table.lean` 114; `CharacterTable/Independence.lean` 76, 126; `CharacterTable/FixedPointCount.lean` 183; `RepresentationRing/Injective.lean` 50; `RepresentationRing/Basic.lean` 127, 157.
  - `Induction/DoubleCosetPairing.lean` 110; `Induction/Mackey/Sufficient.lean` 56; `RingTheory/Semisimple/Multiplicity.lean` 206, 236; `GroupAlgebra/Split.lean` 106; `Rep/DirectSum/Basic.lean` (no biproduct comparison).
- Mathlib and Tau Ceti declarations elaborated by `#check`:
  - 22 Mathlib names of the supplier contracts; one, `IsSemisimpleRepresentation`, needs its namespace (N01, `Mathlib/RepresentationTheory/Semisimple.lean` 34).
  - The `FactorSet`, `cliffordMultiplicityFunctor` and Mackey-Hom declarations of Tau Ceti.
- Cross-roadmap citations resolved:
  - On main: PolynomialGaloisGroupsPartIII 264, 675, 697; FiniteGroupInvariants 57, 221; PseudodifferentialOperators 2009; NoncompactQuantumSymmetry 1571; StableHomotopyKTheory 12, 84, 1347; InverseGaloisAndArithmeticFundamentalGroups 3033; InductionRestrictionPartII 13; AlgebraicKTheory 552; main's own README 517, 923.
  - Layer-level citations from 23 roadmaps on main.
  - At open heads: ModularCharactersAndBlocksPartII 207, 307, 330, 443–455; CohomologyOfGroups 1609, 2302–2307, 2786.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 199 roadmaps, 2195 edges, 0 problem(s)`.
- Elaboration: `Suggested.lean` elaborates with 14 `sorry` warnings and nothing else. `#check @` of all 29 declarations in one file matches the README statements. No binder is lost: `AbstractUCE.derived` needs no group structure on `G`.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`) on the 14 sorried theorems: none closes, and the §7.7 statement times out.
- Changes outside the folder: none, and none in the family index.

Overlap check: read ModularCharactersAndBlocksPartII, ArtinRepresentations, MetaplecticAutomorphicFormsPartII and CohomologyOfGroups at their open heads, and ModularInduction, CharacterTheory, FiniteGroupInvariants, AlgebraicKTheory and StableHomotopyKTheory on main. Nothing is shared:

- They consume Layers 0–7.
- CharacterTheory works over `ℂ` or algebraically closed fields.
- ModularInduction owns `G₀` and the positive-characteristic induction theorems.
- CohomologyOfGroups owns Hopf's formula, and StableHomotopyKTheory §3.29 owns the kernel–`H₂` identification.
- AlgebraicKTheory §5.1 owns the Steinberg group as the universal central extension of `E(R)`, a particular case.
- This roadmap owns the abstract universal central extension (§7.1) and general-field Clifford theory.

The open heads of ModularInduction (#2644) and CharacterTheory (#2578) were not available, so ownership against those two heads was not checked; their versions on main were read.

Source independence: 6 passages compared with 1 source, Weibel2013, with no more than three consecutive words shared. They are the §7.1 statement list, its route, its definition sentence, its Check, and the docstrings of `universal` and `cover_isPerfect`. The largest share is Isaacs, 7 of 22 locators; its text is unreadable. Contents were compared with Isaacs's public chapter list and with Serre's section titles, and are independent. Layers 0, 3, 4 and §7.1 have no Isaacs chapter, and Isaacs Ch. 7–10 and 12–15 have no layer. The order is the one the dependency lines force (induction, Mackey, criterion, Clifford, virtual characters, projective representations).

Research link: §7.1 is the universal central extension that Weibel (2013, Ch. III, Theorems 5.4–5.5) uses for the Kervaire–Steinberg identification `K₂(R) ≅ H₂(E(R); ℤ)`, which StableHomotopyKTheory §3.29 consumes. Clifford theory and crossed products (Layers 5 and 7) feed block theory in ModularCharactersAndBlocksPartII. This rests on Weibel2013 lines 1970–1992 and the README's Downstream consumers.

## Not verifiable

- Isaacs, *Character Theory of Finite Groups*, Ch. 6 and 11 (§§5.1–5.3, 7.2, 7.4–7.6): the AMS pages refused access, and the sources service found no legal copy.
- Curtis–Reiner, *Methods of Representation Theory I*, §§10–11 (§§0.1, 3.1, 5.1–5.3, 7.6): Wiley paywall.
- Alperin–Bell, *Groups and Representations*, Ch. 8 (§§3.1, 5.2): Springer paywall.
- Mackey 1951, Amer. J. Math. 73 (§3.1): JSTOR landing page only, with no licence class.
- Serre, GTM 42 (§§2.3, 4.1, 4.3, 6.1): Springer paywall (DOI prefix 10.1007). Only public section titles were checked, so the content of §7.4 for §4.1's identity-component claim is unverified.

Automatic checks set aside as false positives:

- The citation resolver listed as found nowhere seven names that this head's `Suggested.lean` declares (the `AbstractUCE` declarations and `Gassmann.normalInvariantEquiv`), and the roadmap's own namespace.
- The overlap report still lists two dropped anchors ("Abstract universal central extensions" and old Layer 2.1), although the paragraph after the Scope table (README lines 862–868) maps both to their new places.
- The signature check flagged a "dropped" group instance on `AbstractUCE.derived`, which does not need one.

## Source issues

- **Gap** in Weibel2013 at Ch. III, Recognition Theorem 5.4, p. 37: the proof invokes Lemma 5.3.3 for the uniqueness of the map out of `[F,F]/[R,F]` without showing that this group is perfect, and Lemma 5.3.2 cannot supply it before universality is known. It should note that perfect `G` gives `F = [F,F]R`, hence `[F,F] ⊆ [[F,F],[F,F]]·[R,F]`. Affects the proof.

## For the human reviewers

- Not tested: Isaacs, *Character Theory of Finite Groups*, has the largest share of locators (7 of 22) and could not be read legally. The wording and arrangement checks were run against it only at chapter level, from public listings of its contents.

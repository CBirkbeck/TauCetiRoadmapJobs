# Review of LieHighestWeight (pull request #1220 at cf5c2bd)
Folder: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/`
**Verdict:** needs changes

Full review of an unchanged head (the previous review read the same commit). 7 findings: 1 P2 and 6 P3. The two findings of the previous review are not repaired and are written again as R06 and R07. The new findings come from reading the pinned Tau Ceti by object: Layer 8 still plans four results the pin proves, one Lean headline is a pinned theorem re-typed, and one sentence of §5.1 is a pinned theorem.

`README.md` and `Suggested.lean` below are the folder's files. Library paths start with `TauCeti/` or `Mathlib/` and are read at the pins of this head's manifest. "Main" is the roadmap repository's main branch.

## R01 (P2) — Layer 8 plans four results that the pinned Tau Ceti proves

**Location:** `README.md:1811–1813`, "prove that it is Killing-simple of type `G₂`"; `README.md:1832–1834`, "Its derivation algebra is a 52-dimensional Killing-simple split algebra with fundamental 26-dimensional trace-zero representation"; `README.md:2714–2717` (worked examples "check `finrank = 52`" and "check `finrank (𝔰𝔩₉ ⊕ ⋀³(K⁹) ⊕ ⋀³(K⁹)^*) = 248`"); the contracts at `README.md:529–545` list only the dimensions 14, 27 and 26.

**Claim:** These are targets of Layer 8, and the pin supplies only the carriers and the dimensions 14, 27, 26.

**Witness:** At the pin:

- `TauCeti/Algebra/Octonion/Simple.lean:94` `TauCeti.Octonion.cartanSubalgebra`, `:175` `lieBasis` (Chevalley generators with matrix `CartanMatrix.G₂ᵀ`), `:335` and `:343` (Cartan and triangularizable instances over a characteristic-zero field), `:515` `isSimple_derivationLieAlgebra`, `:537` `instIsKillingDerivationLieAlgebra`.
- `TauCeti/Algebra/AlbertAlgebra/Derivation/Finrank.lean:384` `TauCeti.AlbertAlgebra.finrank_derivationLieAlgebra` (`= 52`, 2 invertible).
- `TauCeti/Algebra/AlbertAlgebra/Derivation/Basic.lean:180`, `:218`, `:229`: derivations have trace-zero values, `traceZeroLieSubmodule` has dimension 26 and is faithful.
- `TauCeti/Algebra/Lie/E8/Vinberg.lean:79` `TauCeti.finrank_prod_sl_exteriorPower_dual` (`= 248`).

**Repair:** Add these declarations to "From Tau Ceti" with their hypotheses. In the G₂ bullet replace "prove that it is Killing-simple of type `G₂`" by consumption of the five octonion declarations; the remaining G₂ target is `octonionSerreLift_injective`. In the F₄ bullet consume dimension 52 and the faithful trace-zero module; the remaining targets are Killing-simplicity, the split Cartan with its root data, irreducibility of the trace-zero module and `nonempty_derivationAlbert_equiv_f4` (the pinned file's docstring says simplicity and the Cartan "are not treated here"). In the two worked examples cite the pinned dimension theorems instead of "check".

## R02 (P3) — `module_finite_of_central_monic_relations` is a pinned theorem re-typed, and its consumer is proved at the pin

**Location:** `Suggested.lean:87–96`; `README.md:880–888`, "The central-subalgebra adapter `module_finite_of_central_monic_relations` packages a subalgebra R≤Z(U(L)) through the commutative scalar view"; `README.md:71–73` and `2755–2756` (the adapter as an export to AdoIwasawa).

**Claim:** This is a headline of the roadmap, exported to AdoIwasawa.

**Witness:** `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Finite.lean:180` `moduleFinite_of_isIntegral_of_span_eq_top` is the theorem; `TauCeti/Algebra/Subalgebra/Center.lean:115` `Subalgebra.centralSubalgebraAlgebra` and `:137` are the packaging the README describes. A 38-line proof of the exact Lean statement from these two compiles on a scratch copy (no `sorry`, no error). The consumer exists: `TauCeti/Algebra/Lie/UniversalEnveloping/FiniteOverCenter.lean:116` and `TauCeti/RepresentationTheory/Lie/Ado/ArbitraryField.lean:113` (`adoIwasawa`, any field).

**Repair:** Delete the theorem from `Suggested.lean` and its two docstring sentences (lines 27 and 33). In §3.1 cite the three pinned declarations as the supplier of central finiteness and state the subalgebra form as a remark, not an export; drop "the central-monic finiteness adapter" from `README.md:72` and `2756`.

## R03 (P3) — §5.1 states the native self-duality criterion as a target

**Location:** `README.md:1110`, "Prove that `L(λ)` is self-dual exactly when `δλ=λ`", with `δ=−w₀` fixed at `README.md:1104`.

**Claim:** This equivalence is to be proved here.

**Witness:** `TauCeti/Algebra/Lie/HighestWeight/Dual.lean:142` `TauCeti.nonempty_lieModuleEquiv_dual_iff`: `Nonempty (M ≃ₗ⁅K,L⁆ Dual K M) ↔ -(longestElement … • lam) = lam`; `:169` is the same criterion on `irreducibleQuotient`. `README.md:1093` already lists the first as consumed.

**Repair:** Write "By the native `TauCeti.nonempty_lieModuleEquiv_dual_iff`, `L(λ)` is self-dual exactly when `δλ=λ`; prove the equivalent reading on fundamental-weight coefficients". The multiplicity identity `m_(M*)(λ)=m_M(δλ)` and the all-modules criterion stay as targets.

## R04 (P3) — The Littlewood–Richardson headline has no locator

**Location:** `README.md:2311–2322`, the target `isotypicMultiplicity_tensor_glIrreducible_eq_card_lrTableau`.

**Claim:** Every theorem carries a locator, or says it is derived.

**Witness:** The paragraph gives a route and no source, and does not say "derived statement, with no source claim" as §6 and §9.1 do for theirs. The roadmap's manifest records `Stembridge2002LR` (second Corollary, p. 3; `Stembridge2002LR line 109`), which the README and its References never cite.

**Repair:** Add at the target: "The symmetric-function rule is Stembridge, *A concise proof of the Littlewood–Richardson rule*, second Corollary, p. 3; the multiplicity statement for the Lie modules is derived from it through the native contracts above", and add the work to References.

## R05 (P3) — Three stale statements in Conventions and §7.1

**Location and witness:**

- `README.md:153–155`, "this splitness is itself a **named milestone** (feeding Mathlib's `IsTriangularizable K H L`)". No layer has it; it is Mathlib's instance `LieModule.instIsTriangularizableOfIsAlgClosed` (`Mathlib/Algebra/Lie/Weights/Basic.lean:754`), as `README.md:2693` says.
- `README.md:209–210`, "its Cartan is the diagonal diagonalCartan": garbled; the object is the pinned `TauCeti.diagonalCartan` (`TauCeti/Algebra/Lie/GeneralLinear/DiagonalCartan.lean:97`).
- `README.md:1703–1704`, "The all-root normalization exists_chevalleySystem and serre_presentation_equiv are split-field contracts". Neither name exists at the pin (the nearest is `TauCeti.DynkinType.exists_chevalleySystem_eq_inv_smul_lie`) nor in `Suggested.lean`.

**Repair:** Replace the first by "over an algebraically closed `K` every Cartan subalgebra is split, by Mathlib's `instIsTriangularizableOfIsAlgClosed`". Replace the second by "its Cartan is the diagonal subalgebra `TauCeti.diagonalCartan`". Replace the third by prose: "The all-root Chevalley normalization and the presentation equivalence built from the lift are targets of this paragraph, independent of the HC isomorphism".

## R06 (P3) — The family index still assigns PBW to this roadmap

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:82–84`, "The highest-weight roadmap owns the concrete PBW project; Ado–Iwasawa consumes its injectivity, ordered-monomial, filtration, domain, and Noetherian consequences".

**Claim:** Ado–Iwasawa receives PBW from this roadmap.

**Witness:** `README.md:71` of this folder: "AdoIwasawa consumes native ordered PBW directly". Previous R01, unchanged; the pull request already edits this file.

**Repair:** Replace the sentence by: "Both roadmaps consume Tau Ceti's PBW basis, filtration, domain and Noetherian theorems." (With R02 repaired, no adapter is named.)

## R07 (P3) — Two sentences of the generated summary describe content the head does not have

**Location:** pull-request description, block `roadmap-summary`: "while the type-A tensor decomposition weakens the highest-weight gap bound from strict to weak inequality" and "general-linear comparisons and applications to compact group centers as targets".

**Claim:** These describe the head.

**Witness:** The README has no type-A stable tensor decomposition, and `README.md:109–117` says the compact-group applications "are not targets of this roadmap". Previous R02, block unchanged.

**Repair:** Regenerate the `roadmap-summary` block from this head. The author's own text below it matches the head (fifteen theorems and one definition; former Layers 0, 1, 2, 4, 5, 6F in the table; no simplicity binder on the Serre headline).

## Previous findings

- R01 (family index) — not repaired: lines 82–84 unchanged. Written again as R06.
- R02 (`roadmap-summary` block) — not repaired: both sentences are still in the block. Written again as R07.

## Verified sound

**Gate, build, direction of supply.** The worker's gate passes with every counter 0. My rerun differs only in `outside-folder=1` for `TauCetiRoadmap/RepresentationTheory/README.md`, the family index, which is this pull request's own; the diff against main outside the folder and the family index is empty. `lake env lean` on `Suggested.lean`: exit 0, fifteen `sorry` warnings, nothing else. Dependency check:

```text
depcheck: 235 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. ReductiveGroups, LieGroups and TangentialBordism are named only as consumers or as owners of what this roadmap leaves out.

**Lean form.** One `import Mathlib` plus 16 `TauCeti.*` modules, no `set_option`, no sorry'd data; `productEnveloping` has a real body. The 16 elaborated signatures were compared with the README statements: all agree. The two "dropped binder" leads are false: `[IsTriangularizable K H L]` is the instance argument of `LieAlgebra.IsKilling.rootSystem H` and appears in both elaborated types.

**One-tactic probes.** On scratch copies, `simp`, `rfl`, `infer_instance` and `exact?` each close 0 of 15 theorems. R02 was found by a longer probe, not by these.

**Headlines.** The 15 stated headlines are those the README names. The four "not statable" claims hold at the pin: `TauCeti.AlbertAlgebra` is the split carrier; no Vinberg or Freudenthal bracket exists (`E8/Vinberg.lean` is a dimension count); `Rees/ZeroFiber.lean` has no bracket; no category-O carrier. No statable headline is absent.

**Adversarial table.**

| Statement | Instance | Values | Result |
| --- | --- | --- | --- |
| `exists_polynomialSymmetric` | d=0; d=2, i=1 | unit ↦ 1; tprod of one `e₀`, one `e₁` ↦ `X₀X₁`; averaged tensor `(x⊗y+y⊗x)/2`, norm² 1/2 = 1/binom(2,1) | holds; `2·e` excluded |
| §0.1 ladder | `e_i=x^(d−i)y^i` | `E e_i=i e_(i−1)`, `F e_i=(d−i)e_(i+1)`, `[E,F]e_i=((d−i)(i+1)−i(d−i+1))e_i=(d−2i)e_i` | holds |
| §0.1 `E†=F` | general i | `i/binom(d,i−1) = (d−i+1)/binom(d,i) = i!(d−i+1)!/d!` | holds |
| §0.1 `‖v_r‖²` | (m,n,r)=(1,1,1),(2,1,1),(2,2,1),(2,2,2) | sum: 2, 3/2, 1, 3; closed form: 2, 3/2, 1, 3 | agree |
| §0.1 item 5 | general n≥2 | `F²w₁=2A+4nB+n(n−1)C`, `Fw₂=A+(n−2)B−(n−1)C`; cross products `2−4+2`, `1−(n−2)/n−2/n`, `2+2(n−2)−2(n−1)` | all 0 |
| `exists_reesZeroFiberBracket` | `[x,y]=y`; abelian; zero ring; lift `a+ħj(z)` | `t²ι(y)=ħj(y)`; c=0; 0=0; extra term `ħ²j([z,y])` ↦ 0 | holds |
| §3.1 derivative identity | `[x,y]=y` at (2,3) | `{x,y}=3`, `{x²,y}=2xy=12`; sl₂: `{e,h²+4ef}=−4eh+4eh=0` | holds |
| §3.2 product formula | `XY=Y(X+ħ)` | coefficient of ħ: `bc·y^(a+c)x^(b+d−1) = (∂_x p)y(∂_y q)`; `B_sym=(1/2)y(p_x q_y−p_y q_x)` | holds; `D(x^b y^a)=(ab/2)x^(b−1)y^a` matches mean inversions |
| `exists_pbwSymmetrization` | L=0; abelian; sl₂ | K≃K; identity; `sym(h²+4ef)=h²+2h+4fe` central | holds |
| `invariantForm_isSymm_iff_tits_sign` | sl₂ V(1), V(2); sl₃ adjoint; L=0 | exponents 1, 2, 4, 0; forms skew, symmetric, symmetric, symmetric | holds; non-self-dual λ has no nonzero form (hypothesis `hB` empty) |
| §5.1 opposition | A₂; D₄ | swaps ω₁, ω₂; `w₀=−Id` while diagram group is S₃ | as stated |
| §6.2 fixed-point sum | GL₂, λ=(1,0), (t₁,t₂)=(2,3) | −4 + 9 = 5 = t₁+t₂ | holds |
| §7.1 translation | A₁ | `τ_(−ρ)(h²+2h)=h²−1`; `τ_ρ` gives `h²+4h+3` | sign fixed |
| §7.1 separation | A₁ dot orbits; `A₁×A₁` | {0,−2}, {1,−3}; Casimir 8+0=0+8 | dominance of both weights needed; single Casimir fails |
| §7.1 Killing checks | sl₂ | `exp(ad e)f=f+h−e`; `κ(h−2e,f)=−8`; `h²/32` at `8t` gives `2t²` | holds |
| `serreLift_injective_of_base` | sl₂; `sl₂×sl₂` | 3=3; 6=6, `[e₁,e₂]=0` from the zero Cartan entry | holds without simplicity |
| Layer 8 octonion checks | `ℓ=(0,1)` | `ℓi=(0,−i)`, `(ℓi)ℓ=i`; `(ij)ℓ=(0,k)`, `i(jℓ)=(0,−k)`; Moufang both sides k | holds |
| Layer 8 Jordan checks | `A=E₀₀`, `B=E₀₁+E₁₀` | `[L_A,L_B](A)=B/4−B/2=−B/4`; `[D,D₁₂](A)=−(E₀₂+E₂₀)/16` | holds |
| Layer 8 cubic | diag(1,2,3); unit; `E₀₀`; diag(3,1,1), x₁=1 | 6; 1; 0; 3−1=2 | holds |
| `finrank_e8`, `finrank_e6_e7` | rank + roots | 8+240, 6+72, 7+126 | 248, 78, 133 |
| `compact_g2_derivation_divisionOctonion` | split comparison | split coroot has positive Killing square; compact form `−‖ad D‖²` | definite only on the division carrier |
| LR headline | n=2, λ=μ=(1); n=1; n=0; λ⊄ν | counts 1,1 and 4=3+1; (1,1) excluded by `hnu`; 1=1; empty by the `le` field of the pinned skew tableau | holds |
| `exists_productCenterEquiv` | Z=S=0; Z=K, S=sl₂ | K≃K⊗K; `K[t]⊗K[C]` | holds |
| §9 worked values | gl₂, μ=(3/2,1/2); staircase | 15/4−1/4=7/2; `C(ν−ε_t)−C(ν−ε_s)=4(t−s)`; `Σν_i=N²/2` | holds |
| Closed-alcove uniqueness | A₁, coordinate α(x) | orbit of 2/3 is `±2/3+2k`, meets [0,1] once; 0 has stabilizer of order 2; `x↦1−x` moves 2/3 to 1/3 | true for `W_aff`, false for `W_ext`; conclusion `f x = x`, not `f = 1` |
| `Ω⋊Γ_root ≃ Aut(affine diagram)` | A₁, A_r, D₄, E₆ | C₂; dihedral of order 2(r+1); S₄; S₃ | agree |

**Library declarations opened at the pin (31).** Those named in R01–R03 and R05 (15); `PBW/Symmetrization.lean:78`, `:412` (degreewise, so the global `exists_pbwSymmetrization` is not there); `Rees/ZeroFiber.lean:62`; `Presentation/Serre.lean:256`, `:507`, `:601` and `Presentation/Serre/Killing.lean` (surjectivity only; no injectivity anywhere at the pin); `Octonion/Serre.lean:397`; `Weights/WeightLattice.lean:100` (`coweightPairing : ℤ`); `Lie/Multiplicity.lean:126` (finrank of `S →ₗ⁅R,L⁆ M`, the argument order used); `Combinatorics/Young/SkewTableau.lean` (the `le : inner ≤ outer` field) and `LittlewoodRichardson/Basic.lean:71`, `:259`, `:265`; `RootSystem/Alcove.lean:134`; `Weyl/Affine/Basic.lean:211`; `Weyl/Affine/Alcove.lean:258` (same hypotheses as the Lean headline, over an ordered commutative ring); `CayleyDickson/Quaternion.lean:312`. No pinned statement of closed-alcove uniqueness, injectivity of `Ω → P∨/Q∨`, dominant-weight separation, the `gl_n` tensor multiplicity, or anything about derivations of `DivisionOctonionReal`.

**Sources: the seeded sample (12 subsections).** Read in the cache, with printed pages.

- Etingof, *Lie Groups and Lie Algebras* (MIT notes): §11.4 p. 65, Theorem 11.16 p. 66, Theorem 11.18 p. 68; Corollary 18.8 p. 99; §24.1 p. 129 (algebraically closed, as the README says), Theorem 24.2 and Lemma 24.3 p. 130, the reduction to irreducible root systems in the first line of the proof; Proposition 26.3 p. 139, Theorem 26.4 p. 140; Proposition 30.4 p. 159 with (3)⇒(2) as described; Corollaries 30.5 and 30.7 p. 160; Example 32.13 and Proposition 32.14 pp. 176–177 (stated for simple `g`, as the README notes).
- Etingof, *Representations of Lie Groups*: Theorem 10.1 p. 51, Remark 10.2 and Example 10.3 p. 52; Theorem 13.5 p. 69; Theorem 14.1 pp. 70–71 with (iv) and (v) as cited; §17.2 p. 81.
- Garnier: §1.3 p. 4, Theorems 1.3.2 and 1.3.5 p. 5; Proposition-Definition 2.2.1 p. 8; Corollary 2.2.7 p. 10; Proposition 2.3.1 p. 16.
- Gutt, Lecture 1, slide 14 (`GuttDeformationQuantization line 922`): the linear Poisson structure and symmetrization.

Every sampled locator supports the statement it is attached to; where the README extends a source (a split field, semisimple instead of simple) it says so and names the route.

**Cross-roadmap citations resolved (14).** On main: ReflectionInvariantTheory §2 (line 19); CharacteristicClasses C5 (line 1344); LieGroupoidsPoisson G4.6A (line 1325, positive `{ℓ_ξ,ℓ_η}=ℓ_[ξ,η]`, the sign of §3.1); PseudodifferentialOperators §3.1; TensorProductCombinatorics §§1.5, 1.6, 2.6; RootSystems Layers 4 and 6; ClassicalGroups Layers 2–4; SchurWeyl Layer 7; SpinRepresentations Layer 9; LieGroups Layers 4, 6, 7; GroebnerGeometry G4. At the head of its open pull request: TangentialBordism §§9.1–9.2 (lines 2701, 2752), named as an owner, not as a supplier.

**Overlaps and ownership.** #1797 conflicts in both files; the description and the generated merge-order block put it first: no finding. No dropped id. The headline objects (closed-alcove uniqueness, the `gl_n` multiplicity, the Rees zero-fibre bracket, Serre-lift injectivity, the division-octonion derivations) were searched in the open roadmap pull requests and on main: no second owner.

## Not verifiable

- `HumphreysIntroLieAlgebras`, `BourbakiLie78`, `GoodmanWallachSymmetry`: settled uncertified; not read.
- Dixmier §1.6 (`README.md:2414`): no readable legal text on this worker.
- Baez, Schafer and Garibaldi locators of Layer 8 are outside the seeded sample and were not re-read this round.
- Of the roughly 400 pinned files under the Lie, octonion, Albert and root-system directories that the README does not cite, only those bearing on Layers 3, 5, 7, 8, 9 and 10 were opened; the E₆/E₇/F₄/G₂ group-scheme directories were listed, not read.

## Source issues

- none

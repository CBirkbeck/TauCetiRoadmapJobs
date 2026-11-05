# Review of SmoothRepresentationsOfLocalGroups (pull request #1688 at 6e0b929)

**Verdict:** needs changes

Incremental re-review of the 58 lines changed since fa1d0be: the new target *wd-algebraic-composition* (README 4548–4595), the two sentences that register it under ownership (93–96) and the ReductiveGroups contract (529–530), and the new reference [Tat79] (5311–5312). Four P3 findings, no P1 or P2. The gate fails on three TeX lines of the new passage; the dependency check, the targeted build and the elaboration pass. The mathematics of the new target was recomputed and is correct as stated; the defects are in its supplier citations and one Check, plus the r4 citation note that the change did not touch.

## R01 (P3) — TeX-only exponents outside code spans in the new passage (gate `tex` fails)

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4556` (“ω(w) = q^{deg w} as *wd-parameter-operations*”), `:4584` (“f_j = e_1^{n−1−j} e_2^j”), `:4587` (“e_0^{n−1−j} e_1^j have weights ω(w)^j”).

**Claim:** The README has no TeX-only syntax outside code spans (gate rule `tex`).

**Witness:** The gate rerun on this head prints `tex=3 … FAIL` and lists exactly these three lines; every other rule is 0. The same expression `q^{deg w}` passes at 4437 and 4555 because there it sits inside a code span.

**Repair:** Put each of the three expressions in a code span (`q^{deg w}`, `e_1^{n−1−j} e_2^j`, `e_0^{n−1−j} e_1^j`, `ω(w)^j`), or write them in Unicode (ω(w) = q^deg w is not enough: the braces are what the scanner flags). Rerun the gate; it must end `OK`.

## R02 (P3) — The composite target uses Jordan-decomposition functoriality that its `*Needs:*` line and the ReductiveGroups contract do not cite

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4553–4554` (“dρ(N_1,…,N_k) is nilpotent because morphisms of algebraic groups preserve Jordan decompositions”), `:4558–4560` (“ρ preserves the multiplicative Jordan decomposition `LinearMap.GeneralLinearGroup.jordanDecomposition`”), `:4577–4580` (the `*Needs:*` line: ReductiveGroups Layers 2 and 5P only), `:522–531` (the ReductiveGroups contract: Layers 3, 7, 5P, 2, 9).

**Claim:** Every input of the proof route is a target here, a named supplier section or a pinned declaration.

**Witness:** Preservation of the Jordan decomposition by an arbitrary morphism of algebraic groups GL(V_1)×⋯×GL(V_k) → GL(W) is owned by ReductiveGroups Layer 4 on main (`TauCetiRoadmap/ReductiveGroups/README.md:432–434`: Jordan decomposition “functorial under representations”), which neither the Needs line nor the contract names. The pinned Tau Ceti theorems on `LinearMap.GeneralLinearGroup.jordanDecomposition` (`TauCeti/LinearAlgebra/JordanChevalley/{Functoriality,Prod,TensorProduct,ScalarExtension,Multiplicative}.lean`) cover only conjugation by a linear equivalence, `prodMap`, `tensorProduct`, scalar extension and `jordanDecomposition_map₂` (Multiplicative.lean:312), whose hypotheses `map_isSemisimple`/`map_isUnipotent` are exactly what must be supplied for a general ρ. The additive decomposition on 𝔤𝔩, used for the nilpotency of dρ(N), is not among them either.

**Repair:** Add “ReductiveGroups Layer 4 (Jordan decomposition, functorial under representations)” to the Needs line at 4577–4580 and a sentence “Layer 4: the Jordan decomposition of elements and its functoriality under representations, used by *wd-algebraic-composition* for Frobenius semisimplicity and the nilpotency of dρ(N)” in the ReductiveGroups contract at 522–531. State the nilpotency route in the target: either the additive Jordan decomposition on Lie algebras from Layer 4, or dρ(N) = log ρ(exp N), where ρ(exp N) is unipotent by Layer 4 and the identity ρ(exp(tN)) = exp(t·dρ(N)) is the one-parameter-subgroup statement of Layer 5P. Tested on ρ = Sym², N² = 0 on E²: ρ(exp N) is unipotent with a Jordan block of size 3 and its logarithm is dSym²(N), nilpotent of order 3, not 2.

## R03 (P3) — The characteristic-p Check contrasts a carrier the target does not use and misplaces the characteristic-zero hypothesis

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:4593–4595` (“the symmetric tensors and the symmetric power are not isomorphic GL(V)-modules … the characteristic-zero hypothesis of the raw fields is used for the identification”), and `:4566–4568` (“over E these are isomorphic GL(V)-modules”).

**Claim:** Characteristic zero is needed to identify Mathlib's `Sym[E]^m V` with the degree-m piece `TauCeti.SymmetricAlgebra.homogeneousSubmodule`.

**Witness:** At the Mathlib pin `Sym[R]^n M` is the quotient of `⨂[R]^n M` by the permutation relation (`Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:43–52`), and the degree-m piece of the symmetric algebra is the quotient of the same tensor power by the same relations: the two carriers are isomorphic over every commutative ring, with no characteristic hypothesis. Neither is the submodule of symmetric tensors (invariants), so the Check's non-example is about a third object. Characteristic zero is used elsewhere in the target: in `Sym^{n−1}∘Sp(2) ≅ Sp(n)` and the single-Jordan-block Check, since d Sym^{n−1}(N) f_j = j·f_{j−1} has coefficient j, which vanishes over 𝔽_p when p | j. Over 𝔽_3 with n = 4, d Sym³(N) kills f_3 and f_0 both, two Jordan blocks, not Sp(4).

**Repair:** At 4566–4568 write that both carriers are quotients of the m-th tensor power by the permutation relations and are isomorphic over every commutative ring. Replace the Check at 4593–4595 by: over 𝔽_3, Sym³∘Sp(2) has d Sym³(N) f_0 = 3f_1 = 0, so its monodromy has two Jordan blocks and it is not Sp(4): the characteristic-zero hypothesis is used for `Sym^{n−1}∘Sp(2) ≅ Sp(n)` and the Jordan-block Check, not for the identification of the two carriers. The invariants-versus-coinvariants contrast may stay only if it names the invariant submodule as a carrier the target does not use.

## R04 (P3) — The Ber87 citation still covers a claim the passage does not make (r4 R01, not repaired)

**Location:** `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md:695–702`, especially “It is not closed under extensions in Rep A G ([Ber87] §1.1, p. 3).”

**Claim:** The cited passage supports the abelian-category construction for an arbitrary commutative A and topological G and the failure of extension closure in Rep A G.

**Witness:** Unchanged since fa1d0be (the diff touches lines 90–98, 526–531, 4545–4595 and 5308–5312 only). Ber87 §1.1, printed p. 3 (the previous report's lines 78–110), treats nondegenerate modules over idempotented rings and states neither claim.

**Repair:** As in the previous report: state the arbitrary-coefficient construction directly (subobjects and quotients keep open stabilisers, a finite sum has the finite intersection of stabilisers, every element of a colimit lies in a finite sum, limits are the smooth parts of limits), scope the Ber87 citation to its idempotented-module analogue, say extension closure fails in general, and add the control G = (ℤ₂,+), A = ℚ₂, ρ(t) = [[1,t],[0,1]]: the subline ℚ₂e₁ and the quotient are smooth, e₂ has stabiliser {0}, so the extension is not smooth, while for discrete G every representation is smooth.

## Previous findings

- R01 — not repaired: the passage at 695–702 still reads “It is not closed under extensions in Rep A G ([Ber87] §1.1, p. 3)” with the arbitrary-A, arbitrary-G abelian-category claim attributed to that section; re-raised as R04 above.

## Verified sound

### The changed passages

The diff adds *wd-algebraic-composition* (4548–4595), lists it under SR.5.2's ownership (93–96), adds the ReductiveGroups Layer 2 contract sentence (529–530) and the [Tat79] reference (5311–5312). Nothing outside the folder changed (`git diff --stat origin/main...HEAD` outside the folder is empty). `Suggested.lean` is byte-identical to the head r4 read; its 25 declarations, the signature inventory and the headline list are unchanged, so the headline and padding audit of r4 stands.

Cross-roadmap citations in the new passage, resolved on main: ReductiveGroups Layer 2 (`TauCetiRoadmap/ReductiveGroups/README.md:227–231`: Lie(G), the differential of a homomorphism, Ad) supplies dρ and the identity ρ(g)dρ(X)ρ(g)⁻¹ = dρ(Ad(g)X); Layer 5P (`:460–464`) supplies the polynomial exp/log on unipotent groups, its restriction to subgroups and Lie algebras, and the polynomial one-parameter subgroup g^t; Layer 4 (`:432–434`) supplies the Jordan decomposition functorial under representations (R02: used but not cited). Internal citations *wd-raw-parameters* (4435), *wd-parameter-operations* (4521) and *nilpotent-exp-log* (4473) exist and precede the new target; the Sp(n) convention used is the one at 4529–4530 (r(w)e_i = ω(w)^i e_i, Ne_i = e_(i+1), Ne_(n−1) = 0).

Pinned declarations opened, with their types elaborated by `#check` in a scratch file at the pins (Mathlib f6090c70, Tau Ceti 358314d4):

| Pinned location | Content and boundary |
|---|---|
| `Mathlib/LinearAlgebra/TensorPower/Symmetric.lean:43–60` | `SymmetricPower R ι M` is the quotient of `⨂[R] ι M` by the permutation relation; `Sym[R]^n M` is the `Fin n` case, scoped in `TensorProduct`. At the pin the API is `mk`, `tprod`, `range_mk`, `span_tprod_eq_top` and the module structure: no `lift` or `map`, so the GL(V)-action on this carrier is the roadmap's own construction, as the target says (“functorial in V”). |
| `TauCeti/LinearAlgebra/SymmetricAlgebra/Homogeneous.lean:46,54` | `TauCeti.SymmetricAlgebra.homogeneousSubmodule R M n : Submodule R (SymmetricAlgebra R M)`, over any commutative semiring; `Semilinear.lean:128` gives its functoriality `homogeneousSubmoduleMapₛₗ`. |
| `TauCeti/LinearAlgebra/JordanChevalley/Multiplicative.lean:231` | `LinearMap.GeneralLinearGroup.jordanDecomposition` needs `[Field K] [PerfectField K] [FiniteDimensional K V]`; characteristic zero is perfect, so the raw fields satisfy it. Functoriality theorems listed under R02. |
| `Mathlib/LinearAlgebra/PiTensorProduct/Basic.lean` | `PiTensorProduct R s` exists with the expected universe signature. |

Ownership by object: `roadmaps grep` for *wd-algebraic-composition*, for “symmetric power” within 80 characters of Weil/WD/parameter, and for `Sym^` applied to a parameter finds only this roadmap (README 93, 530, 4548, 4575) across main and the 442 open heads; a grep of every README on main for `Sym^` near Weil/parameter finds nothing. No roadmap on main or at a readable open head builds composites of Weil–Deligne parameters with algebraic representations, so this roadmap is the owner, consistent with its ownership of the lower linear theory at 93–99. The ArithmeticGaloisRepresentations consumer named at 97–98 is not on main under that folder name, as in r4.

### Gate, dependency check, elaboration

Gate rerun on 6e0b929: `set_option=0 blob=0 latex=0 tex=3 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 FAIL`, the three `tex` lines of R01; the worker's run adds `build=0`.

Dependency check:

```text
depcheck: 205 roadmaps, 1666 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; SmoothRepresentationsOfLocalGroups is at position 22 of the merge order, after ReductiveGroups and ClassFieldTheory on main. The new Needs line adds no supplier beyond ReductiveGroups and Mathlib/Tau Ceti.

`lake env lean TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/Suggested.lean`: exit 0, 12 `declaration uses 'sorry'` warnings, nothing else. The `#check` probe of the four pinned names and of the `Sym[E]^3 V` notation elaborated with exit 0.

### Seeded sample

Only “Composition with an algebraic representation and symmetric powers” falls in the diff. The other 14 sample targets (compact open neighbourhood basis, change of coefficients, pro-p Iwahori torus, compact representations, admissibility of irreducibles, cuspidal splitting, pseudoroots, Hall–Littlewood, parabolic descent, unitary triangular matrix, GSp₄ spin polynomial, universal Whittaker projective, segments, highest-derivative adapter) are untouched at this head and keep the r4 verification against Ber92, Cas95, Kon03, TV, LTXZZ, Hel16, AKY, MS and EH.

| Sample target | Source and hypothesis check | Outcome |
|---|---|---|
| Composition with an algebraic representation and symmetric powers, 4548 | del73 line 1872–1877, Définition 8.4.1, printed p. 568 (page marker 68 is printed 568): a representation of the Weil–Deligne group over a characteristic-zero field E is (ρ′,N) with ρ′ finite-dimensional and N nilpotent satisfying (8.4.1.1); the composite ρ∘(r,N) is shown to satisfy exactly these fields, with the arithmetic-degree transport already checked in r4. Deligne does not state the Sym^{n−1} identity; the roadmap proves it as its own target. [Tat79] §4.1 (the sp(n) example) is paywalled, see Not verifiable; the Sp(n) convention agrees with the one at 4529–4530. | Mathematics passes; R02 (citation of Layer 4) and R03 (one Check). |

### Computed adversarial pass

New rows for the changed target; the 173 rows of the previous report for untouched statements are carried below.

| Statement and line | Instances and computed values on the two sides | Result / change |
|---|---|---|
| ρ∘(r,N) is a raw parameter (4552–4556) | k = 1, ρ = id: returns (V,r,N). k = 0: ρ : 1 → GL(W) gives (W, trivial, 0), kernel W_F open, 0 = q^{deg}·0. Sp(2), q = 3, ρ = det: det r(Φ) = 3, dρ(N) = tr N = 0, relation 0 = 3·0. ρ = Sym², Sp(2), q = 3, basis f_0 = e_0², f_1 = e_0e_1, f_2 = e_1²: dSym²(N): f_0 ↦ 2f_1 ↦ 2f_2 ↦ 0, nilpotent of order 3; r(Φ)dSym²(N)r(Φ)⁻¹ f_0 = 2·3 f_1 = 3·dSym²(N)f_0. The geometric convention q^{−deg} would give 2/3 ≠ 6. | Pass / — |
| Jordan decomposition and Frobenius semisimplicity (4553–4560) | Sp(2), q = 3, r(Φ) = diag(1,3): Sym² gives diag(1,3,9), semisimple. Non-semisimple r(Φ) = [[1,1],[0,1]]: Sym² is unipotent with one block of size 3, not semisimple, so only the stated direction holds. | Pass; R02 cites the owner. |
| Exponential identity (4561–4562) | N² = 0 on E², t = 1: Sym²(1+N)f_0 = (e_0+e_1)² = f_0 + 2f_1 + f_2; exp(dSym²N)f_0 = f_0 + 2f_1 + ½·2f_2 = f_0 + 2f_1 + f_2. Requires ½ ∈ E; (dSym²N)² f_0 = 2f_2 ≠ 0. | Pass / — |
| The five instances (4562–4565) | Dual: (1+tX)^{t,−1} = 1 − tXᵗ + O(t²), differential −Xᵗ; on Sp(2) weights 1, ω⁻¹ and −Nᵗ, equal to Sp(2)∨ at 4531. Tensor of two rank-one parameters: differential 0⊗1+1⊗0 = 0 and product character. det: trace of a nilpotent is 0 over any field. Line twist: N⊗1 + 1⊗0 = N on V⊗L. | Pass / — |
| Sym^m carrier, dimension (4566–4572) | dim V = 2, m = 2: binom(3,2) = 3 = #{e_0², e_0e_1, e_1²}; dim V = 0, m = 0: binom(0,0) = 1 = dim E; dim V = 0, m = 1: binom(0,1) = 0. The two carriers are both quotients of ⨂^m V by the permutation relation, over every commutative ring. | Pass; R03 on the Check. |
| Sym^0, Sym^1, twist, zero monodromy (4573–4574) | Sym^0∘Sp(2) = (E, 1, 0) = Sp(1); Sym^1 = identity instance. m = 2, χ(w) = c: (c·r)^{⊗2} on Sym² is c²·Sym²(r) = Sym²(r)⊗χ²; N unchanged. N = 0: dSym^m(0) = 0. | Pass / — |
| `Sym^{n−1}∘Sp(2) ≅ Sp(n)` (4575) | n = 1: Sp(1). n = 2: Sp(2). n = 3: f_j ↦ (2−j)f_{j+1}: f_0 ↦ 2f_1 ↦ 2f_2 ↦ 0; with f′_0 = f_0, f′_1 = 2f_1, f′_2 = 2f_2 one gets Nf′_j = f′_{j+1}, weights 1, ω, ω²: Sp(3) exactly, no twist. Over 𝔽_3, n = 4: f_0 ↦ 3f_1 = 0, two Jordan blocks, not Sp(4): characteristic zero is used here. | Pass; R03 relocates the hypothesis. |
| Check 1, Jordan block (4584–4585) | n = 3, Ne_2 = e_1: f_2 = e_2² ↦ 2e_1e_2 = 2f_1; f_1 = e_1e_2 ↦ e_1² + 0 = f_0; f_0 ↦ 0: j·f_{j−1} with j = 2, 1, 0. One block of size 3 in characteristic 0 and in characteristic 3; in characteristic 2 the coefficient 2 vanishes and the block splits. | Pass / — |
| Check 2, weights (4586–4589) | r(w)Nr(w)⁻¹ f_j = ω^{−j}·(n−1−j)·ω^{j+1} f_{j+1} = ω·N f_j: the relation holds with q^{deg w}, each weight raised by one. | Pass / — |
| Check 4 (4593–4595) | 𝔽_2, m = 2, V = E²: in the quotient (e_1+e_2)² = e_1² + e_2² and {e_1², e_2²} spans a GL₂-submodule of dimension 2; in the invariants of ⊗² the vector e_1⊗e_2 + e_2⊗e_1 spans a trivial line: non-isomorphic. True, but the invariants are neither carrier of the target and the identification of the two quotients needs no characteristic hypothesis. | R03 |
| Functoriality and transport (4557–4559) | ρ′∘ρ: d(ρ′∘ρ) = dρ′∘dρ (Layer 2); g with grg⁻¹ = r′, gNg⁻¹ = N′: ρ(g)ρ(r)ρ(g)⁻¹ = ρ(r′), ρ(g)dρ(N)ρ(g)⁻¹ = dρ(Ad(g)N) = dρ(N′). Identity ρ gives the identity on parameters. | Pass / — |

Carried from the previous report (PRREVIEW-SmoothRepresentationsOfLocalGroups~4, “Computed adversarial pass”), unchanged at this head since the diff touches none of these statements; line numbers are those of fa1d0be, shifted by +1 after line 90, +3 after line 526 and +54 after line 4545 at this head: van-dantzig (578); is-smooth (611); smooth-vectors (631); smooth-rep-category (657); smooth-rep-abelian (692); smooth-discrete-comparison (709); compact-open-invariants (736); unit-pro-order (760); averaging-projector (801); invariants-exact (827); admissible (840); finiteness-conditions (875); smooth-character (901); smooth-dual (927); coefficient-change (955); smooth-centre (976); locally-constant-compact-support (1021); open-closed-sequence (1046); a-valued-haar-measure (1072); integration (1099); convolution-algebra (1131); hecke-idempotent (1162); permutation-hecke-algebra (1191); hecke-ring-comparison (1240); locally-unital-algebra (1270); hecke-module-equivalence (1302); corner-irreducibles (1325); bernstein-centre-corners (1347); l-adic-separatedness (1379); iwahori-decomposition (1403); positive-hecke-homomorphism (1429); strongly-positive-localisation (1485); pro-iwahori-torus (1498); klingen-positive-hecke (1522); iwahori-matsumoto (1541); bernstein-presentation (1571); iwahori-hecke-centre (1594); grothendieck-abelian (1633); derived-smooth-category (1646); k-injective-resolutions (1673); derived-invariants (1695); dg-enhancement (1722); compact-generation (1753); derived-smooth-dual (1769); central-ext-vanishing (1814); derived-hecke-algebra (1825); smooth-induction (1874); compact-induction (1893); frobenius-reciprocity (1911); induced-invariants (1926); induction-exactness (1937); induction-in-stages (1947); l-sheaf-model (1960); mackey-filtration (1986); modulus-character (2003); jacquet-module (2051); jacquet-lemma (2072); parabolic-induction (2083); first-adjointness (2102); induced-contragredient (2113); geometric-lemma (2131); principal-series-jacquet (2149); jacquet-invariants (2163); casselman-pairing (2192); borel-casselman-invariants (2207); whittaker-functionals (2225); compact-representations (2295); cuspidal-representations (2323); harish-chandra-compactness (2348); jacquet-subrepresentation (2365); admissibility-of-irreducibles (2374); compact-induction-criterion (2397); hecke-algebra-decomposition (2421); commutative-subalgebra-bound (2469); uniform-admissibility (2478); finitely-many-cuspidals (2494); unramified-characters (2530); finite-length (2579); cuspidal-support (2594); principal-series-constituents (2623); generic-irreducibility (2646); bernstein-components (2667); cuspidal-splitting (2699); bernstein-decomposition (2731); noetherian (2743); bernstein-centre-blocks (2754); finite-type-corners (2773); universal-unramified-twist (2789); centre-compatibilities (2817); square-integrable-tempered (2832); casselman-criterion (2856); harish-chandra-tempered-support (2881); langlands-classification (2894); borel-casselman-block (2914); iwahori-components (2929); steinberg (2957); isotypic-quotient-regular (2979); stabilization (3020); jacquet-lemma-smooth (3041); jacquet-duality (3053); second-adjunction-unit (3066); second-adjointness (3100); satake-transform (3148); twisted-weyl-invariance (3175); satake-isomorphism (3207); torus-character-dictionary (3217); frobenius-component-invariants (3227); pseudoroot (3243); spherical-parameter (3272); c-group-formulation (3287); gln-generators (3312); hall-littlewood (3325); macdonald-formula (3370); parabolic-descent (3377); paired-unitary-parameter (3416); unitary-genericity (3433); unitary-weyl-traces (3461); unitary-triangular-transform (3472); unitary-isotropic-counts (3489); unitary-spherical-coefficients (3503); unitary-even-formulas (3525); unitary-odd-formulas (3542); gsp4-spin-polynomial (3554); gsp4-galois-comparison (3578); finite-discrete-cup-comparison (3588); derived-satake (3607); unitary-iwahori-center (3624); twisted-coinvariants (3674); mirabolic-derivatives (3710); derivative-exactness (3759); schwartz-submodule (3773); essentially-aig (3797); distinguished-cuspidal-types (3841); type-projective-construction (3922); stable-operator (4010); integral-second-adjointness (4032); integral-blocks (4194); modular-generic-segments (4216); type-projectives (4252); universal-whittaker (4275); co-whittaker (4336); universal-domination (4381); reduced-family-reconstruction (4390); segment-representations (4401); wd-raw-parameters (4432); nilpotent-exp-log (4470); wd-parameter-operations (4518); wd-complete-coefficients (4548); full-wd-construction (4596); wd-frobenius-semisimplification (4624); classical-llc-normalization (4652); integral-llc-centre (4698); llc-family-conditional (4722); tensor-endomorphisms (4764); ext-support-orthogonality (4778); cg-distinct-block (4794); cg-derived-projector (4807); highest-derivative-adapter (4818); crossed-cocycles (4866); finite-wild-discretization (4902); finite-wild-representability (4916); ell-adic-extension (4939); wild-strata (4952); twisted-component-finiteness (4971); tame-torus-engine (4982); frobenius-quotient-finite (5017); excursion-algebra (5028); excursion-invariant-comparison (5055); z-finite (5073); depth-generators (5101); cuspidal-stable-lattice (5113); cuspidal-embedding (5141); stable-contracting-hecke-operator (5160).

The three rows the new target depends on (wd-raw-parameters, nilpotent-exp-log, wd-parameter-operations) were re-read at this head: the Sp(2) relation with q = 3 and the (r,N) ≅ (r,aN) statement are as r4 recorded, and the new target's Sp(n) agrees with their convention.

## Not verifiable

- **[Tat79]**, J. Tate, *Number theoretic background*, PSPUM 33 (1979) Part 2, cited at 4576 for §4.1: the DOI 10.1090/pspum/033.2/546607 and the AMS chapter PDF both redirect to a login gateway, so the sources service found no legal text; it is recorded in the job's `needs-references.toml` and should be cited by its locator as `uncertified`. The sp(n) example it is cited for was recomputed above against the roadmap's own Sp(n) convention at 4529–4530.
- The service's fetch of [Del73] recorded a `del73` entry in `packages/SmoothRepresentationsOfLocalGroups/sources.toml` (which did not exist before); this review made no edit of its own to that file.
- BH06, Mac, HM18 and Nak remain as in the previous report; none is cited by the changed passage.

## Source issues

- none

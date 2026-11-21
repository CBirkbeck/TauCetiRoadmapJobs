# Review of AdelicHeightsAndSuccessiveMinima (pull request #2883 at 088f604)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/AdelicHeightsAndSuccessiveMinima/`
**Verdict:** needs changes

**Summary.** Every statement I tested is true: the six theorems of `Suggested.lean` and the six Checks survive the degenerate cases and the computed instances, and the file elaborates with `sorry` as its only warning. What blocks is ownership against two roadmaps on main. Layer 3 plans SubspaceTheorem §4.2 a second time (the same K-minimum, attainment, comparisons and two-sided bound, under the same proposed declaration names). Layer 2 claims the extension invariance of the height `H_A`, which DiophantineApproximationAndTranscendence §2.5 owns, and `Suggested.lean` states that invariance and the dual-height identity as this roadmap's headlines. There are four small corrections and two format notes. The human reviewers are asked about the family index's claim of a complete formal proof of the Riemann hypothesis for Dirichlet L-functions, and about two sources that could not be read.

## R01 (P2) — Layer 3 plans SubspaceTheorem §4.2 a second time: the K-minimum, its attainment, the three comparisons and both halves of Minkowski's theorem over `K` are §4.2's deliverables on main, under the same names

An implementer meets two specifications of one object. SubspaceTheorem §4.2 proposes `NumberField.successiveMinimum`, `NumberField.covolume_le_prod_successiveMinimum_pow_mul_measure` and `NumberField.prod_successiveMinimum_pow_mul_measure_le`, and 3.1 states them again under the same short names. The consumer SlopesOfHermitianVectorBundles (pull request #2880, README lines 1066 and 1070) already attributes `NumberField.successiveMinimum` to both roadmaps.

How I know: the SubspaceTheorem README on main (lines 844–879) defines the minimum for "a body `B` as in 4.1" as the same infimum over `t > 0`, with `0` for `l ≥ card ι`. It lists the same attainment statement, the comparisons `λ l ≤ μ l`, `μ l ≤ λ (d l)` and `λ (d (l + 1) − 1) ≤ c_K · μ l`, and the same displayed two-sided bound. Lines 867–868 say the lower bound is the only statement there that uses balancedness, so the body enters only through compactness, convexity, symmetry and balancedness. In this README, 3.1 (lines 99–112) defines the minimum "exactly as in SubspaceTheorem §4.2" and repeats that list almost word for word. The route (line 118) says §4.2's proofs "apply verbatim". The scope (lines 162 and 164) claims the statement for every balanced body and calls §4.2 "the instance `B = approxBody` of 3.1", which makes a roadmap on main a special case of a later one: the merge order reversed. The reading of "a body as in 4.1" does not change this, whether it means the approximation body (as line 93 takes it) or any body with the properties listed in 4.1: the minimum is a function of `B` in both roadmaps.

Smallest change: make SubspaceTheorem §4.2 the one owner. Either (a) read its "body as in 4.1" as a compact convex symmetric body with `0` in its interior that is balanced over the completions, cite §4.2 for the minimum, attainment, comparisons and both bounds, and keep in 3.1 only what is new here (the Checks that a product of Hermitian balls is balanced and is not an approximation body). Or (b), if §4.2 covers only approximation bodies, cite §4.2's definition of the minimum instead of defining it again, state in 3.1 only the statements for the bodies §4.2 does not cover, and give them declaration names that do not collide with §4.2's. Either way, line 93, the scope paragraph and the docstrings of the two Layer 3 theorems of `Suggested.lean` change to match. SubspaceTheorem's open revision (pull request #2678) keeps §4.2's wording but drops the proposed Lean names, so cite it by section.

## R02 (P2) — Layer 2 and DiophantineApproximationAndTranscendence §2.5 both own the height `H_A` and its extension invariance

With two owners for one construction, an implementer cannot tell whether `adelicHeight` is a new definition or DAT's. The roadmap's acceptance test also contains two theorems that DAT §2.5, not this roadmap, plans to prove.

The DAT README on main (lines 1319–1324) builds `adelicSymmetricPowerHeight` for `A ∈ GL_n(𝔸_K)`, with Euclidean and max norms normalised by `[K:ℚ]` and a subspace height through the exterior power, and makes the restricted product, the extension invariance and the local isometric reduction part of that target. Lines 1347–1350 prove the dual-height identity. This README identifies its height with DAT's: line 38 says it "is the height `H_A` of DiophantineApproximationAndTranscendence §2.5". Line 162 then claims ownership of `adelicHeight`, `adelicSubspaceHeight` and "invariance under finite extension". Line 164 says the opposite: "the height `H_A` as a construction, … its extension invariance" and the dual-height identity are not owned here. `Suggested.lean` states the extension invariance (`adelicSubspaceHeight_span_image`, line 101) and the dual-height identity (`adelicSubspaceHeight_eq_mul_euclideanDual`, line 114) among this roadmap's headlines (module docstring, lines 17–27). Line 23 also says DAT builds the height "without naming the height of a vector or of a subspace", but DAT names the construction `adelicSymmetricPowerHeight`.

Smallest change: keep DAT §2.5 as the owner. In the scope paragraph:
- say that `adelicHeight` and `adelicSubspaceHeight` are this roadmap's names for DAT §2.5's construction;
- own only what §2.5 does not state: the value at `A = 1`, change of basis, the whole space, lines and the case `n = 1`;
- move invariance under finite extension to "Not owned".

In `Suggested.lean`, either drop the two theorems, or say in their docstrings and in the module docstring that they are DAT §2.5's theorems written in these names to fix the interface, not targets of this roadmap. Correct line 23 as well.

## C01 — The README says the lower half of the real Minkowski theorem is SuccessiveMinima §2.1 and only the upper half is in the library, but the pinned Tau Ceti has both halves

Line 164 says the lower half "is SuccessiveMinima §2.1, and its upper half is in the Tau Ceti library". With the route (line 123), *Needs* (line 131), Dependencies (line 152) and the SuccessiveMinima contract (line 180), it sends an implementer to a roadmap target for something already proved. `ZLattice.two_pow_div_factorial_mul_covolume_le_prod_successiveMin_mul_measureReal` (`TauCeti/NumberTheory/GeometryOfNumbers/MinkowskiSecond.lean`, line 728) is SuccessiveMinima's `minkowski_second_lower` (2.1.4) under the same hypotheses. Name it in the route and under "From Tau Ceti", next to the upper half. SuccessiveMinima §2.1 can stay as the roadmap item it realises.

## C02 — Neither 2.5a nor 3.1 cites a source at a claim, although Bombieri–Vaaler states the shape of 3.1

The References tie Bombieri–Vaaler and Bombieri–Gubler to 3.1 only "through SubspaceTheorem §4.2", so a reader cannot see which bound rests on which source.
- **Bombieri and Vaaler 1983, Theorem 3 (p. 18):** the upper bound `(λ_1⋯λ_L)^d V(S) ≤ 2^(dL)` for a product of open, bounded, convex, symmetric `S_v` at the infinite places and lattices at the finite places. It needs nothing more, which matches 3.1's remark that the upper bound needs no balancedness.
- **Theorem 6 (p. 23):** a lower bound with sharper constants. It assumes condition (3.16), that `S_v` is stable under multiplication by complex numbers of modulus 1 at complex places; for product bodies, together with convexity, that is balancedness.

Cite these at the claims, and say that 3.1's lower-bound constant `c_K^(−dn)·2^(dn)/(dn)!` comes from the real theorem by the route given, not from a source.

## C03 — Three sentences of the description do not match the head

- **"Its headline theorems are these."** It closes the second paragraph with nothing after it. Would read: "Its headline theorems are the four properties of `H_A` and the two bounds of Minkowski's theorem over `K` that the README's overview states."
- **"its docstring says which other headlines are not statable and which carriers they lack".** The module docstring says both headlines are statable, and lists the clauses it leaves out because they are not headlines. Would read: "its docstring lists the README clauses it does not state."
- **"Sub-roadmaps of the family and other roadmaps that are still in open pull requests merge first".** Every supplier of this roadmap (DiophantineApproximationAndTranscendence, SubspaceTheorem, SuccessiveMinima) is on main. Would read: "Its suppliers are all on main."

## C04 — The family index here differs from the one other pull requests of the family carry, and no order is stated

The description says the index "is carried, with identical content, by every pull request of the family". At the heads of pull requests #2877 and #2898, the family `README.md` differs from this one: it has another sentence on the formal proof the family follows, and other one-line descriptions and order for several members. Whichever merges second conflicts with or overwrites the other. Rebase this pull request on the version of the index meant to stand, or say in the description which pull request carries the index.

## N01 — Layer numbering

The layers are numbered 2 and 3, and Layer 2's only item is 2.5a, after DAT §2.5. With no Layer 0 or 1, a reader of the coverage by layer looks for layers that do not exist. Numbering from 1 would read better, with the link to DAT §2.5 kept in prose as line 11 already does.

## N02 — Pinned declarations cited without namespace

Several pinned declarations are cited without their namespace or through a roadmap:
- `NumberField.mul_mem_approxBody` and `approxBody` are `TauCeti.NumberField.mul_mem_approxBody` and `TauCeti.NumberField.approxBody` at the pin;
- `exists_linearIndependent_comp_finrank_mul`, attributed to DAT §2.8, is `TauCeti.exists_linearIndependent_comp_finrank_mul`.

List them under "From Tau Ceti" with these names.

## Questions for the author

- Is DAT §2.5's `adelicSymmetricPowerHeight` the height of vectors for `A ∈ GL_n(𝔸_K)`, so that `adelicHeight` is a second name for it, or only the height on symmetric powers? DAT's sentence does not settle it, and the repair in R02 reads it the first way. If it is the second, 2.5a would say that `adelicHeight` is its degree-one case.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `adelicHeight` (2.5a) | `ℚ`, `n = 2`, `A_∞ = diag(1, e^(−c))`, `A_p = 1`, `x = e₂` | infinite factor `(e^(−2c))^(1/2) = e^(−c)`, finite factors 1; total `e^(−c)` = Check | holds |
| `adelicHeight`, wrong exponent | `ℚ(i)`, `A = 1`, `x = (1, 1)` | exponent `mult/d`: `√2^(2/2) = √2` (value over `ℚ`); exponent `1/d`: `2^(1/4)` | Check separates them |
| `adelicHeight`, `n = 1` Check | `ℚ`, `A_∞ = 2`, `A_p = 1`, `x = 3/2` | `|2x|_∞ = 3`, `|x|_2 = 2`, `|x|_3 = 1/3`; product `2` = `|det A|_𝔸` | holds |
| `adelicSubspaceHeight`, `U = 0` | any `A` | Plücker vector of the empty family `1`, `Λ⁰A = (1)`; height `1` = README | holds |
| `adelicSubspaceHeight`, index order | Cauchy–Binet on minors matrix vs `TauCeti.plucker` | `(Λ^pA·y)_I = Σ_J det A_{I,J}·plucker(x)_J = plucker(Ax)_I` | conventions agree |
| `adelicSubspaceHeight_one` | `ℚ`, `U = ℚ(1,2)`, `U = ℚ(2,2)` | `height2(1,2) = √5`; `(2,2)`: `√8·½ = √2` = DAT's subspaceHeight Check | holds |
| `adelicSubspaceHeight_top` | `ℚ`, `n = 1`, `A_∞ = 2`; `L = ℚ(i)` over `ℚ` | over `ℚ`: `2 = ideleNorm(2)`; over `ℚ(i)`: `|2|^(2/2) = 2`, product formula removes `y` | holds |
| `adelicSubspaceHeight_top`, `n = 0` | `ι` empty | LHS: Plücker `1`, `Λ⁰A = (1)`, height `1`; RHS `ideleNorm 1 ^ (1/d) = 1` | holds |
| `adelicSubspaceHeight_span_image` | `K = L = ℚ`, `L′ = ℚ(i)`, `A = 1`, `U = ℚ(1,1)` | over `ℚ`: `√2`; over `ℚ(i)`: `(√2)^(2/2) = √2` | holds |
| dual-height identity | `ℚ`, `A_∞ = diag(1, e^(−c))`, `U = ℚe₁`; `U = 0` | LHS `1`; RHS `e^(−c)·e^c = 1`. `U = 0`: `1 = e^(−c)·e^c` | holds |
| dual identity, wrong variant `A^(−1)` | `A_∞ = [[1,1],[0,1]]`, `U = ℚe₁` | LHS `1`; `A^(−t)e₂ = (0,1)`: RHS `1`; `A^(−1)e₂ = (−1,1)`: `√2` | transpose needed; Lean has `ᵀ` |
| `successiveMinimum` | `ℤ ⊂ ℚ`, `B = [−1, 1]`; `l ≥ n` | `μ 0 = inf{t ≥ 1} = 1`; `l ≥ n`: `sInf ∅ = 0` | matches README |
| `IsBalancedOverCompletions` | `ℚ(i)`: unit disc; rectangle `ε < 1` | disc: `|az| ≤ 1` stays; rectangle: `a = i`, `x = 1` gives `i ∉ B` | separates |
| lower bound (3.1) | `ℚ,ℤ,[−1,1]`; `ℚ,ℤ²`, disc; `ι` empty | `2 ≤ 2`; `2 ≤ π`; `n = 0`: `covol = μ{0} = μ.real B` | holds |
| lower bound, negative control | `ℚ(i)`, `ℤ[i]`, rectangle `ε < 1/2` (not balanced) | LHS `1·2²/2!·1 = 2`; RHS `μ₀²·4ε = 4ε < 2` | fails; hypothesis excludes it |
| upper bound (3.1) | `ℚ(i)`, `ℤ[i]`, rectangle; `B = {0}` | `1²·4ε ≤ 4·1`; `B = {0}`: `0 ≤ covol` | holds without balancedness |
| third comparison | `ℚ(i)`, `ℤ[i]`: rectangle; disc | rectangle `λ₁ = 1/ε > 1 = c_K μ₀`; disc `λ₁ = 1 = c_K μ₀` | needs balancedness |
| `μ l ≤ λ (d l)` | `ℚ(i)`, `ℤ[i]`, disc | `μ₀ = 1`, `λ₀ = 1` | holds |
| R01: 3.1 vs SubspaceTheorem §4.2 | main README 844–879 vs lines 99–118 | same infimum, attainment, three comparisons, displayed bound, short names; only the wording of `B` differs | duplicate |
| R02: 2.5a vs DAT §2.5 | main README 1319–1324, 1347–1350 vs lines 38, 162, 164 | DAT builds `H_A`, subspace height, extension invariance; proves dual identity; line 162 claims extension invariance | two owners |
| C01: lower real Minkowski | Tau Ceti `MinkowskiSecond.lean:728` vs SuccessiveMinima 2.1.4 | both: discrete full lattice, Haar `μ`, convex body, `0` interior, symmetric; `2ⁿ/n!·covol ≤ ∏λ·μ.real K` | in library |
| C02: Bombieri–Vaaler | Theorem 3 p. 18; Theorem 6 p. 23 | Thm 3 needs only open convex symmetric `S_v`; Thm 6 adds (3.16) at complex places | supports shape |

- Source locators checked against the text: 2 (Bombieri–Vaaler Theorems 3 and 6); 2.5a and 3.1 carry no locator of their own.
- Library declarations opened at the pins: Mathlib `NumberField.prod_abs_eq_one` (ProductFormula.lean:98), `FinitePlace.norm_def` (Completion/FinitePlace.lean:182, ideal-normalised), `NumberField.house` (House.lean:38), `normAtPlace` (CanonicalEmbedding/Basic.lean:319); Tau Ceti `height2` (Arakelov/Basic.lean:65), `subspaceHeight` (Arakelov/Subspace/Basic.lean:292, :322), `plucker` (ExteriorPower/Plucker.lean:104), `euclideanDual` (Coding/EuclideanDual.lean:42), `ideleNorm` (Ideles/Norm/Basic.lean:283), `adeleExtension` (Adeles/Extension.lean:184), `Submodule.mixedImage` (MixedImage.lean:120), `ZLattice.successiveMin` (ZLattice/SuccessiveMinima.lean:111), both real Minkowski halves (MinkowskiSecond.lean:626, :728), `exists_linearIndependent_comp_finrank_mul` (Extraction/Basic.lean:106), `mul_mem_approxBody` (ApproximationDomain.lean:224).
- Cross-roadmap citations resolved: DAT §§2.5, 2.8; SubspaceTheorem §§4.1–4.3 (main and open revision); SuccessiveMinima §2.1; SlopesOfHermitianVectorBundles §§1.1, 1.3, 1.6, 4.1, 4.3, 4.3a.
- Automatic checks: all passed. Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`.
- Elaboration of `Suggested.lean`: six `declaration uses sorry` warnings and nothing else. `#check @name` for all ten declarations agrees with the README statements, with no binders lost. One-tactic probes (`rfl`, `simp`, `infer_instance`, unfolding `simp`/`norm_num`) fail on all six theorems, so none is padding.
- Pinned Tau Ceti has no adelic height, no K-minimum and no balancedness predicate (searched by object).

Overlap check: read SubspaceTheorem (main and pull request #2678), SlopesOfHermitianVectorBundles (#2880), HeightsForLogSingularMetrics (#2894), GlobalNumberFields (#1339), SuccessiveMinima, HeightsAndUnits and DiophantineApproximationAndTranscendence §§2.5, 2.8. Shared: the K-minima and Minkowski's theorem over `K` (owner SubspaceTheorem §4.2, R01); the height `H_A` and its extension invariance (owner DAT §2.5, R02); the adele extension map and idele norm (owner GlobalNumberFields, realised in Tau Ceti and cited from there). Nothing else.

Source independence: 7 passages compared with 1 source (Bombieri–Vaaler 1983: the definition of the minima, Theorem 3, condition (3.16), the proof of Theorem 6, §III.1, the introduction, and the `successiveMinimum` docstring against (3.2)), none shared. The README has no locators at claims; its three references are cited once each, so no source has a largest share. Contents compared with Bombieri–Vaaler §§I–V: independent. Roy–Thunder and Bombieri–Gubler could not be read. 3.1's wording repeats SubspaceTheorem §4.2's (project text, R01).

Research link: 2.5a names the twisted adelic height of Roy and Thunder's absolute Siegel lemma (1996); 3.1 is the adelic form of Minkowski's second theorem of Bombieri and Vaaler (1983, Theorems 3 and 6), which SlopesOfHermitianVectorBundles consumes for Arakelov slopes. This rests on the README's References and on Bombieri–Vaaler.

## Not verifiable

- Roy and Thunder, An absolute Siegel's lemma (1996): GDZ serves only the cover sheet for this article (Crelle 476), and the DOI resolves to the publisher's paywalled page.
- Bombieri and Gubler, Heights in Diophantine Geometry (2006), Appendix C.2: the DOI resolves to the publisher's page, and no legal copy was found.

## Source issues

- none

## For the human reviewers

- Scope: the family index in this pull request (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 3–11) takes the Riemann hypothesis for all Dirichlet L-functions as end theorem and says the family "follows a complete formal proof"; it cites no published source.
- The index at the heads of pull requests #2877 and #2898 names that proof as an announcement of 20 November 2026, with links. This sub-roadmap's mathematics does not depend on it.
- After R01 and R02, this roadmap keeps the elementary API of DAT §2.5's height and, depending on SubspaceTheorem §4.2's scope, Minkowski's theorem over `K` for other balanced bodies.
- Not tested: Roy–Thunder and Bombieri–Gubler could not be read, so wording and arrangement were checked against Bombieri–Vaaler only.

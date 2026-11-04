# GATE-IntegralLattices~2: answers to the review of `cdfcd0f`

Commit `1c27050b` on the pull-request branch (not pushed), on top of `b78c734`. Files: `TauCetiRoadmap/IntegralLattices/README.md`, `TauCetiRoadmap/IntegralLattices/Suggested.lean`. The review has one comment (CBirkbeck, eleven findings F01–F11), numbered H01–H11 below.

## H01 (CBirkbeck) — applied differently

The cycle was real: OTM §0.3 consumes IntegralLattices §4D's class/spinor interface, and the revision's 5C–5D consumed OTM §0.3 (README rows 5C/5D, N2/N3, the "dependency order is by phase" paragraph). Of the two repairs offered, the second is the one that matches ownership on record (OTM §0.3 and Completed OrthogonalSpinGroups §3A put strong approximation and its Eichler application in OTM), so: N2 and N3 (a duplicate of OTM §§0.1/0.3) are deleted; 5C, 5D, 5E, 5H, the isometry-class half of 3.6.2 and 3.6.3 are deleted and assigned in §*Scope and ownership* and "Where this roadmap stops" to `IntegralLatticesPartII`, which consumes this roadmap and OTM §0.3; no `*Needs:*` line, prerequisite row or supplier row names OTM any more, and the order is IntegralLattices → OTM → `IntegralLatticesPartII`. The factorwise-noncompactness hypothesis and the rank-two exception stay with OTM §0.3 and with 4E (rank 2, owned here); the even indefinite classification 6A keeps its separate rational-standard route and does not use Eichler. `IntegralLatticesPartII` does not exist yet and has to be opened.

## H02 (CBirkbeck) — applied

3B is now stated for `𝒪`-lattices over the valuation ring of any finite extension `K/ℚ_p`: finite free module, symmetric form, nondegenerate after base change to `K`, with scale, norm, dual, `π^i`-modularity, existence and invariance of Jordan splittings (O'Meara 91:9), and invariance of norm ideals/types for unramified `K/ℚ₂` (O'Meara 93:28–29). 3I now takes its `R`-lattice "in the sense of 3B". The requested test is both a 3B Check and a 3I worked value: `R = ℤ₂[ζ₃]`, `f = 4`, Gram `[2]`, rank 1, `𝔰 = 𝔫 = 2R`, type I at `i = 1`, `t = 1`, `b = c = 0`, `d₁ = 1`, `N = 2`. Restriction of scalars is excluded explicitly (it gives rank 2). Cho's theorem is not narrowed.

## H03 (CBirkbeck) — applied

`TauCetiRoadmap/IntegralLattices/Suggested.lean` is now a module: line 1 `module`, the imports become `public import Mathlib` followed by `public import TauCeti.…` (the same 16 modules), and `@[expose] public section` opens before `namespace TauCetiRoadmap.IntegralLattices`; no statement changed. The pinned Tau Ceti modules are themselves modules, the build no longer prints the Lake advisory (`imports Mathlib … consider adding module`), and the gate's import checks still pass (`imports=0 mathlib-subimports=0 no-import-mathlib=0`).

## H04 (CBirkbeck) — applied differently

The pinned Tau Ceti implements the targets listed (and more): I checked the files under `TauCeti/LinearAlgebra/IntegralLattice/` (Basic, Even, Quadratic, Unimodular, Gram, Index, RationalInvariants, Ideals, Level, Signature, RadicalQuotient, Orthogonal/, Examples, RankOne, RootLattice/, Rationalization, Dual/, Discriminant/, Overlattice/, PosDef/) and `FiniteBilinearModule/`, which includes Nikulin's generator decomposition `FiniteQuadraticModule.exists_isometry_prod_pi_generators` (`Decomposition.lean:103`) and the dyadic Gauss-sign values. Old Layers 0 (0A–0G), 1A–1F, 1J, 1K and 2A–2E are deleted as targets; each label now names a row of §*From Tau Ceti* with exact declarations and files, so the many later citations of those labels resolve to Tau Ceti. What stays is what is missing at the pin: the relations 1.8.2 and `l(A)` (1G), the odd-prime Gauss values and 1.11.3 (1H), Milgram (1I), van der Blij (1L), Minkowski's second theorem with an explicit constant `vol(Bₙ)·∏λ_i^{1/2} ≤ 2ⁿ(det L)^{1/2}` (2F), reduction finiteness (2G), and cancellation failure (now 6H). The theta-series claims are corrected: ThetaSeries' `Suggested.lean` imports native Tau Ceti modules, not this file (§*Scope and ownership*, §*Theta series*, §*From other roadmaps*, Layer 8). The folder is not renamed to a Part II: it is the existing roadmap on main whose base is `Completed/IntegralLattices`, and its introduction now says where that base stops; a rename is outside the two files this job may edit.

## H05 (CBirkbeck) — applied

6E (the 24 rows), the Lorentz-kernel Leech model, its checker and the "later model-map target" are deleted; §*Scope and ownership* assigns the 24 lattices to Rank24LatticeConstructions, Layers 3 and 6, and states that this roadmap neither constructs nor consumes them (so the Rank24 → IntegralLattices supply stays one-way). 6E is removed from the Layer-8 exports, the 6D/6E prerequisite row, the ordering section and the references. OTM §4.2 cites "IntegralLattices §6E" for the 24 lattices and their nonisomorphism; that citation now has to point to Rank24LatticeConstructions.

## H06 (CBirkbeck) — applied

New headlines in `Suggested.lean`, each in the README at its milestone: `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight` (rank-8 uniqueness on the native `E₈`, the statement the review tested), `equivalent_one_of_odd_unimodular_posDef_of_le_eight` and `equivalent_one_or_e8_sum_one_of_unimodular_posDef_nine` (6C), `equivalent_of_odd_unimodular_indefinite` (6A odd), `exists_isEven_isUnimodular_isPosDef_iff` (6B), `natCard_isometry_typeE₈RootLattice` (6G), `exists_primitiveEmbedding_iff` and `forall_exists_primitiveEmbedding_iff` with the definition `IsPrimitiveEmbedding` (5G, Nikulin 1.12.2 and 1.12.4), `localDensityCount_succ_eq` with `localDensityCount` (7C), and `IntegralLattice.IsPosDef.volume_ball_mul_prod_sqrt_successiveMinimum_le` (2F). Audit of the rest: 5C–5E/5H/5J-uniqueness left the roadmap (H01); 6D/6H are named in the docstring as not statable (no `D₁₆⁺` at the pin; defining it needs an isotropy proof inside the definition, which would be sorry'd data); 5I is recorded as a correspondence used in proofs, not a headline.

## H07 (CBirkbeck) — applied

Deleted: `exists_bilinearLagrangian_gaussSign_ne_zero`, `twoElementaryAdmissible_independence`, `rankOne_one_characteristic_congruence_fails`, `padicDiscriminant_not_determined_by_cyclicTwoSummand`, `minGenerators_primaryComponent_le`, `exists_minGenerators_primaryComponent_eq`, and in 7E `orthogonalSkewBasisVolume_zero/_one/_two/_three/_pos/_step`, `sphereArea_pos`, `inner_skewMetricCoordinates`. The same pattern removed three more items: `exists_isometry_orthogonalSum_generators`, which restated the pinned `exists_isometry_prod_pi_generators`; the 25-line `#check` catalogue of consumed natives; and the comment block listing what Theta Series takes, which duplicates README Layer 8. Their content stays as README Checks (1G, 1H, 1L, 5B, 5J, 7E).

## H08 (CBirkbeck) — applied

Layer 9 (9A stored columns, the certificate structures `StoredGenusCertificate`/`StoredClassNumberCertificate`, the connectivity/enumeration adapters), the rootlessness checker and its certificate (old 6E supplement) and the "algorithm" constructor in the genus-symbol API are deleted. 9B is now one theorem on finite sets of classes, `isometric_mem_of_sum_eq_genusMass`, with Checks: `Δ = −23`, `{!![2,1;1,12], !![4,1;1,6]}` sums to `1/4 + 1/2 = 3/4` and is complete, `{!![4,1;1,6]}` gives `1/2 < 3/4`; three distinct Gram matrices of `!![2,1;1,12]` sum to `3/4` and miss a class, so pairwise non-isometry is needed. LatticePackingsAndPerfectForms names "IL 9B … the certificate shape"; it now has to consume the theorem.

## H09 (CBirkbeck) — applied

B2: "Cox Theorem 7.7 and its narrow analogue" → Cox Theorem 7.7 (p. 137) for `Δ < 0` only, the oriented `Δ > 0` and split branches owned and proved here, and Cohen §5.2 for both signs, both uncertified. New B2 Checks for `Δ = −3` (one class, trivial `Pic ℤ[ζ₃]`) and `Δ = 12` (two proper classes, `|NarrowPic ℤ[√3]| = 2` because `N(2 + √3) = +1`, `Pic` trivial). B5 now cites Cox Theorems 2.8 (p. 27) and 2.13 (p. 29) and Cohen §5.6; B4 cites Cox §3. B8's hard-theorem row: "Conway–Sloane §2" → equation (1) plus the proper/improper orbit count of B2–B4. Bibliography: mass paper `259–285` → `259–286`; the Kirschmer entry left with Layer 9's tables; Cox, Cohen and Cassels (*Geometry of Numbers*, Ch. VIII) added, marked uncertified. The manifest `sources.toml` is not one of the two files this job may edit and was not changed; these works are not in it and should be recorded there as `uncertified` (paywalled books, cited by locator).

## H10 (CBirkbeck) — applied differently

Done: house headings (`## Scope and ownership`, `## Exact supplier contracts` with `### From Mathlib/Tau Ceti/other roadmaps`, `## How to read the build` with a layer-order paragraph, `## Layer k`, `## Downstream consumers`); every layer now ends with `### Examples` and `### Dependencies`; the API blocks for native objects are deleted, and each remaining block (finite quadratic forms, `ℤ_p` Jordan data, genus symbols, class/genus/spinor genus, quadratic order, mass) ends with three computed Checks; the mass Checks are the reviewer's witnesses: rank 0 `m = m⁺ = 1`, rank 1 `m = 1/2`, `m⁺ = 1`, and `Δ = −23` with `!![4,1;1,6]` having `O = SO = {±I}`, `m = 3/4`, `m⁺ = 3/2`. Every `Suggested.lean` declaration has a docstring and the module docstring has the prescribed form. Not done: the per-layer prerequisite tables remain tables (now under `### Dependencies`), and 3E–3H, B6–B7, 4A–4C, 4F–4G and 7A/7C/7G are still written in the older milestone style without their own Checks lists. Converting them is a rewrite of about 1500 lines, beyond these findings.

## H11 (CBirkbeck) — applied

The sentence ("the smallest lattice where they differ is `A₁ ⊕ A₁`") went with 1F, which is native and no longer a target. The rank-one witness checks out: `L = ⟨4⟩`, `A_L = ℤ/4`, `H = ⟨2⟩` has `b(2,2) = 4·(1/2)² = 1 ≡ 0` and `q(2) = 1/2`; `M = ½ℤ` has Gram `[1]`, integral and odd, `det M = 4/2² = 1`.

## Build, gate and dependency check

- `lake build TauCetiRoadmap.IntegralLattices.Suggested`: `Build completed successfully (9027 jobs)`. 22 `declaration uses 'sorry'` warnings, one per headline theorem. There is no other message: the Lake module-system advisory of H03 is gone since the file became a module (commit `71db65f`).
- Gate: `gate IntegralLattices: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 206 roadmaps, 1684 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. While editing, a heading "Ownership and the direction of supply" made the checker read the ownership tables as supplier rows (UPWARD to AdelicAlgebraicGroups, GeometryOfNumbersAndQuadraticArithmetic, OTM; CYCLE with OTM). The heading is now "Ownership boundaries"; those rows assign ownership and are not supply.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere.
- Signatures: I appended `#check @name` for all 52 declarations of the committed file, built once with the target command above, and restored the file (the worktree is clean at `1c27050b`). Every type carries its binders explicitly (nondegeneracy, evenness, unimodularity, positive definiteness, rank, finite dimension, dyadic exception, `det ≠ 0`, the manifold/Borel/Lindelöf/immersion hypotheses of 7E). No section variable was lost. Compared with the README: `localDensityCount_succ_eq` needs `IsSymm` and `det ≠ 0` (7C: nondegenerate `ℤ_p`-lattice), and `exists_primitiveEmbedding_iff` adds `t₊ ≤ l₊`, `t₋ ≤ l₋` so that natural subtraction cannot truncate. The README states both.

## Ownership and moves

Nothing moved down from a later roadmap. New deferrals: the Eichler-dependent Nikulin theory goes to `IntegralLatticesPartII` (no existing owner: `roadmaps grep` for Theorems 1.13.2/1.14.2/1.14.4 finds none outside this folder; LatticePackingsAndPerfectForms leaves Nikulin's theory to IntegralLattices), and the rank-24 lattices go to Rank24LatticeConstructions (on main). I checked ownership against the open pull requests through `roadmaps grep`/`show` and the OTM (rev 1222) and LatticePackings (rev 1723) checkouts. Consumers to update: OTM (§4.2 cites IL §6E; its downstream section says IL §§7H/7I consume OTM, and IL no longer does), and LatticePackingsAndPerfectForms (IL 9B is now a theorem, not a certificate shape).

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 6B `exists_isEven_isUnimodular_isPosDef_iff` | n = 0, 4, 8; `I₈` | n=0: zero lattice even, disc 1, PosDef vacuous, 8∣0; n=4: `D₄` det 4 not unimodular; n=8: `E₈`; `I₈` odd | holds both ways | none |
| 6C rank 8 (`…_finrank_eq_eight`) | `E₈`, `I₈`, `U⁴` | `I₈` odd (excluded by `IsEven`); `U⁴` indefinite (excluded by `IsPosDef`) | holds | none |
| 6C odd ≤ 8 | n = 0, 8; `E₈ ⊕ I₁` at 9 | n=0 has no odd diagonal, so the statement is vacuous; n=8 odd forces `I₈`; at 9 `E₈ ⊕ I₁` has 2 norm-1 vectors against 18 for `I₉` | holds; bound sharp | 9 handled separately |
| 6C rank 9 | `I₉`, `E₈ ⊕ I₁` | both det 1 and posdef; distinguished by 2 vs 18 norm-1 vectors | both alternatives occur | Lean uses `CartanMatrix.E 8` (the alias `E₈` is deprecated at the pin) |
| 6A odd | `U` vs `⟨1⟩⊕⟨−1⟩`; `E₈²` vs `D₁₆⁺` | same signature (1,1), different parity; definite pair is non-isometric | parity and indefiniteness are needed | none |
| 6G `natCard_isometry…` | factorization; `SO`; `A₂` | 240·126·23040 = 696729600 = 2¹⁴3⁵5²7; `|SO| = 348364800`; `|O(A₂)| = 12 = 2|W(A₂)|` | holds | none |
| 5G 1.12.2 | `S = E₈`, `(8,0)`; `S = ⟨2⟩`, `(1,1)` | complement is the zero lattice; `⟨2⟩ ⊂ U` via (1,1), complement `⟨−2⟩` with `q = 3/4 = −1/4` | holds | subtraction guards `t₊ ≤ l₊`, `t₋ ≤ l₋` |
| 5G 1.12.4 | `t = (0,0)`; `t=(1,0)`, `l=(8,0)`; K3 | trivial `S` ⇒ condition is `8∣l₊−l₋`; `⟨2d⟩ ⊂ E₈` primitive; `ρ ≤ 11` since `2ρ ≤ 22` | holds | README K3 example `ρ ≤ 10` → `ρ ≤ 11`, and its uniqueness clause deleted |
| 7C `localDensityCount_succ_eq` | `⟨1⟩` at 2; `U` at 2; `[p]` at odd p; `A = 0` | 4,4 (ratio 1 = 2⁰); `2^{r+2}` (ratio 2 = 2¹); `2p` for r ≥ 2 (ratio 1); `A=0` gives ratio `p` | holds with `det ≠ 0`, fails without | `det ≠ 0` kept |
| 2F Minkowski II | `⟨a⟩`; `ℤ²`; `diag(1,4)`; `A₂`; `2ℤ⁵+ℤ(1,…,1)`; `E₈`; rank 0 | `2√a = 2√a`; π ≤ 4; 2π ≤ 8; 2π ≤ 4√3; 168 ≤ 512 with attaining vectors of index 2; 64.9 ≤ 256; 1 = 1 | holds; squared-length misreading `2a ≤ 2√a` fails for a ≥ 2 (Check) | none |
| 9B `isometric_mem_of_sum_eq_genusMass` | Δ = −23 genus; rank 0; repeated class | 1/4+1/2 = 3/4; {!![4,1;1,6]} gives 1/2; three Gram matrices of one class give 3/4 and miss a class | holds; pairwise hypothesis needed | none |
| 3B/3I over `ℤ₂[ζ₃]` | Gram `[2]`; `U`; `⟨1⟩⊕⟨3⟩` vs `⟨5⟩⊕⟨7⟩` | t=1,b=c=0,d₁=1,N=2,f=4; U type II at 0; dets 3, 35 ≡ 3 (8), char norms 4, 12 ≡ 4 (8) ⇒ isometric | invariants as stated | none |
| N1 spinor images | odd unimodular rank ≥ 2; `⟨1⟩⊕⟨1⟩` at 2; rank 1 | `ℤ_pˣ(ℚ_pˣ)²`; `{1,2,5,10}` mod squares from reflections in (1,0),(1,1),(1,2) = norms of `ℚ₂(i)`, index 2; trivial | holds | Checks added |
| 1G/1H Checks | `u(2)` vs `v(2)`; `oddCyclic 3 θ`; `q_θ^{(5)}(5)` | q-values {0,0,½} vs {½,½,½}, Gauss 2 vs −2, signs 0, 4; θ=1: Gauss `−i√3`, sign 6 = −2; θ=2: `i√3`, sign 2 = −2+4; p=5: −4+4 = 0 and the order 5 is not a square | the formula matches the native convention `q(1) = 2θ/3` | one Check corrected before commit (an earlier draft relation claim was wrong) |
| 2G Checks | det 3 rank 2; `U` | reduced `[1,0;0,3]`, `[2,±1;±1,2]`; `[0,1;1,2k]` all ≅ U | two classes; no indefinite entry bound | none |
| Mass API Checks | rank 0, rank 1, Δ = −23 | 1/1; 1/2 and 1; m = 3/4, m⁺ = 3/2 = 2m, `h/(2w) = 1/2` wrong | holds | none |

The headline statements kept unchanged (`vanDerBlij`, `milgram`, 5B, 5J existence, 4E, 2G, 7E volumes) were re-read against their elaborated types. The 7E normalizations recomputed: `vol SO(2) = 2π`, `vol SO(3) = 8π²`, `vol O(n) = 2 vol SO(n)` for n ≥ 1 and 1 at n = 0, and the Gamma identity at n = 1, 2 (`2 = 4/2`, `2/π = 8/(4π)`).

## Untrusted text

The review was read as data. It contains no instruction to run commands outside this job, and nothing in it was treated as an instruction.

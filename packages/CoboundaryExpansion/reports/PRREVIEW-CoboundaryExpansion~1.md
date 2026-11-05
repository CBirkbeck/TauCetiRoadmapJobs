# Review of CoboundaryExpansion (pull request #1752 at 0126544)
**Verdict:** needs changes

:robot: Independent AI review of `TauCetiRoadmap/CoboundaryExpansion/` at `012654423895980ec62d4a8f90fd2ae760efc11b`. The pull request files were not changed. The findings below distinguish mathematical defects from the supplied gate failures. The scope can be repaired; it does not require rejecting the whole roadmap.

## R01 (P1) — Degree one makes the all-degree constant zero

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:148`, also lines 75–78 and 248–252: `h1Sym X = ⨅ n, h1 X (movedNorm (Fin (n + 1)))`.

**Claim:** This constant equals `k/3` on the complete complex for `k ≥ 4`.

**Witness:** `Sym(1)` is trivial: every cost and distance is zero, so its positive-distance ratio set is empty. `Real.sInf_empty` makes its `h1` zero. At `K₄`, the claimed equality becomes `0 = 4/3`.

All degreewise constants are nonnegative, and the infimum includes that zero term, so `h1Sym X = 0` for every X. A scratch Lean proof establishes `h1 X ℓ = 0` for every subsingleton coefficient group, directly from these definitions. Chapman–Lubotzky II actually starts its permutation union at degree 2 (chapman-lubotzky-ii line 246).

**Repair:** Index the same-degree infimum by degrees at least 2, for example `Fin (n + 2)`. Preserve the positive-distance condition in each degree. Retest `K₄`: the degree-2 constant is 2, degree 3 is 4/3, and the star bound puts every admitted degree at least 4/3; the repaired infimum is 4/3. Keep degree 1 as a negative-control Check.

## R02 (P1) — The recorded push gate fails its build check

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:1`: `import Mathlib`.

**Claim:** The acceptance file passes the required build gate.

**Witness:** The worker records `build=1 FAIL`: importing the module-system Mathlib without a module header emits an additional warning. Direct `lake env lean` succeeds with only `sorry` warnings, but that does not clear the targeted-build gate.

**Repair:** Add the module header requested by the warning while retaining the prescribed single `import Mathlib`, then rerun the targeted build and full gate. No warning except admitted theorem warnings may remain. A scratch copy with that header elaborated successfully. The recorded failing case is the targeted build of this exact module, not a type error inferred from the mathematics; the full gate still needs rerunning after repair. This finding has P1 severity because the review contract assigns P1 to a failing build gate; it does not claim that direct elaboration failed.

## R03 (P2) — The binary “exactly when” asserts Kozlov’s conjecture

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:12`: “For `𝔽₂` it is attained exactly when `k` is not a power of two (Kozlov).”

**Claim:** Kozlov proves both directions of this characterization.

**Witness:** kozlov line 541 proves the non-power-of-two implication. At line 601, strict inequality at powers of two is Conjecture 5.1, not a theorem. Beasley also explicitly leaves larger powers open (beasley line 316).

**Repair:** Say “For `k ≥ 3` not a power of two, Kozlov proves attainment.” Remove the converse rather than turning it into an unstated prerequisite. At `k = 16`, the source bounds are `16/3 ≤ h₁ ≤ 16/3 + 8/93`; neither endpoint information proves strictness. The repaired sentence makes no unsupported claim at 16 and still covers the computed `k = 5` value 5/3. The Lean binary headline already uses the correct one-way hypothesis.

## R04 (P2) — Specify the positive-distance and degree domains of `h1Err`

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:263`–266: “`h1Err` is the infimum over cochains of the normalized defect divided by the infimum of this cost over gauges of every degree.”

**Claim:** This definition yields the positive cross-degree constant asserted at lines 268 and 278.

**Witness:** The identity degree-3 cochain on `K₄` has defect 0 and cross-degree distance 0. Its literal Lean quotient is `0/0 = 0`, contradicting the proposed lower bound 4/3 if it is included.

The earlier positive-distance definition is for `h1`; this separately introduced infimum must specify its own admissible set. The degree range is also missing. Allowing degree zero makes the displayed distance satisfy `d(id₀,id₀) = 1`, not 0.

**Repair:** Define degrees and comparison degrees to be at least 2, as in the cited source, and take the outer infimum only over cochains with strictly positive cross-degree distance. State explicitly that the numerator is the **sum** of holonomy moved counts divided by the cochain degree, not the mean over triangles. The identity cochain is then excluded, while the degree-3 seed has numerator 8/3 and distance 2, giving 4/3. Add both the identity exclusion and the equal-degree distance calculation as Checks.

## R05 (P2) — `movedNorm` contains admitted data obligations

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:42`–47: `def movedNorm : GroupNorm (Equiv.Perm α) where`.

**Claim:** This is an allowed concrete definition supporting the headline.

**Witness:** All four `GroupNorm` law fields contain `sorry`; the worker reports this as `sorry-data`. Its function is concrete, but its bundled proof fields are still inside a forbidden admitted definition.

**Repair:** Keep this needed simple definition only with real proofs of its four fields, using `support_one`, `support_mul_le`, `support_inv`, and `support_eq_empty_iff` with finite-cardinality facts. No axiomatized replacement is needed. Its function remains the moved-point count: identity 0, transposition 2, three-cycle 3. Those same values are the regression instances; the problem is the admitted bundle, not those values.

## R06 (P2) — Remove the admitted parity bundle from the acceptance file

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:60`–63: `def parityRetract ... : Equiv.Perm α →* Equiv.Perm α where`.

**Claim:** This definition is permitted in the headline acceptance file.

**Witness:** Both homomorphism laws are admitted (`sorry-data`). None of the headline signatures mentions this map; its only Lean consumer is the adjacent API theorem at line 66.

**Repair:** Delete `parityRetract` and `movedNorm_parityRetract_le` from `Suggested.lean`, retaining their mathematical development in README Layer 1 as an input to the proof of Layer 8. If a later genuine headline needs this map in its statement, supply its real homomorphism proofs first. The intended map remains valid: on `S₃`, identity and three-cycles retract to identity, while each transposition retracts to t; moved norms compare as `0 ≤ 0`, `0 ≤ 3`, and `2 ≤ 2`.

## R07 (P2) — The complete-complex definition also contains `sorry`

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:83`–88: `def complete ... : TwoComplex V where`.

**Claim:** The acceptance file has a concrete complete-complex carrier.

**Witness:** The edge-cardinality, triangle-cardinality, and face-closure fields all contain `sorry`. This is the third `sorry-data` occurrence in the supplied gate.

**Repair:** After resolving R09, construct the complete 2-skeleton on the shared carrier with real face-closure and cardinality proofs. If retaining a temporary adapter, prove all three fields using `Finset.mem_powersetCard`; do not admit them. On 0, 1, 2, 3, and 4 vertices the edge/triangle counts must remain `(0,0)`, `(0,0)`, `(1,0)`, `(3,1)`, `(6,4)`. These computations validate the intended repair on the boundary cases as well as the seed.

## R08 (P2) — A computational search is a roadmap target

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:135`–138: “a search over partial gauges that prunes once the cost ... reaches a bound”; also lines 206–208.

**Claim:** Building branch-and-bound and selecting kernel-evaluation tactics are required mathematical deliverables.

**Witness:** Layer 2 explicitly targets a decision procedure, and Layer 6 requires `decide +kernel` plus search splitting. These are computational algorithms and implementation prescriptions, forbidden by this review’s planning contract.

**Repair:** Delete the algorithm target and the mandatory evaluation instructions. Retain the mathematical finite-minimum theorem and exact witness inequalities, with any proof route optional in the ordinary mathematical sense, not an optional deliverable. For example the seed requires `∀ β, cost α β ≥ 6` and an attaining gauge, together with `N = 8`. The independent exhaustive review calculation gives minimum 6, and Beasley Proposition 5, pp. 4–5, supplies a noncomputational argument for it. The other finite witnesses can remain Checks of the general theorem.

## R09 (P2) — Reuse the existing finite-complex owner

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:115`, and `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:75`–80: “Define `TwoComplex V`”.

**Claim:** The roadmap independently owns a generic finite 2-complex carrier.

**Witness:** `TauCetiRoadmap/Regularity/README.md:249`–263 already owns finite bounded face levels and their Mathlib conversion; `Suggested.lean:305` declares `HypergraphComplex r V`. Mathlib also has `AbstractSimplicialComplex` at `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:154`.

**Repair:** Cite Regularity, Layer 5, as the finite graded-complex owner. Develop the new cochain and expansion theory on that vocabulary, or directly on a finite native abstract simplicial complex with faces of cardinality at most 3. A retained edge/triangle adapter must explicitly be a specialization, with conversion and round-trip targets, not a second foundational ownership claim. For a filled triangle the shared levels have sizes `1,3,3,1` including the empty face; forgetting levels 0 and 1 gives precisely the proposed three edges and one triangle. A triangle missing an edge is rejected by both closure laws. Neither a new high-dimensional expansion owner nor a renaming of the whole roadmap is required.

## R10 (P2) — Several statable headline theorems are absent

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:11`–15 and 135–161; compare README Layers 5, 8, and 9.

**Claim:** The acceptance file tests the roadmap’s end theorems; Layer 9 can be left in prose alone.

**Witness:** There are no replication statements, no normalized headline, no all-degree headline, and no cross-degree headline. The docstring offers no missing carrier: it merely says Layer 9 is specified in the README only.

These statements use finite types, permutations, real-valued finite sums, infima, and the cochains already present. Replication and distance with errors need simple concrete definitions, not a new site, building, or missing analytic carrier. In particular the normalized and corrected all-degree statements are immediately statable with one-line real definitions.

**Repair:** List the actual headlines in the module docstring and state the general replication identities, the normalized complete-complex value, the corrected same-degree all-degree value, and the cross-degree value with R04’s admissibility conditions. Keep only definitions needed to state them. If any particular construction truly cannot meet the simple-definition rule, name precisely that theorem and the missing carrier; do not replace it by a scalar implication. Regression values are `(N,D) = (64,24)` for the doubled seed, normalized `h₁(K₄,S₃) = 2`, corrected all-degree value `4/3`, and cross-degree value `(8/3)/2 = 4/3`.

## R11 (P3) — A one-library-theorem consequence is padding

**Location:** `TauCetiRoadmap/CoboundaryExpansion/Suggested.lean:49`: `theorem isConjInvariant_movedNorm`.

**Claim:** This belongs among the admitted headline acceptance tests.

**Witness:** A copy elaborates successfully with its proof replaced by the single tactic below, using `Equiv.Perm.card_support_conj` at `Mathlib/GroupTheory/Perm/Support.lean:660`.

```lean
exact fun g h => congrArg (fun n : ℕ => (n : ℝ)) Equiv.Perm.card_support_conj
```

**Repair:** Delete it from `Suggested.lean`. Keep the property in the README’s norm API and cite the pinned support theorem. Do not prove it in place as the repair. A conjugated transposition still has moved count 2, and a conjugated three-cycle still has count 3; the library already supplies that content.

## R12 (P3) — Supply the required target structure, dependencies, and Checks

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:95` through line 278; for example line 117: “Define `Cochain X G`, its holonomy, `defect`, `cost`, `gaugeDist`, `IsCoboundary`, and the gauge action”.

**Claim:** The layered bullet list is a complete roadmap specification in the required form.

**Witness:** The gate reports `target-ids=1`: no `### k.n` targets. There are zero `*Needs:*` lines and zero `**Checks.**` blocks, and no layer-ending Examples/Dependencies sections. Multiple definitions have no discriminating test set.

**Repair:** Give the nine layers numbered prose subsections, per-target dependencies, an API and at least three discriminating Checks per definition, plus Examples and Dependencies. Add Summary, Scope and ownership, Exact supplier contracts, How to read the build, and Downstream consumers. Include the noncommuting action-order witness below, the degree-1 and zero-distance failures, and denominator restrictions (`k ≥ 3` for the probability-normalization factor). Preserve the actual finite examples as Checks. Align all retained Lean names with the README, add missing declaration docstrings, and put the binary headline in Layer 7 order. Replace mutable branch-status prose at lines 301–304 by a versioned provenance citation. These are structural repairs; the table below provides specific computed Checks rather than placeholder test names.

## R13 (P3) — Add exact source locators and source records

**Location:** `TauCetiRoadmap/CoboundaryExpansion/README.md:280`–304, particularly line 295: “Layers 5, 6, 8 and 9.”

**Claim:** The reference list locates the mathematical targets adequately.

**Witness:** The folder has no `sources.toml`. Most target bullets lack claim-level locators; the Beasley citation points only to this roadmap’s layers. The bibliography names published editions while the available checked texts are versioned preprints.

**Repair:** Add one source record per work, using the existing work identity rather than duplicate preprint/published keys, and give theorem/section and printed-page locators at each target. The source table below supplies the checked version-specific locators. In particular use Beasley v7 Lemma 6, pp. 6–7; Theorem 8, pp. 7–8; Proposition 10, pp. 8–9. Record Linial–Meshulam as uncertified unless an authorized legal text is supplied. Cite the preprint versions actually checked unless published numbering is independently established. No mathematical alteration is required for the verified `(64,24)` replication or the cross-degree minima `10/3,2,3`; this repair makes their evidence findable.

## Verified sound

The review checked both entire target files, all 19 elaborated declaration signatures, all 8 admitted theorem statements, all 19 explicitly named library inputs in the foundations table, all supplied gate failures, 15 source groups, and 81 rows of adversarial calculations below. The requested seeded selection contained **no target identifiers** (“none found by heading”); no reproducible 15-element seeded list was supplied. Instead, the following 15 source groups cover all explicit numbered locators and the substantive source-dependent targets. No README locator is marked unverified.

The direct elaboration of the unchanged acceptance file succeeded with 11 `sorry` warnings and no other warning. A separate scratch file elaborated `#check @name` for all 19 declarations. The two suspected dropped binders are benign: `Cochain` and `IsCoboundary` do not require a finite ambient vertex type to be defined; their finite-use clients retain `[Fintype V]`. The finite coefficient hypothesis survives on `gaugeDist_eq_zero_iff`; conjugation invariance survives on both star-bound signatures; the two final signatures retain their cardinality and power-of-two hypotheses. No missing standing hypothesis was found in those eight Lean theorem types. No signature was edited.

One-tactic `simp` probes were attempted for each of the eight admitted theorems. They did not establish the substantive results. The targeted single-lemma probe in R11 did close conjugation invariance. Reading the remaining signatures found no `True` placeholders, no free-condition stand-in, no hypothesis literally containing the conclusion, no `set_option`, no extra imports, and no name collision in another roadmap namespace. The three admitted data bundles are reported separately, not mistaken for opaque unknown functions.

**Source checks (15 groups).** Each row records what was actually readable; page numbers are those printed in the retrieved versions. All text was obtained through the sources service. Source statements were compared in their original context, not inferred from abstracts.

| Group | Roadmap target | Checked locator and extraction | Result |
| --- | --- | --- | --- |
| S01 | Nonabelian cochains, holonomy, coboundary convention | Chapman–Lubotzky I, arXiv:2310.17474v2, §5.1, pp. 15–16; chapman-lubotzky-i lines 587–629 | Source uses a nontrivial group with a bi-invariant metric; pointwise inversion converts its coboundary convention to this one. |
| S02 | Permutation degrees, ratio exclusions, binary comparison | Chapman–Lubotzky II, arXiv:2311.06706v3, equation (2.8), pp. 6–7, footnote 2, p. 1; chapman-lubotzky-ii lines 42–43, 230–255 | Non-coboundaries are excluded from the denominator-zero case; degrees start at 2. R01/R04. |
| S03 | Distance with errors | Chapman–Lubotzky II, equation (2.9), p. 6; chapman-lubotzky-ii lines 241–243 | Matches the max/min formula for positive degrees. |
| S04 | Star identity and bound | Chapman–Lubotzky II, Proposition 3.2, pp. 8–9; chapman-lubotzky-ii lines 325–363; Beasley v7 Proposition 1, pp. 2–3, beasley lines 86–116 | Source uses uniform cell probabilities and `k=d+1 ≥ 3`; converting by edge/triangle counts gives k/3. The proof needs only bi-invariance, so the group-norm generalization is justified. |
| S05 | Equality iff all stars are optimal | Beasley v7 Corollary 2, p. 3; beasley lines 117–122 | Positive distance is essential; equality of a finite average with its common lower bound proves both directions. |
| S06 | General balanced replication | Beasley v7 Lemma 6, pp. 6–7; beasley lines 245–286 | Handles arbitrary bi-invariant coefficient groups, with near-optimal gauges when the infimum is not assumed attained. k=0,1 need separate zero-edge cases. |
| S07 | Four-vertex seed | Beasley v7 Proposition 5, pp. 4–5; beasley lines 171–200 | Hand argument supports N=8,D=6; independently recomputed. |
| S08 | Five through eight vertices | Beasley v7 Theorem 4, pp. 3–4, Appendix A, p. 19; beasley lines 129–170, 860–872 | Every listed edge and permutation matches, up to permuting the seed’s three transpositions; independent minima agree. |
| S09 | Coefficient subgroups at four vertices | Beasley v7 Proposition 5, pp. 4–5; beasley lines 172–205 | Constants 2 and 3/2 verified independently. The illustrative 6/4 arithmetic in the source is a misprint; see Source issues. |
| S10 | Staircase carrier and adjacency | Kozlov, arXiv:1610.07136v2, Definition 3.2, p. 6; kozlov lines 253–265 | Zero-based adjacency `i < c(t − j/c)` represents the stated blown-up partition; c isolated vertices are retained. |
| S11 | Staircase cut minimality | Kozlov Lemma 3.8, p. 8, Corollary 3.13, p. 11; kozlov lines 337–356, 513–519 | Requires partition legality. `N(cor(t))=N_d(cor(t))=2t+1` and its scaling discharge that hypothesis here. |
| S12 | Staircase size and odd-triangle count | Kozlov §3.3, pp. 8–9, Theorem 4.2, p. 11; kozlov lines 357–384, 534–540 | Partition size `c²t(t+1)/2` and zero deficiency yield the claimed rational odd-triangle count. |
| S13 | Binary simplex equality and background lower bound | Kozlov Theorem 4.2/Corollary 4.3, p. 11, Conjecture 5.1, p. 13; kozlov lines 534–542, 599–601; Meshulam–Wallach arXiv:math/0609773v1 Proposition 2.1, pp. 4–5, meshulam-wallach lines 145–164 | The one-way binary theorem is supported. Meshulam–Wallach gives `b(φ) ≥ n w(φ)/(k+1)`, hence n/3 in degree one. The converse is not supplied. |
| S14 | All-k permutation equality | Beasley v7 Corollary 7/Theorem 8, pp. 7–8; beasley lines 287–310 | Replicated seeds cover multiples of 4, and binary witnesses plus the parity retraction cover the other k≥4. No conjecture about binary powers of two is used. |
| S15 | Cross-degree equality | Beasley v7 Proposition 10, pp. 8–9; beasley lines 331–385 | Seed minima and the uniform baseline cover all comparison degrees ≥2; the elementary baseline inequality and section argument were checked. Requires R04’s precise definition. |

**Adversarial values.** In this table, `e=(0,1,2)`, `t=(1,0,2)`, `s=(0,2,1)`, `c=(1,2,0)` are one-line permutations, and products compose right-to-left. N and D use moved-point counts unless stated otherwise. A finite computation tests the displayed instance, not a universal theorem. General implications were also checked by their algebraic/counting arguments and the sources above. “Keep” means no defect found in that claim at its stated hypotheses.

| Statement / location | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Conjugation-invariant norm definition, README 32–36; Lean 32 | S₃ moved norm; weighted word norm with lengths t=1,s=2 | moved norm of `ctc⁻¹=s` is 2=2; weighted norm gives 2≠1 | Definition excludes the plausible non-bi-invariant metric. Keep. |
| Metric from norm, README 34,97–102 | e,t,s; trivial group | d(e,t)=d(t,e)=2; d(t,s)=3≤2+2=4; trivial diagonal 0=0 | Positivity and symmetry agree with GroupNorm. Keep. |
| Left and right metric invariance | e,t multiplied by c on either side | both translated distances 2=2 | Keep with conjugation invariance for right translations. |
| Converse metric-to-norm | S₃ moved metric | d(e,e)=0; d(e,t)=2; d(e,c)=3 | Recovers the original norm 0,2,3. Keep. |
| Cyclic products, README 99 | t,s and t,s,c | ℓ(ts)=ℓ(st)=3; tsc and its cyclic rotations have norm 3 | Keep. |
| Reversal with inversion | t,s and their inverses in reverse order | ts=c, s⁻¹t⁻¹=c⁻¹; both norms 3 | Keep; literal product reversal without inversion is not claimed. |
| Norm restriction / injective pullback, README 103 | C₂↪S₃; trivial map C₂→1 as negative control | restricted nonidentity norm 2=2; noninjective pullback gives 0 at a nonidentity | Injectivity is needed for a norm. Keep. |
| Positive scaling / addition, README 104 | 2ℓ, ℓ+ℓ, and 0ℓ on t | 4=4, 4=4; 0ℓ(t)=0 violates separation | Keep positive scaling; cite native addition rather than reconstruct it. |
| Moved norm, README 105–108; Lean 42 | Sym(0), Sym(1), Sym(2), Sym(3) | only identity in degrees 0,1 gives 0; swap 2; three-cycle 3 | Function correct; R05 fixes admitted laws. |
| Conjugation invariance, Lean 49 | t conjugated by c; c conjugated by t | 2=2; 3=3 | R11: already a one-lemma consequence. |
| Hamming bridge, Lean 55 | σ=t,τ=s; σ=τ=c | Hamming(t,s)=3=ℓ(t⁻¹s); Hamming(c,c)=0=ℓ(e) | Keep in README API. |
| Odd permutation bound, README 108 | transposition; 4-cycle | norms 2≥2 and 4≥2 | Keep; degree 0/1 has no odd element. |
| Parity map and homomorphism, README 109–111; Lean 60 | e,c,t,s; products t·s and c·t | r(e)=r(c)=e; r(t)=r(s)=t; r(ts)=e=t²; r(ct)=t=e·t | Homomorphism/retraction correct. R06 removes admitted bundle. |
| Parity contraction, Lean 66 | e,c,t and a 4-cycle | 0≤0, 0≤3, 2≤2, 2≤4 | Generality beyond S₃ is sound; retain as README target. |
| Complex carrier, README 41–45; Lean 75 | filled triangle; triangle missing one edge | valid face counts (3,1); missing face violates 2-subset closure | R09 imports existing ownership. |
| Complete-complex counts, README 115–116; Lean 83 | k=0,1,2,3,4 | (E,T)=(0,0),(0,0),(1,0),(3,1),(6,4), matching binomial formulas | R07: construct without admitted fields. |
| Cochain axiom, README 47–50; Lean 94 | edge value c and reverse c⁻¹; wrong reverse c | c⁻¹·c=e; c·c=c⁻¹≠e | Axiom discriminates orientation. Diagonal/nonedge values do not affect sums. |
| Holonomy and defect, README 48,53; Lean 104 | K₃ with one t edge; all identity | holonomy t and e, N=2 and 0 | Keep. |
| Cost and coboundary sign, README 54,58; Lean 110,119 | one edge α=c, β=(c,e); wrong convention β=(c⁻¹,e) | βu⁻¹αβv=e costs 0; wrong convention yields c⁻¹ costs 3 | Keep; makes the inversion convention discriminating. |
| Gauge-distance definition, Lean 115 | one edge; triangle with one t | D=0 on the tree; D=2 on the triangle | Keep; nonempty gauge domain and nonnegative costs bound the infimum. |
| Action axiom preservation, README 118 | triangle, gauged by arbitrary vertex permutations | reversed residual is inverse; pair product e has norm 0 | Algebra gives `(βv⁻¹αvuβu)(βu⁻¹αuvβv)=e`. Keep. |
| Action composition order, README 119 | identity edge, β=(e,s), γ=(e,t) | β•(γ•α)=ts=c=(γβ)•α; wrong βγ gives st=c⁻¹≠c | Keep the opposite-order law; add this Check in R12. |
| Triangle orientation independence, README 120–124 | triangle with one t; seed | all six readings have norm 2; seed defect stays 8=8 under relabeling | Keep under conjugation invariance. |
| Edge orientation independence | α=c, β=(t,s) | forward residual is e with norm 0; reverse inverse also has norm 0 | Keep. |
| Gauge defect invariance, README 125 | seed; a coboundary | N remains 8=8; a coboundary has each holonomy e and N=0 | Keep. |
| Cost under two gauges, README 125 | identity edge, β=(e,t), γ=(e,s) | cost(β•α,γ)=ℓ(ts)=3=cost(α,βγ) | Keep; this is the correct order for this formula. |
| Gauge-distance invariance | seed; one-edge cochain | before/after D=6=6 and 0=0 | Gauge multiplication bijects the comparison set. Keep. |
| Finite attainment, README 127–130 | seed, C₂ triangle, empty V | minima 6,2,0 attained by identity gauges in these examples | Keep; constant right-factor normalization preserves cost. |
| Zero distance iff coboundary, Lean 122 | C₂ triangle with odd edge; tree with one t | D=2, coboundary false; D=0, coboundary true | Both directions tested; `[Finite G]` remains in signature. |
| Fix root gauge to e | seed | unrestricted minimum 6=root-fixed minimum 6 | Right multiplication conjugates residuals; keep. |
| Contracting coefficient homomorphism, README 131–134 | parity image of an A₃ cochain with N=9,D=6 | image N=0≤9 and D=0≤6 | Keep; quotient monotonicity for h₁ is not inferred. |
| Subgroup comparison | embedded binary K₅ witness | N_H=N_S₃=10; D_S₃=6=D_H | Keep; equality here follows from the retraction, not mere inclusion. |
| Branch-and-bound target, README 135–138 | seed; bound 6 versus bound 7 | no cost below 6; identity gauge has cost 6<7 | Mathematical lower-bound content is sound; R08 removes the algorithm deliverable. |
| h₁ definition / empty ratio set, Lean 132 | trivial group on K₄; empty V | all D=0; ratio set ∅; real sInf=0 | Correct Lean behavior; R01 prevents its use as a positive degreewise bound. |
| Nonnegativity / ratio upper bound / finite minimum, README 144–145 | K₄/S₃ seed; K₄/C₂ | h=4/3=N/D=8/6≥0; h=2=4/2≥0 | Keep, with stated nonempty-set condition for attainment. |
| h₁ scaling invariance | seed with ℓ versus ℓ/3 | 8/6=(8/3)/2=4/3 | Keep; positive scale required. |
| h₁ relabeling invariance | seed with a vertex transposition | N=8,D=6 on both labelings; ratio 4/3=4/3 | Keep. |
| Probability normalization, README 70–73,142–143 | K₃,K₄,K₅; empty triangles | factors E/T=3,3/2,1; empty triangles gives 0/0 | For k≥3 these equal 3/(k−2); make that domain explicit in R12. |
| Same-degree infimum and comparison, README 148–150 | K₄ including degree 1 | min contribution 0; hSym=0≤hC₂=2 | Inequality alone passes vacuously; equality fails. R01. |
| Star gauge, README 154–157 | K₃ one t edge; K₄ seed | star edges cost 0; nonstar costs equal triangle norm 2 | Keep. |
| Star sum, README 159 | seed; K₅ witness | 4·6=24=3·8; 5·6=30=3·10 | Keep; every triangle counted three times. |
| Star bound, Lean 139 | seed; identity; k=0,1,2 | kD=24=3N; identity and small complete complexes give 0≤0 | Universal inequality survives degenerate cases. |
| Lower bound on h₁, Lean 144 | K₄/S₃; K₄/trivial group | 4/3≤4/3; trivial case would be 4/3≤0 but hne=false | Lean retains the necessary hypothesis. |
| Normalized lower bound, README 162 | K₃/S₃ and K₄/S₃ | 3≤3 and 2≤2 | Keep under the preceding nonempty ratio-set hypothesis and k≥3. |
| Equality iff all stars optimal, README 163–164 | seed; K₄ with one t edge | seed 8/6=4/3 and stars (6,6,6,6); one-edge ratio 4/2=2 and stars (4,4,2,2) | True/true and false/false. Keep. |
| Existence of positive-distance cochain, README 165–166 | K₃/C₂; K₂/C₂ negative control | one t edge on K₃ gives D=2; every K₂ cochain has D=0 | k≥3 and nontriviality distinguish the cases. Keep. |
| Replicated cochain definition, README 170–172 | seed q=2; q=1; one cluster | intra-cluster edge e; inter-cluster t remains t; q=1 unchanged | Keep; zero/one original vertex handled separately. |
| Replicated defect, README 174–176 | seed q=2 | N′=64=2³·8; repeated-cluster triangle holonomy e contributes 0 | Keep. |
| Replicated gauge distance, README 177–182 | seed q=2; q=1 | D′=24=2²·6; 6=1²·6 | Arbitrary gauges included. Keep. |
| Section multiplicity in replication | k=4,q=2; k=0,1 | 16 sections; each inter-cluster edge in 4=2² sections; no inter-cluster edges for k<2 | Count supports D′≥q²D; split k<2 before using k−2. |
| Replicated ratio, README 183 | seed q=2; identity cochain control | 64/24=8/3=2·(8/6); identity has D=0 | Keep the positive-distance hypothesis. |
| Seed and triangle products, README 187–191 | three distinct S₃ transpositions | four triangle norms 2 give N=8; D=6; products of two have norm 3 | Keep; source hand proof and enumeration agree. |
| Multiples of four, README 192–194 | q=1,2,3 | (N,D)=(8,6),(64,24),(216,54); ratios 4/3,8/3,4 | First two independently enumerated; q=3 follows the checked general formula. Keep. |
| Explicit k=5 witness, README 201 | exact printed cochain | N=10,D=6; 10/6=5/3; five star costs all 6 | Keep. |
| Explicit k=6 witness, README 202 | exact printed cochain | N=36,D=18; ratio 2=6/3; six star costs all 18 | Keep. |
| Explicit k=7 witness, README 203 | exact printed cochain | N=28,D=12; ratio 7/3; seven star costs all 12 | Keep. |
| Explicit k=8 witness, README 204 | exact printed cochain | N=72,D=27; ratio 8/3; eight star costs all 27 | Keep. |
| Coefficient subgroup C₂, README 209–214 | all root-gauged K₄ cochains over C₂ | minimum ratio 2; single-edge witness N=4,D=2 | Keep. |
| Coefficient subgroup A₃ | all root-gauged K₄ cochains over A₃ | minimum ratio 3/2; α13=c,α23=c⁻¹ gives N=9,D=6 | Keep; corrects the source’s illustrative counts. |
| No abelian subgroup attains 4/3 | subgroups 1,C₂,A₃ of S₃ | constants 0,2,3/2, all ≠4/3 | Keep; trivial subgroup’s 0 is not attainment by a positive-distance cochain. |
| Binary edge-set bridge, README 222–223 | one edge of K₄; gauge flipping an endpoint | odd triangles 2 give N=4; cut-toggle support 2 gives cost=4 | Both factors of 2 verified. Keep. |
| Cut minimality iff D=2E, README 224–226 | K₃ one-edge graph; K₄ vertex star | cut-minimal: D=2=2E; star is a cut, D=0≠2E=6 | Both directions distinguished. Keep. |
| Staircase adjacency, README 227–231 | c=1,t=2; c=2,t=1 | row sizes 2,1 and 2,2; E=3 and 4; isolated counts 1 and 2 | Natural division/subtraction has no underflow for j<ct. Keep. |
| Staircase edge count, README 232 | (c,t)=(1,1),(1,2),(1,3),(1,4),(2,1),(2,2),(4,1) | enumerated E=1,3,6,10,4,12,16 equals c²t(t+1)/2 in every case | Keep. |
| Staircase cut minimality, README 233 | same seven instances, n=3,5,7,9,6,10,12 | minimum cut-toggle support=1,3,6,10,4,12,16=E | Every cut tested in each instance; keep. |
| Staircase odd triangles, README 234 | same seven instances | O=1,5,14,30,8,40,64 equals nE/3 | Read n/3 as rational/real, not truncated natural division: at n=5, natural `(5/3)·3` would be 3≠5. Clarify types in R12. |
| Binary theorem, README 235–237; Lean 158 | n=3,5,6,7,9,10,12 | ratios 1,5/3,2,7/3,3,10/3,4 = n/3 | Keep; n=4 fails hpow and has h=2>4/3. |
| Binary converse in introduction | n=4,8,16 | 2>4/3 and 20/7>8/3; at 16 only interval [16/3,168/31] supplied | Converse not established at 16. R03. |
| S₃ headline, README 241; Lean 153 | k=4,5,6,7,8; replicated k=12 | values 4/3,5/3,2,7/3,8/3,4 = k/3 | General case split supported by sources and retraction. Keep signature. |
| Normalized S₃ headline, README 242 | k=4,5,6,7,8 | values 2,5/3,3/2,7/5,4/3 = k/(k−2) | Correct but absent from Lean. R10. |
| Embedding binary witness into S₃, README 244–247 | K₅ staircase | N=10 in both; D_H=D_S₃=6; retraction sends all S₃ gauges to no-more-expensive H gauges | Keep equality argument. |
| All-degree equality, README 248–249 | K₄ | original hSym=0≠4/3; corrected degrees≥2 give 4/3 | R01/R10. |
| Strict binary comparison, README 250–252 | K₄ | corrected 4/3<2; original hSym is 0, so asserted value 4/3 fails | R01; comparison after repair is sound. |
| Cross-degree distance, README 256–263 | id₂,id₃; t in degree3 versus id₃; id₀,id₀ | 1/3; 2/3; zero-degree formula 1−0/0=1≠0 | Formula correct for positive degrees; R04 fixes range. |
| Cross-degree cost and infimum, README 264–266 | seed; identity cochain | seed normalized N=8/3,Derr=2; identity N=0,Derr=0 | R04 excludes identity from outer infimum. |
| Cross-degree star bound, README 268–269 | seed; K₅ binary witness | kDerr=8=3·(8/3); 5·2=10=3·(10/3) | Keep for admissible cochains. |
| Degree baselines, README 270–271 | id₃ versus id₂,id₄,id₅ | distances 1/3,1/4,2/5 equal baseline bounds | Keep. |
| Cross-degree seed minima, README 272–273 | all root-fixed gauges of degrees 1,2,3,4 | minimum costs 14/3,10/3,2,3; m≥5 baseline ≥12/5>2 | Listed 2,3,4 minima independently verified. Degree1 is unnecessary. |
| Cross-degree replicated seed, README 274–275 | q=2 | same-degree cost 24/3=8; section lower bound 2²·2=8 | Cross-degree infimum also 8. Keep. |
| Binary baseline exclusion, README 276–277 | (q,t)=(1,1),(1,2),(2,1) | E/4=3/4,5/2,15/4 exceeds D₃=2/3,2,8/3; polynomial sides 11≥9,27≥15,22≥9 | General difference at q=1 is 2t(2t−1)>0. Keep. |
| Cross-degree headline, README 278 | K₄ seed; K₅ binary witness | (8/3)/2=4/3; (10/3)/2=5/3 | Correct after R04; absent from Lean (R10). |

The finite calculations enumerate root-fixed gauges, which is legitimate because a common right factor cancels from `βu βv⁻¹` and conjugates same-degree residuals. They use exact integer costs and rational comparisons. There are 216, 1,296, 7,776, 46,656, and 279,936 root-fixed S₃ gauges for the five printed witnesses, respectively; the doubled seed also has 279,936. The subgroup checks enumerate 8 and 27 root-gauged cochain classes, each with all subgroup gauges. The seven staircase checks enumerate all cuts, including empty and full cuts. Source code was not downloaded and executed; the numerical checker was written independently for this review.

**Pinned-library and ownership audit.** Mathlib was read at `f6090c7095e1e56b3464c1daba5f24631f1290d2`, Tau Ceti at `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`; both match `lake-manifest.json`. The content checkout equals its `origin/main`, `929496d4221b974c60787257a3cdc28b600fc49c`. The following are source locations within those repositories, not links to a newer documentation build.

| Pinned declaration(s) opened | File and line | Relevant content / limit |
| --- | --- | --- |
| `GroupSeminorm`, `GroupNorm` | `Mathlib/Analysis/Normed/Group/Seminorm.lean:76`, `:110` | Product inequality, inverse invariance, and separation; no conjugation-invariance field. |
| `GroupNorm` addition instance | `Mathlib/Analysis/Normed/Group/Seminorm.lean:728` | The sum bundle already exists. Only preservation of the new conjugation predicate is new. |
| `Equiv.Perm.support`, `support_eq_empty_iff`, `support_one` | `Mathlib/GroupTheory/Perm/Support.lean:252`, `:265`, `:270` | Finite moved set and exact zero-support criterion. |
| `support_mul_le`, `support_inv`, `card_support_conj` | `Mathlib/GroupTheory/Perm/Support.lean:285`, `:306`, `:660` | Supplies the norm construction and R11’s entire content. |
| `Equiv.Perm.IsSwap`, `card_support_eq_two` | `Mathlib/GroupTheory/Perm/Support.lean:192`, `:584` | Transpositions are swaps of distinct points and have support size two. |
| `Equiv.Perm.sign`, `IsSwap.sign_eq` | `Mathlib/GroupTheory/Perm/Sign.lean:357`, `:395` | A monoid homomorphism to integer units; a swap has sign −1. |
| `hammingDist` and its metric identities | `Mathlib/InformationTheory/Hamming.lean:41`, `:45`, `:59`, `:91` | Counts unequal function values; finite domain, decidable codomain equality. |
| `Finset.powersetCard`, `mem_powersetCard`, `card_powersetCard` | `Mathlib/Data/Finset/Powerset.lean:197`, `:202`, `:210` | Native subsets of fixed cardinality, including the empty/boundary cases. |
| `Finset.sum_comm` | `Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean:120` | Generated additive version of the finite double-product commutation theorem. |
| `Finset.sum_le_sum` | `Mathlib/Algebra/Order/BigOperators/Group/Finset.lean:110` | Generated additive version; the elaborated additive-order hypotheses were checked. |
| `Finset.inf'` | `Mathlib/Data/Finset/Lattice/Fold.lean:527` | Generated dual of `sup'`; requires a nonempty finite index set. |
| `toLex`, `ofLex` | `Mathlib/Order/Lex.lean:52`, `:57` | Identity equivalences to/from the order type synonym. `Prod.Lex` was also signature-checked. |
| `SimpleGraph.fromRel`, `SimpleGraph.edgeFinset` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean:135`; `Mathlib/Combinatorics/SimpleGraph/Finite.lean:58` | Symmetrizes and removes loops; edge finset uses unordered pairs and requires finite edge set. |
| `PreAbstractSimplicialComplex`, `AbstractSimplicialComplex` | `Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean:51`, `:154` | Nonempty finite faces with downward closure; the latter includes every singleton. Neither imposes finite total face set or a dimension bound. |
| `Real.sInf_empty` | `Mathlib/Algebra/Order/Archimedean/Real/Basic.lean:189` | Empty real infimum is 0, not infinity. |
| Tau Ceti `hammingDist_eq_hammingNorm_sub`, `hammingDist_eq_ncard_support_sub` | `TauCeti/InformationTheory/Hamming.lean:96`, `:108` | Additive-valued function support facts; not the permutation-composition bridge in this roadmap. No duplicate claimed on that basis. |
| Regularity’s finite bounded face carrier | `TauCetiRoadmap/Regularity/README.md:249`; `TauCetiRoadmap/Regularity/Suggested.lean:305`, `:314`, `:334` on main | `HypergraphComplex` and both directions of its native-complex comparison; this is the overlap in R09. |

The object searches covered conjugation-invariant norms, permutation support/Hamming distance, finite simplicial complexes, cut-minimal graphs, and coboundary expansion in both pinned libraries, main roadmaps, the board package files, and the open-roadmap search index. The supplied open-roadmap files were searched by object through the roadmap index; no second expansion theory or matching fully qualified `TauCetiRoadmap.CoboundaryExpansion` declaration was found. Main `GraphConnectivityAndFlows` and `Regularity` were read for the nearby library boundaries and roadmap shape. This roadmap is the appropriate owner for nonabelian finite-complex cochains, their gauge-distance/expansion theory, balanced replication, and the complete-complex permutation theorem, once the generic complex carrier is imported rather than re-owned. No wholesale re-planning of an existing expansion roadmap was found.

The provenance repository’s public README advertises the star bound and replication (coboundary-k3-lean, README lines 370–384). Its `CoboundaryK3/Constant.lean` was fetched separately: `star_gauge_sum`, `gaugeDist_mul_le`, and `k_div_three_le_h1` occur at coboundary-k3-lean lines 365, 396, and 405 in that file, with `Fin k → Fin k → S3` carriers. They do not supply the arbitrary-group generality automatically. No external formalization was compiled or treated as a pinned dependency. The board-package index’s heads for AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems, and LogicAndDefinabilityInNumberTheory were also read through the read-only contents API and produced no relevant object matches; the remaining listed package is recorded below as unavailable.

**Supplier-order audit.** There are no named cross-roadmap supplier citations or `*Needs:*` lines in the submitted README, hence zero such citations to resolve; the missing explicit contracts are R12, not evidence that a cycle exists. The library citations all resolve as above. No declared supplier gap was supplied. Regularity is already on main, so R09 can be repaired without an upward dependency. The prescribed mechanical command returned:

```text
depcheck: 205 roadmaps, 1629 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE`, or `moved:` line appeared. The literal layer references have earlier inputs: Layer 8 consumes Layers 1, 4, 6, 7; Layer 9 consumes Layers 4, 5, 6, 7, 8. The general star proof and replication proof were checked rather than inferred from a source citation alone. Their nonempty-infimum and k<2 cases need explicit API/Checks, but do not require a new unowned deep theorem.

**Headline inventory.** The README’s substantive end/deep results are the general star inequality and resulting Cheeger lower bound (Layer 4), exact balanced replication (Layer 5), the binary non-power-of-two equality (Layer 7), the S₃ equality and its normalized/all-degree forms (Layer 8), and the cross-degree equality (Layer 9). The finite k=4–8 tables and coefficient-subgroup comparisons are useful Checks and supporting results. Lean includes the two star statements and the binary/S₃ counting equalities. R10 identifies the missing acceptance coverage. None requires narrowing the intended arbitrary-group star/replication theory to S₃.

**Gate and scope.** The head was verified. The diff outside `TauCetiRoadmap/CoboundaryExpansion/` is empty, and the worktree remains clean. The folder contains only README, Suggested.lean, and metadata. The provided gate has exactly these failing rule groups:

```text
sorry-data=3
target-ids=1
build=1
FAIL
```

They are covered by R05–R07, R12, and R02 respectively. All other recorded scanners, metadata, dependency, stray-file, outside-folder, and source-material checks pass. A direct Lean elaboration was rerun; the whole gate was not substituted by that direct elaboration. The build warning is not being hidden behind a claim that “Lean passes.”

## Not verifiable

- **Board package LawrenceVenkateshMethod at `9ee7ac3`:** the read-only contents request for `packages/LawrenceVenkateshMethod/README.md` failed. Its open package head was not certified for ownership; local board files and the roadmap index were searched, but are not substituted for that missing head.

- **Linial–Meshulam (2006), References item 5:** the sources service resolved the citation only to a paywalled Springer work and classified it `uncertified`. Its text and printed locators were not verified. No paywall was bypassed and no repeated request is pending. The mathematical bounds used in this review were checked in the accessible Meshulam–Wallach and Kozlov texts.
- **Published-edition pagination:** Chapman–Lubotzky I/II, Kozlov, and Meshulam–Wallach were read in the exact arXiv versions listed above. Agreement with the published editions’ printed pagination was not established; R13 asks the author to cite the versions checked or provide that correspondence.
- **The mutable provenance branch assertion:** the roadmap names an “unmerged” `claude-k3-v7` branch without a commit. The public main README now advertises replication as well. The historical branch assertion and all external kernel-verification claims were not certified by building that repository. The relevant numeric witnesses were recomputed independently, and the directly fetched star-bound signatures are described above.
- **Exhaustiveness of the open Mathlib PR absence claim:** targeted searches found no applicable Mathlib PR or Zulip development, and no expansion API was found at the pins. A negative web search does not certify the universal sentence at README lines 92–93; replace it by the specific pinned interfaces and dated prior-art citation in the ownership discussion.
- **Seeded target list:** the brief says no targets were found by heading. The 15 groups above are an explicit replacement coverage list, not a reconstructed random seed.

The initially unresolved Beasley DOI was subsequently fetched legally from its Zenodo record through the sources service. It is not a missing-reference request. No unresolved source request remains in `needs-references.toml`.

## Source issues

- **Misprint** in beasley at §3.1, printed p. 5 (beasley lines 203–205): the source says a cyclic-subgroup witness has moved-point defect 6 and gauge cost 4; it should be defect 9 and gauge cost 6, still giving 3/2; affects the proof.

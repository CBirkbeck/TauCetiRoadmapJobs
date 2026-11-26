# Review of NormsOfThetaLiftsAndExchangeIdentities (pull request #3160 at 8e155d4)
Folder: `TauCetiRoadmap/ShortGRH/NormsOfThetaLiftsAndExchangeIdentities/`
**Verdict:** needs changes

**Summary.** Changes are needed: eight findings. The formal proof that the roadmap follows could be read this time, and the fifteen sampled sections and the headline 7.5 agree with it, with one exception: 5.2 (a) is stated for any hermitian space `V`, while the formal proof has it only for a definite one. Of the six findings of the previous review one is repaired (the factor 2 in the sketch of 6.5); the other five stand: no `Suggested.lean`, six prerequisites owned by no roadmap, two-way supply with DeterminantsOfThetaLiftChains, Layer 2 against ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2, and files changed outside the family. Two are new: several passages reproduce the wording of the formal proof's docstrings, and the sections follow its files. There are seven small corrections and three format notes. The human reviewers have scope, licence and three deferrals claimed in the description to decide.

## R01 (P1) — The folder has no `Suggested.lean`, so the roadmap has no acceptance test and nothing to build

Stands from the previous review; the description lists the file as still to come. Without it none of the headline theorems (the cost of one lift 7.5 (d), and 2.3, 4.3 (a), 4.6 (d), 5.4, 6.5, 7.3 (a), (c)) is stated against the pinned libraries or named as not statable with the carrier it lacks.

None is statable at the pins: the pinned Tau Ceti has Hecke characters of number fields (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean`) but no theta kernel, no Weil representation of a unitary pair and no algebraic form on a definite unitary group, and Mathlib has only the matrix unitary group (`Mathlib/LinearAlgebra/UnitaryGroup.lean`, line 105).

The smallest repair is the file the sibling roadmaps CongruencesOfTwistedThetaLifts and SelmerBoundsForAnticyclotomicTwists now have: `import Mathlib`, the namespace, and a module docstring that names each headline above and the carriers it lacks, stating nothing.

## R02 (P1) — Six prerequisites are still left to "ShortGRH background", which no roadmap owns; main states four of them

Stands from the previous review, with one entry fewer (2.2 now cites DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a). The *Needs:* lines of 1.2, 2.3, 4.5, 4.6, 5.1 and 5.2 (lines 211, 417, 1029, 1085, 1146, 1191) rest on results that no section of any roadmap states, so nothing in the plan builds them. The description says these go to separate roadmap pull requests; until one exists there is no owner to cite.

Sections on main that I opened and that state the input, in a fuller form:

- 2.3 (the Rallis inner product formula): ThetaLiftsForDefiniteUnitaryGroups §3.2 and ThetaKernelsForUnitaryDualPairs §6.13a;
- 5.2 (the Hecke polynomial through the transposed lift at a split place; zero terms along an isotropic frame): ThetaLiftsForDefiniteUnitaryGroups §2.2 and ThetaKernelsForUnitaryDualPairs §5.7c;
- 1.2 (Hecke operators at split places of a definite unitary group): PotentialAutomorphyInfrastructurePartII §3.3.

The smallest change: cite these sections where the form fits, with a clause where the form used is narrower. State the rest (4.5, 4.6, 5.1 at least) as numbered targets here or in a named member.

## R03 (P1) — This roadmap and DeterminantsOfThetaLiftChains still supply each other

Stands from the previous review. A roadmap has one direction of supply; here neither can be placed before the other.

This roadmap needs DeterminantsOfThetaLiftChains §1.1 to §1.4, §2.1, §2.2, §3.1, §3.3, §3.10 and its Conventions (28 citations; for instance the *Needs:* lines of 2.5, 2.6, 4.2, 6.5, 6.6, 7.1, 7.5). In the other direction the *Needs:* line of DeterminantsOfThetaLiftChains §1.3 (its line 256) cites §1.3 and §2.5 here, and that of its §6.2 (line 1506) cites §7.5. The sections are acyclic; the roadmaps are not.

The repair moves ownership, and which way is the author's choice. Either move 1.3 and 2.1–2.5 ahead of DeterminantsOfThetaLiftChains §1.3 and its §6.2–§6.3 behind this roadmap, or move its Layers 1–3 into an earlier member that both cite.

## R04 (P2) — 5.2 (a) is stated for an arbitrary hermitian space `V`; the formal proof proves it for a definite one

An implementer is asked for more than the route gives: for indefinite `V` the integral over `[U(V)]` that defines a descent of an automorphic `Y` need not converge, so the statement is not even well posed there.

5.2 (a), line 1176, begins "let `W`, `V` be hermitian spaces of ranks `r′` and `r′ + t′`". In the formal proof the space is declared with all signs `+1` (ShortProof-HyperbolicPlaneStep line 61, `V : Space E n 1`), the proof uses that the height on `V` is one (line 319), and the file's header says the step holds when `V` is definite of large rank (line 18). The Origin line of 5.2 also says "a function on a definite group"; only the statement lost it. Every use (5.3, 5.4) has `V = I_n`.

Repair: "let `W` be a hermitian space of rank `r′` and `V` a definite space of rank `r′ + t′`".

## R05 (P2) — Layer 2 restates, for `(U(1), U(2k))`, the theta integral of a definite pair, its Hecke eigenvalues and its norm, which ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 on main state in every rank

Stands from the previous review; the README still does not name that roadmap. Two owners of one object drift apart, and 2.3 rests on a background Rallis formula although main has one (R02).

On main, ThetaLiftsForDefiniteUnitaryGroups §5.1 defines `I_V(φ) = θ_φ(1)` with its class-sum form and its Hecke eigenvalues at split places; §5.2 gives `‖I_V(φ)‖² = C·[∏_{i<n} L^S_E(s + n/2 − i, χ_W)/d^S(s)·∏_{v∈S} Z_v]_{s=s₀}`. At `n = 1`, `d = 2k` the global factor is `L^S_E(k, χ_W)/d^S(s₀)`, which is the `L^S(k, μ_X⁻¹)/ζ_{E⁺}(2k)` of 2.3 (b). Here 2.2 (c) is `φ_X = [U(1)(Ô) : J_X]·Θ(1)` and 2.2 (d) its Hecke polynomial. What this roadmap adds is the local computation for the block datum: 2.3 (a) and the explicit constant of 2.3 (b).

Repair: cite ThetaLiftsForDefiniteUnitaryGroups §5.1, §5.2 (and §3.2) for the theta integral, its eigenvalues and the shape of the norm formula; keep 2.3 (a) and the explicit constant as targets, with one clause on how they differ; narrow "Owned here" (line 1738) to match.

## R06 (P2) — Several passages reproduce the docstrings of the formal proof, word for word or clause by clause

A roadmap is published under the project's licence and states mathematics in its own words; these sentences are the source's. Witnesses (shared consecutive words, the source's parenthetical names of declarations left out):

- the first sentence of Layer 4 (line 860) and ShortProof-ThreeExchanges line 12: 16 words;
- the Origin of 4.2 (line 891), "whose central value folds … at `1, …, e`", and ShortProof-ThreeExchanges line 64: 15 words;
- the Origin of 7.4 (line 1639), "the norm of a lift by an integral form and a congruence denominator", and ShortProof-LiftVolumeHeight line 38: 13 words;
- 2.3 (a) (lines 408–409), from "it is the vacuum off `S₀`" to "`0` otherwise", and ShortProof-CharacterLiftNorm lines 376–378: about 25 words with one article changed;
- the Method of 5.2 (lines 1171–1174) and ShortProof-HyperbolicPlaneStep lines 30–34: the same four clauses in the same order (runs of 5, 4, 6 and 6 words);
- the opening of Layer 1 (lines 132–135) and ShortProof-TestedForms lines 15–19: clause by clause;
- 3.1 (c) (lines 602–606) and ShortProof-OneExchange lines 498–502; 3.1 (d), last clause, and line 170 there.

Rewritten, for instance:

- Layer 4: "Three uses of the exchange identity remove the twist from the functions involved and leave it in one scalar: a multiple of the theta series of the first factors on `U(W_j)` is the function `𝖥_i`, which does not involve the twist."
- 4.2 Origin: "adapted from the equal-rank case of the Rallis inner product formula for a character (Yamana (2014); T. Yang (1997)); the functional equation rewrites its central value as the product of the Hecke L-values at the integers `1` to `e`. Nonvanishing and holomorphy of the stable-range lift of a character are from J.-S. Li (1992). The ramified local terms are computed here."
- 7.4 Origin: "adapted from congruence arguments that control the Petersson norm of a single lifted eigenform through an integral test form and a congruence number (Hida (1981); …): here one operator handles all lifts of good forms at once."
- 2.3 (a): "Prove: for `S₀` and `J_X` as above, the block datum `F` of `O_X` is unramified outside `S₀`, and for a finite point `g` of `U(1)` that is integral outside `S₀` one has `⟨F, ω(g)F⟩ = ⟨F, F⟩·1[g ∈ J_X]` with `⟨F, F⟩ ≠ 0` (this is what sharp means for the action of `U(1)` with the character of `V`); and …"
- 5.2 Method: "Along the Siegel parabolic of the added planes, the constant term of a descent to `W ⊕ ℍ^l` is a descent to `W` and so is zero. What remains of the theta functional is a bounded function (shown in (a)). It is spherical at `w` and satisfies the Hecke equation transferred from `Y`, at a point of modulus below the threshold of (b), so it vanishes."

The other listed passages, and any others taken from the docstrings, need the same treatment.

## R07 (P2) — The sections follow the files of the formal proof one block per file, and the Summary says that the roadmap covers its folder

The organisation of a roadmap is derived from what its final targets need, and a roadmap does not say that it follows a source. The Summary, line 35: "The roadmap covers the folder `New/OneLift` of `[ShortProof]` (24 files)". The description says the same of the section titles.

The pointer lines give the correspondence, each file a block of consecutive sections, in the order of the files:

- 1.1–1.5 ↔ `TestedForms`;
- 2.1–2.2, 2.4 ↔ `CharacterLift`; 2.3, 2.5 ↔ `CharacterLiftNorm`; 2.5–2.6 ↔ `TwistedRatio`; 2.7 ↔ `PeriodAtOne`;
- 3.1 ↔ `OneExchange`; 3.2 ↔ `GluedLattices`; 3.3 ↔ `GluedForms`; 3.4 ↔ `ExchangeData`, `DeterminantProducts`; 3.5 ↔ `LineCoordinates`; 3.6 ↔ `FirstFactors`;
- 4.1–4.3 ↔ `ThreeExchanges`; 4.4–4.5 ↔ `ThetaKernelEstimates`; 4.6 ↔ `ProductsSpan`;
- 5.1 ↔ `BottomOfTower`; 5.2 ↔ `HyperbolicPlaneStep`; 5.3–5.4 ↔ `PeriodsOfFalseLifts`;
- 6.1 ↔ `AlgebraicPartIntegrality`; 6.2 ↔ `AlgebraicPartSize`; 6.3 ↔ `CentralAction`; 6.4–6.6 ↔ `TwistedValueHeights`;
- 7.1–7.3 ↔ `GluingMaps`; 7.4–7.5 ↔ `LiftVolumeHeight`.

The seven layers are the roadmap's own grouping (the source's folder `HeckeValues` is split between Layers 2 and 6, `ComparisonOperator` between 3, 4 and 7), and their order is forced by the *Needs:* lines (3.4 → 2.1, 5.4 → 3.2, 6.4 → 3.3 and 5.4, Layer 7 → all). The scope of each section is the scope of a file.

Repair, keeping the layer ids: drop the sentence of the Summary (the pointer lines carry the provenance). Cut sections by result where a file's scope was kept: 2.6 goes to DeterminantsOfThetaLiftChains §1.2 (C02); 2.7, which no section here uses, forms its own layer or moves to its consumer; auxiliary lemmas that sit in a section because they sit in its file (1.2 (d), 3.4 (c)–(e), 6.2 (c), 6.4 (a) look like such) would go to the section that uses them; 4.4 and 4.5, which only 4.6 needs, would form one section on what "products span" requires. These are options; the cut is the author's. For the main results name published statements with locators: C. Wu (2021), Proposition 3.1 (1), pp. 10–11 (Wu2021 line 416) for 5.4; for 2.3, the Rallis inner product formula as ThetaLiftsForDefiniteUnitaryGroups §3.2 gives it, and Rallis (1984b), which the previous review read at Proposition 1.1, pp. 149–150 (I could not reopen it).

## R08 (P2) — The pull request changes three files outside the roadmap folders

Stands from the previous review: `README.md` (one line), `umbrellas/GRH.toml` and `umbrellas/GRH-targets.md` (the diff against the base lists exactly these three). A comment on the pull request says that the human reviewers have decided that these files belong in it. This review cannot take a comment as that decision, so the point is recorded here and under the questions for the human reviewers; if they confirm, nothing is asked of the author.

## C01 — `Ξ_{ϑ,i}` names two functions that differ by the factor `c″`

4.3 (line 940) defines `Ξ_{ϑ,i}` as the left side of the third exchange, with `c′_ϑ·Ξ_{ϑ,i} = 𝖥_i`; 7.1 (d) (line 1550) uses the same letter for the theta series of the first factor, `c″` times the former, with `c′_ϑ·Ξ_{ϑ,i} = c″·𝖥_i`. Both are right for their own function (ShortProof-ThreeExchanges line 752, ShortProof-GluingMaps lines 263 and 321, where they are two declarations). A second letter in one place removes the clash; the table of symbols (line 122) then needs both.

## C02 — Three objects are stated both here and in DeterminantsOfThetaLiftChains

2.6 (a) is DeterminantsOfThetaLiftChains §1.2 (c) for all critical pairs; 2.2 (a) and (d) are its §2.1 (b) and (d) at rank one; the predicate of 1.4 is the first clause of its §1.3 (b) with a pairing condition added. State each once and cite it from the other side, or say in one clause how the kept variant differs.

## C03 — The sketch of 6.6 counts `5m/2 + k/2` main pairs, while 6.6 (a) uses `k/2`

The sketch (line 1485) says the pair `p_*` at a point `z` is a main pair when `m < z`. That is true, but 6.6 (a) takes as main pairs only the points `7(m/2) < z ≤ z_*`, which gives `2·#A = k`; the points `z ≤ 7(m/2)` are counted among the `5m` ramified pairs (ShortProof-TwistedValueHeights lines 1040–1048). Say so in the sketch.

## C04 — The sketch of 6.5 charges the class number twice and uses one test form where two are needed

The sketch (lines 1462–1463) bounds the pairing of projections "by 6.3 and the denominator bound of the family" and carries a factor `ℓ^{−v_ℓ(h)}`, which the final sum `6β_tot − h_dir` does not account for. The second clause of DeterminantsOfThetaLiftChains §1.3 (b) already gives `|ι⟨pr Ξ, pr Ξ′⟩| ≤ exp(γ(ℓ))`; CongruencesOfTwistedThetaLifts §7.2 (e) has put the class number into `γ`. The formal proof uses that clause directly (ShortProof-TwistedValueHeights line 919) and takes two test forms, one for `ι` and one for `ι∘conj` (lines 890–897), since 6.4 (b) controls `⟨Ξ, φ⟩` at one embedding only. The count is then `(β_tot − Σ_τ s_∞) + β_tot + 2x₁ + (2β_tot + Σ_τ s_fin) ≤ 6β_tot − h_dir`. 6.3 can leave the *Needs:* line.

## C05 — Two lines concern other roadmaps' use of steep parameters

"Downstream consumers" (line 1723) and "Not owned here" (line 1754) mention steep parameters of PairsOfFramesAtOnePlace. Nothing in this roadmap uses or supplies them. Unchanged from the previous review.

## C06 — Published works are cited without locators

Unchanged from the previous review. One locator verified this round: for 5.4, C. Wu (2021), Proposition 3.1 (1), pp. 10–11 (Wu2021 line 416), which is the vanishing of periods below the first occurrence.

## C07 — Two sentences of the description do not hold for this roadmap

"Where a section of an existing roadmap, or a theorem already in the library, gives what the route uses, it is cited and not restated", and "Where an existing section states a fuller or differently normalised form, the roadmap says so". Here Layer 2 neither cites nor names ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 (R05), and four background inputs have sections on main (R02). A true version would except this roadmap, or the README would name those sections.

## N01 — About 380 names and paths of `[ShortProof]` stand in code font after the sections

A reader cannot tell them from library names without the family index. Unchanged.

## N02 — Several letters carry two meanings

`k`, `m`, `n`, `t`, `d`, `r` and `S` each (for instance `k` is `r + 1 − m` and half the rank in 2.3). Unchanged.

## N03 — The normalisation of the Hecke polynomial has no Check

For the constant form at a split place `H_w(X)·1 = ∏_{l<n}(1 − q^l X)·1`; the monic convention would give `∏_{l<n}(X − q^l)` and change the test value of 1.3. Unchanged.

## Verified sound

| Statement | Instances tried | Values computed (README / source or computed) | Result | Change |
|---|---|---|---|---|
| 1.1 (a)–(d) | `A = 1`; ShortProof-TestedForms lines 142, 175, 281 | `⟨δ_h(v), φ⟩ = ⟨v, φ(h)⟩_ρ` both; datum modulo squared chosen places times twist places both; point datum identical | agrees | none |
| 1.4 | `Z = 0`; ShortProof-TestedForms lines 411–419 | determinant on the zero space `1 ≥ exp(0)`; exponent `dim Z·r·β` both; pairing clause both | agrees | none |
| 2.3 (a), (b) | `Q = ∅`; ShortProof-CharacterLiftNorm lines 380, 559–575 | mass `∏q^{−2k}·∏(q−1)/q` over the index both; six factors of (b) both; `Q = ∅` gives last factor `1` | agrees | R05, R06 |
| 2.5 | `ϑ = 1`; ShortProof-CharacterLiftNorm lines 78, 112; ShortProof-TwistedRatio lines 177, 213 | `n_ν = M^{4fz}(Md)^j` both; `L^alg = ‖φ‖²/Nm Q^{2z−1}` both; at `ϑ = 1` ratio `1 = L^alg/L^alg` | agrees | none |
| 2.6 (a) | `ϑ = 1`; ShortProof-TwistedRatio line 425 | both sides `L_*(𝒞, ν⁻¹, z)`; exponent `z²` of `Nm Q` both | agrees | C02 |
| 3.1 (a)–(d) | `z ∈ H`, `z ∉ H`; ShortProof-OneExchange lines 106, 227, 503, 172 | both sides `χ(det z)F(z⁻¹y)` or `0`; `𝔪 ≠ (1)` in both; matched for `χ⁻¹` both | agrees | R06 |
| 3.6 | `Q(ϑ) = ∅` and not; ShortProof-FirstFactors lines 517, 661 | bound `exp(f·m·b·(log b)²)` both; `c″` independent of `i`, `ϑ`, `h` both | agrees | none |
| 4.1 | `m`, `k` even; ShortProof-ThreeExchanges lines 91, 95, 148 | `z₊ = m`, `z₋ = m/2`, `z_* = 7(m/2) + k/2`, `n = j + (t − 11m − 1)/2` both | agrees | none |
| 4.3 (a), (b) | ShortProof-ThreeExchanges lines 645, 752, 916 | `|c′_ϑ|² = C/Γ_j(ϑ)`, `c′_ϑ·Ξ = 𝖥_i` both; hypothesis `u·w = Λ_i` both | agrees | C01 |
| 4.4 (b) | ShortProof-ThetaKernelEstimates line 201 | constant `6N(f·n)²·n′·n` both; `N ≠ 0` in the different both | agrees | none |
| 4.5 (a), (b) | ShortProof-ThetaKernelEstimates lines 809, 985 | gap `300n_*`; `|u| ≤ 5b` on `u` only; `b^{n_*}`; `(4b^{n_*} + 1)δ`: all both | agrees | none |
| 5.2 (a) | `V` indefinite; ShortProof-HyperbolicPlaneStep lines 61, 441–449 | README any `V`; source signs of `V` all `+1`; `|X| = q^{1−t′−r′/2}`, `2r′ + 2l + 3 < r′ + t′` both | hypothesis missing | R04 |
| 5.2 (b) | `q = 2`, `n′ = 1`; ShortProof-HyperbolicPlaneStep line 68 | condition `q^{n′+1}·|X| ≤ 1` both; instance `|X| ≤ 1/4` | agrees | none |
| 1.3, 5.3 test value | `|ν_W(w)| = q^{r/2}` | `|X_*| = q^{1−t−r/2}`, the modulus 5.2 (a) asks with `r′ = r`, `t′ = t` | consistent | none |
| 5.4 (b), 7.3 (b) ranges | `r = 1`; `n = r + t` | `2 + 2#N + 3 < n ⟺ 2#N + 5 < n`; `2r + 2#N + 3 < r + t ⟺ r + 2#N + 3 < t` | consistent | none |
| 6.1 (a), (c) | ShortProof-AlgebraicPartIntegrality lines 63, 74, 214, 254, 369 | `|j(c_a)| ≤ 1` for `l ∤ Nm Q` both; `n_ν·φ` integral at such `l` both; untwisted part integral at every `ι` both | agrees | none |
| 6.4 (b) | ShortProof-TwistedValueHeights line 704 | `|σ(c₀)| ≤ exp(f·m·b/k + 3x^{34})` both; factor `l^{−S_l}` both | agrees | none |
| 6.5 | ShortProof-TwistedValueHeights lines 864–968; CompositeThetaLiftsAndShortForms §2.2 (c) | `s_fin = Σ_p 2s_p log p`, so `2Σ_ℓ S_ℓ log ℓ = Σ_τ s_fin` (README now the same); total `4β_tot + 2x₁ − h_dir ≤ 6β_tot − h_dir` | statement agrees; factor 2 repaired | C04 |
| 6.6 (a), (b) | `ϑ = 1`; ShortProof-TwistedValueHeights lines 1029–1050, 1070 | `#A = z_* − 7(m/2) = k/2`; `#B = 7(m/2) + m + m/2 = 5m`; `2·(k/2)(6β_tot − h_dir) + 2·5m·x₁` | agrees | C03 |
| 7.1 (b)–(e) | ShortProof-GluingMaps lines 354, 374, 263, 321, 503 | `glue = M^{l₁}·ΣΣΣ` product forms both; `c′Ξ = c″𝖥` both; factors `M^{l₁}·c_γ·#Γ` both | agrees | C01 |
| 7.3 (a)–(d) | `𝒢(W_j) = 0`; ShortProof-GluingMaps lines 1052, 1060, 1072, 1088 | `c′·glue^*Θ = Θ°` both; (d) needs a nonzero good form: SecondMomentsOfPoincareSeries §2.3 (b), §5.7 (c) give `d_T > 0` | agrees | none |
| 7.4 | ShortProof-LiftVolumeHeight lines 176–206 | five conditions equal the five fields; `U = n_GL·hk²·glue∘glue^*`; `exp(3f·m·b·(log b)²)²` both | agrees | none |
| 7.5 (a)–(d), headline | `ϑ = 1`; ShortProof-LiftVolumeHeight lines 629, 656, 699, 733–783 | at `ϑ = 1`: `vol·det = C`; `d(3A + rβ_tot + 10m·x₁ + k(6β_tot − h_dir)) ≤ d·k(log b·β_tot − h_dir) = d(f·a·(log b)⁴/m − k·h_dir)` | agrees | none |

- Source locators checked against the text: 13 of the 24 files of `[ShortProof]` under `New/OneLift` opened, about 60 declarations read at their lines for the 15 sampled sections and for 4.4 (b), 6.4, 7.4, 7.5; Wu2021 line 416.
- Library declarations opened at the pins: `Mathlib/LinearAlgebra/UnitaryGroup.lean` line 105; `TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/` (present); no theta kernel, Weil representation or algebraic form on a unitary group in either library.
- Cross-roadmap citations resolved: 20 sections: DeterminantsOfThetaLiftChains Conventions, §1.1–§1.3, §2.1, §6.2; SecondMomentsOfPoincareSeries §2.3, §5.7; CompositeThetaLiftsAndShortForms §2.1, §2.2; CongruencesOfTwistedThetaLifts §7.2 (e); on main ThetaLiftsForDefiniteUnitaryGroups §2.2, §3.2, §5.1, §5.2, ThetaKernelsForUnitaryDualPairs §5.7c, §6.13a, PotentialAutomorphyInfrastructurePartII §3.3, DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5a, FiniteReductiveGroups §5.7.
- Automatic checks: the one that fails is real (no `Suggested.lean`, R01). Dependency check output: `depcheck: 120 roadmaps, 1363 edges, 0 problem(s)` (the siblings are not in the merge order, so R03 is invisible to it). Elaboration and the `#check` comparison: not possible, the folder has no Lean file.
- Earlier findings: former R04 (factor 2 in 6.5) repaired, "`2·Σ_ℓ S_ℓ log ℓ = Σ_τ s_fin(κ(τ), τ)`"; former R01, R02, R03, R05, R06 stand as R02, R03, R01, R05, R08 here. Former C01 repaired (1.3 (c) is now for `r = 1`); former C02–C07 stand as C01, C02, C03, C05, C06, C07. Former questions: 7.3 (d) answered by its new *Needs:*; 4.4 (b) agrees with the formal statement.
- Ownership against open pull requests: searched for false lifts, the exchange identity, the lift of a character from `U(1)` and the gluing map; no owner outside this pull request apart from the sections on main named in R02 and R05.

Overlap check: the three closest-roadmap lists are empty. Read instead ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs and PotentialAutomorphyInfrastructurePartII (main), and DeterminantsOfThetaLiftChains, CongruencesOfTwistedThetaLifts, SecondMomentsOfPoincareSeries and CompositeThetaLiftsAndShortForms (this pull request). Shared objects and owners: the theta integral of `(U(1), U(2k))` and its norm, ThetaLiftsForDefiniteUnitaryGroups §5.1–§5.2 (R05); the Rallis formula, its §3.2 (R02); the `L_*` identity, the Hecke polynomial of a lift and the denominator predicate, DeterminantsOfThetaLiftChains §1.2 (c), §2.1, §1.3 (b) (C02).

Source independence: 17 passages compared with 2 sources (16 with `[ShortProof]`, 1 with Wu2021); 9 shared with `[ShortProof]`, the longest runs 16, 15 and 13 words (R06); largest share `[ShortProof]`, 39 of 39 section pointers; contents compared with the file list of `[ShortProof]` `New/OneLift`: the sections follow it file by file (R07), the layers do not.

Research link: the headline 7.5 (d) is a step of an unpublished formal proof of GRH for Dirichlet L-functions (family index). Its published inputs are the Rallis inner product formula (Rallis 1984; Li 1992), theta lifts from `U(1)` (Yang 1997) and vanishing of periods below the first occurrence (Wu 2021, Proposition 3.1). Rests on the README's Origins and Wu2021 line 416.

## Not verifiable

- The 11 files of `[ShortProof]` `New/OneLift` outside the sample (pointers of 2.7, 3.2–3.5, 4.6, 5.1, 5.3, 5.4, 6.2, 6.3) and the background declarations under its `Lib`: not opened.
- Rallis (1984b) and Harris, Li and Skinner (2005): no legal copy found from the citation this round. Rallis (1984a), Yang (1997), Gross (1999) and the other published works: cited without locators, not opened.
- The numerical inequalities of the data used in 6.2 (d) and 7.2: they rest on OneSidedPrimeSumBoundsAndAdmissibleData §3.3, not recomputed.

## Source issues

- none

## For the human reviewers

- **Scope:** every section points to one unpublished formal proof (`[ShortProof]`, README line 1792); 16 of 39 sections are "particular to this proof"; main has the family RiemannHypothesisForDirichletLFunctions for the same end theorems.
- **Licence:** the repository's front page says "Apache 2.0, Copyright 2026 Anthropic, PBC". Several README passages are its docstrings' wording (R06); whether that reuse needs attribution or rewriting is a licence question.
- **Licence (host):** to read `[ShortProof]` I classified `github.com/lsernau/grh-lean` as its author's own page, from the first-person authorship statement on its front page; the author's full name is not given there.
- **Files outside the family:** `README.md`, `umbrellas/GRH.toml`, `umbrellas/GRH-targets.md` (R08). A pull-request comment of 2026-11-26 says the human reviewers decided they belong; please confirm.
- **Deferrals:** the description says the background entries and the two-way supply between members are "as decided by the human reviewers". I found no such decision in the conversation for these two; R02 and R03 depend on it.

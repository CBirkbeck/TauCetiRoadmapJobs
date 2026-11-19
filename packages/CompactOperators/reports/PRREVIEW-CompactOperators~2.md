# Review of CompactOperators (pull request #2546 at dec33f7)

**Verdict:** accepted

**Summary.** Accepted: there is no finding. Every Check, worked example and headline statement I recomputed is true. The source locators I opened (Serre, Johansson–Newton, Kedlaya, Schikhof, De Grande–De Kimpe) support the claims as written. Both earlier findings are repaired: the Riesz–Coleman and index-zero headlines are now stated, and the supplier definitions are imported from Tau Ceti. There are three small corrections and two format notes, none blocking. The human reviewers have three points to look at: the pinned Tau Ceti already implements most of this roadmap under its own definitions, the licence of the provenance repository, and Coleman 1997, which is behind a paywall.

## C01 — `colemanDBounded_succ` is already proved at the pin, so as a target it asks an implementer for nothing

The pinned Tau Ceti has the same definition as `Polynomial.colemanDBounded` (`TauCeti/RingTheory/Polynomial/Resultant/Coleman.lean:74`), with the arguments in a different order, and the padding identity as `Polynomial.colemanDBounded_succ` (line 111). With that module imported, the body `exact Polynomial.colemanDBounded_succ hP hB` closes the theorem at `Suggested.lean` line 339. The linter also reports that the hypothesis `hP0` is unused. LocallyAnalyticDistributions (§4.9 row of its table) cites the name, so the declaration has a reason to stay. Its docstring could say that it is the named interface for that citation, not a target, or the statement could stay in README §3.3 only.

## C02 — The finite lattice comparison of §4.4 is restricted to a discrete valuation ring, though Convention 2 says discreteness is never assumed

Convention 2 (lines 78–81) says field results assume no discrete valuation. **Finite lattice comparison** (lines 992–1003) nevertheless asks for "a finite free lattice over a discrete valuation ring", because it uses Mathlib's `Submodule.smithNormalForm` for PIDs. The cited source is more general: Kedlaya2007 §3, Theorem 16 (line 191) is stated for any nonarchimedean field. The diagonalisation it needs also exists over every rank-one valuation ring: take an entry of least valuation, which divides all the others, and clear its row and column. Either of two changes would fix the mismatch. One is to state the comparison over the valuation ring of `K`, with Smith form over a valuation ring as a target here. The other is to add a clause to Convention 2 saying that §4.4's lattice comparison is the one place where a discrete valuation is assumed.

## C03 — The description undercounts the proposed names that leave code font: `fredholmDet` is a thirteenth

The description says that twelve names "the README on main gave in code font are affected" and that LocallyAnalyticDistributions cites all twelve. `fredholmDet` is a thirteenth such name: main's README has it in code font at line 588, and the head writes the Fredholm determinant at one in prose (§2.4, line 668). LocallyAnalyticDistributions also cites it (table, line 213). It exists at the pin as `ContinuousLinearMap.fredholmDet` (`TauCeti/Analysis/Normed/Operator/Nonarchimedean/FredholmDet.lean:84`). Correct text would be: "Thirteen names … `IsRieszColemanProjection` and `fredholmDet`. … Nine of them exist as Tau Ceti declarations at the pin."

## N01 — The module docstring does not account for five of the theorems in `Suggested.lean`

`IsRowCompact.transpose`, `isCompletelyContinuous_of_isCompactOperator`, `colemanDBounded_succ`, `exists_newtonMajorant` and `colemanDEntire_isEntire` are not in the headline list (lines 17–41), and they are not in the sentence naming the non-headline interfaces (lines 45–47). LocallyAnalyticDistributions §§4.9 and 4.13 cite the last three by name, so they could be added to that sentence.

## N02 — Two hypotheses are redundant

In `norm_charCoeff_of_unit_minors`, `hd : ∀ i, d i ≠ 0` follows from `hdec`, since a strictly decreasing sequence of norms is positive at every index. In `colemanDBounded_succ`, `hP0` is unused (C01).

## Earlier findings

- R01 is repaired. `exists_rieszColemanProjection` is stated (`Suggested.lean` lines 425–444) in the retract form that review suggested, `isFredholm_one_sub_smul` now concludes `(1 - a • u).index = 0` (line 329), and the docstring lists §3.4 as stated (lines 37–39).
- R02 is repaired. The file imports the seven Tau Ceti modules (lines 2–8), the local copies are gone, and Convention 10 (README lines 130–137) and §2.1 (lines 600–601) name the Tau Ceti declarations.
- C01 is partly repaired and now settled. `opNorm_eq` and `IsRieszProjection.eq_zero_of_order_zero` are removed. `isFiniteRank_iff_range_fg`, which still closes with one `exact`, and `IsFiniteRank.isCompletelyContinuous` are kept with a stated reason (docstring lines 45–47). The reason holds: AdicSpacesPartIII README line 9779 and LocallyAnalyticDistributions lines 185, 194 and 2137 use them by name. Not re-raised.
- C02 is repaired: locators now sit at the claims (README lines 345, 415, 442, 449, 461, 664, 670, 683, 716, 770, 869).
- C03 is repaired: §1.7 cites AdicSpacesPartII §R0.5(f) for the field case (lines 523–525), and so does the scope section (lines 1162–1165).
- C04 is repaired in the description, apart from the count (C03 above).
- C05 is repaired: line 626 points to RestrictedPowerSeries §7.2's Checks.
- N01, N02 and N03 are repaired: the Provenance wording (line 1125), Convention 8 (lines 117–121), and the Check moved under **Two-sided matrix estimates** (lines 1028–1033).

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| Headline 1: `isRowCompact_iff_isCompletelyContinuous` (§0.5) | finite-rank `v` over `K`; Serre §3 Prop. 4 and corollary | `rᵢ(v) ≤ C·maxₖ|yₖ(i)| → 0`; `rᵢ(u) ≤ max(rᵢ(v), ‖u−v‖)`; `‖u − π_S u‖ = sup_{i∉S} rᵢ` | true | none |
| `hasCompactoidImage_iff_isCompletelyContinuous`; `_of_isCompactOperator` | Schikhof §2.15 p. 566; compact set | ε-net centres `vᵢ` give `x` within ε of `1·vᵢ`; image of the closed ball lies in `c·K` with `|c| > 1/δ` | true | none |
| `isCompletelyContinuous_iff_isCompactOperator` | `ℂ_p` line; locally compact `K` | identity of the `ℂ_p` line: finite image, unit ball not compact; Serre §3 Prop. 5 p. 73 for the converse | true | none |
| Headline 2: `charPowerSeries_isEntire`, `isUnit_one_sub_smul_iff` | `I = ∅`; `diag(pⁱ)`, `a = 0` | `I = ∅`: `H = 1`, `1 − au = 0 = 1`, both units; invertible iff `a ∉ {p^(−i)}`; `H(0) = 1` but `0 ∈ spectrum` | true | none |
| `isFredholm_one_sub_smul` | `a = 0`; Serre corollary p. 82 | `a = 0`: kernel and cokernel 0; codimension of image = dimension of kernel gives index 0; Mathlib fields at `Fredholm/Basic.lean:123` | true | none |
| Headline 3: `exists_rieszColemanProjection` | `diag(λ, μ)`; `Q = 1`; `M = 0` | `Q*(u) = diag(0, μ−λ)`; `μQ − λS = μ − λ`; `Q = 1`: `E = 0`, `w = 1`; `M = 0` forces `deg Q = 0` (evaluate `QS = 1` at `X⁻¹` in `R[X]/(Q*)`) | true; JN Thm 2.2.2 p. 10 matches | none |
| `exists_rieszProjection` (§3.1) | `1 + N`; `diag(λ, μ)`; `h = 0`; `diag(a⁻¹+ε, a⁻¹−ε)` over `K[ε]` | `b = 0`, `E = 1`; `p = diag(0,1)`; `h = 0`: `E = 0`; ε example: `H = (1−a⁻¹T)²`, order 2, `E = 1`, rank 2 | true; `e^(h+1) = e^h` gives `Cw = p` | none |
| Headline 4: `charPowerSeries_eq_colemanDEntire` | finite `A`, `B(0) = 0`; `B = 1` | `D_(N,M) = (1−TB(0))^(N−n) D_n = det(1 − T B(A))`; `B = 1` gives the identity, excluded by `hB0` | true | none |
| §0.4 sample | row-compact idempotent `E`; identity on a (Pr) module | `‖x − Eπ_S x‖ ≤ ‖E‖‖E − π_S E‖‖x‖ < ‖x‖`, so `range E` is a retract of `R^S`; `HasPr.projective` needs `Module.Finite` | true | none |
| §1.1 sample | `[[0,1],[0,0]]`; `diag(a, 0)`; empty matrix | `det [[1,−T],[0,1]] = 1`; `reflect 2 (1−aT) = T² − aT`, `reverse = T − a`; empty determinant 1 uses `‖1‖ = 1` | true | none |
| §1.2 sample; `norm_charCoeff_mul_pow_le_of_rowNorm_le` | `diag(pⁱ)`; `n < |T|`; `q = 0` | `cₙ = (−1)ⁿ p^(n(n−1)/2)/∏(1−pʲ)`; `B^|S∩T| q^|S∖T| ≤ B^|T| q^(n∸|T|)`; Serre Prop. 7 pp. 75–76 | true | none |
| §1.3 sample | `n = 1`; `Tᴺ` | `‖c₁(u) − c₁(v)‖ = ‖Σ(aᵢᵢ − bᵢᵢ)‖ ≤ ‖u − v‖`; Gauss norm of `Tᴺ` at radius 1 is 1; Serre Prop. 8 p. 77 | true | none |
| §1.5 sample | `K × K`, `e = (1, 0)` | `det = 1 − eT = (1 − T, 1)`; leading coefficient `−e` not a unit; ranks `(1, 0)` | true | none |
| §1.6 sample; `charPowerSeries_eq_mul_of_comm` | commuting idempotent `p` | `(1 − Tup)(1 − Tu(1−p)) = 1 − Tu + T²u²p(1−p) = 1 − Tu` | true | none |
| §1.7 sample; `c0_completedBaseChange` | `I = ∅`; `φ = id`; `ℚ_p × 𝔽_p((t))` | `‖Θ(Σ s⊗x)‖ ≤ L max‖s‖‖x‖`; inverse `Σ yᵢ ⊗ eᵢ` has bound 1; `ϖ = (p, t)` scales by `p⁻¹`; product seminorm ultrametric | true; hypotheses satisfiable | none |
| §2.1 sample | `T²` in characteristic 2; `Σ p^(n²) Tⁿ` | `Δ²T² = 1`, ordinary second derivative `2 = 0`; `p^(−n²) rⁿ → 0`; exponential radius `p^(−1/(p−1))` | true | none |
| §2.2 sample | `Q = T − c`; `Q = T` | `Gₙ = Σₖ a_(n+1+k) cᵏ` satisfies `aₙ = G_(n−1) − cGₙ`; `Q = T` gives `G_n = a_(n+1)` | true | none |
| §2.4 sample | identity of a line; `[[1,ε],[0,1]]` | `V₁ = u − 1 = 0`, so `V = 1`; `V = (1−T) + T(u−1)`, `V₂ = (u−1)² = 0`; Serre Cor. 1 with `u, v ↦ −u, −v` | true | none |
| §3.3 sample; `colemanDBounded`, `_succ` | `D_(1,0)(1,1)`; `B = c`, `P = 1` | `Res_(1,0)(X, 1−T) = 1 − T`; Mathlib's `Res(X − r, g) = g(r)` fixes the sign; `(1−cT)ᴺ` has steps of norm `|c|` | true; closes by a Tau Ceti lemma | C01 |
| §3.4 sample (invertibility criterion) | `diag(λ, μ)`, `Q = 1 − λT` | `Q` and `H_u` share `1 − λT`; `Q*(u) = diag(0, μ−λ)` not invertible; `Q`, `S` coprime | true | none |
| §4.2 sample | `1 − pT²` | Newton points `(0,0)`, `(2,1)`: slope `1/2` twice; eigenvalues `±√p` | true | none |
| §4.4 sample | `[[p,1],[0,p]]`; `p^max(2i−j,0)`; dense value group | row `(0,1)`, Hodge `(0,2)`, Newton `(1,1)`; columns null, every row has 1s; `‖dᵢ‖ → c > 0` makes `c₁` diverge | true; DVR-only lattice step | C02 |
| `norm_charCoeff_of_unit_minors` | `n = 0`; `S ≠ {0,…,n−1}` | unit minors force `rᵢ(u) = ‖dᵢ‖ → 0`; other `S` give at most `∏_(i<n−1)‖dᵢ‖·‖dₙ‖ < ∏_(i<n)‖dᵢ‖` | true; `hd` redundant | N02 |
| §4.5 sample | `diag(p⁻¹, 1, p, …)`; nilpotent summand | `M_(≤0) = ⟨e₀, e₁⟩`, `M_(=0) = ⟨e₁⟩`; an `AddValuation` sends nilpotents to `⊤`, so no finite slope | true | none |
| `exists_newtonMajorant`; `IsRowCompact.transpose` | `F = 1`; a row of 1s | `‖a₀‖ = 1 ≤` empty product; slopes of the lower hull give `ρ`; existence of `v` forces each row of `u` to be null | true | none |
| Description, names leaving code font | main README line 588 | `fredholmDet` in code font on main, prose at head; cited by LAD line 213; exists at the pin | 13 names, not 12 | C03 |

- Source locators checked against the text: 20. Serre1962 §1 Rem. 2 (line 101), §3 Prop. 4 and corollary (lines 157, 174), Prop. 5 (line 177), §5 Prop. 7(a)–(b) and Corollaries 1–2 (lines 273–313), Prop. 8 (line 335), §6 Prop. 10 (line 388), §7 Prop. 11 (line 438), Prop. 12 with `p = eʰ` (lines 448–491), corollary p. 82 (line 506); JohanssonNewton Thm 2.2.2 (line 536); Kedlaya2007 Thm 16 (line 191); Schikhof §§2.7, 2.13, 2.15 (lines 432, 625, 708); DeGrandeDeKimpe1982 §§1.1, 2.1 (lines 45, 101).
- Library declarations opened at the pins: 24 in Tau Ceti, among them `PseudoUniformizer.lean:136, 150, 326`, `RingOpNorm.lean:149, 223`, `ZeroAtInfty/Basic.lean:50`, `ZeroAtInfty/Matrix.lean:90`, `Entire/Basic.lean:76`, `EvalAt.lean:96`, `HasseDeriv/Basic.lean:72`, `CompletedTensor.lean:454`, `Resultant/Coleman.lean:74, 111`, `RowCompact.lean:115`, `CompletelyContinuous.lean:103`, `PotentiallyONable.lean:252`, `Entire/Preparation.lean:223` and `NewtonPolygon/Basic.lean:100`. Six in Mathlib: `Resultant/Basic.lean:51, 131, 365`, `Fredholm/Basic.lean:123`, `LinearMap/Index.lean:39`, `MvPowerSeries/GaussNorm.lean:58`.
- Cross-roadmap citations were resolved on main (1b7b481). The 11 bold labels that other roadmaps cite all exist at the head, and the overlap report lists no dropped section ids. LocallyAnalyticDistributions' interface table was compared name by name (35 names).
- Automatic checks: every check passed. Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`. Nothing changes outside the folder.
- Elaboration: `Suggested.lean` elaborates with 23 `sorry` warnings and nothing else. `#check @` was run on all 39 declarations and each type compared with its README statement. The six "dropped binder" leads are definitions that drop only binders their bodies do not use; every theorem keeps the instances it needs.
- One-tactic probes on a copy of the file: `isFiniteRank_iff_range_fg` closes with one `exact` (settled; see the earlier findings). `colemanDBounded_succ` closes with `exact Polynomial.colemanDBounded_succ hP hB` after building `TauCeti.RingTheory.Polynomial.Resultant.Coleman`. `IsFiniteRank.isCompletelyContinuous` does not close with `simpa`.
- Ownership against open pull requests: read QuaternionicModularForms, AutomorphicGaloisRepresentations and PadicFamilies at their heads. Each consumes these objects (from CompactOperators, or through LocallyAnalyticDistributions and Tau Ceti) and none states them as its own.

Overlap check: read LocallyAnalyticDistributions, PadicFunctionalAnalysis and RestrictedPowerSeries (main); QuaternionicModularForms, AutomorphicGaloisRepresentations and PadicFamilies (open); and AdicSpacesPartII and OperatorTheory/OperatorIdeals. Owners of the shared objects: Fredholm series, Riesz and Coleman theory belong to CompactOperators and the others cite them. Banach–Tate data and `c₀` matrices belong to PadicFunctionalAnalysis. Entire-series algebra belongs to RestrictedPowerSeries. The field `c₀` tensor comparison is AdicSpacesPartII §R0.5(f), with the ring variant here. Approximation numbers belong to OperatorIdeals Part A; there "finite-rank approximable" is terminology, not a target, so it does not collide with `IsCompletelyContinuous`.

Source independence: 10 passages compared with 5 sources (Serre1962 Props. 4, 7, 11, 12; JohanssonNewton Thm 2.2.2 against §3.4 and the Lean docstring; Schikhof §2.15; DeGrandeDeKimpe1982 §§1.1, 2.1; Kedlaya2007 Thm 16); nothing shared beyond what the mathematics forces (longest run 3 words, "lie in the", against JN Thm 2.2.2). Largest share: Serre1962, 20 of 39 source mentions. Contents compared with Serre1962 §§1–7: independent. §§0.3, 0.4, 1.1, 1.5, 1.7, 3.3 and Layer 4 have no Serre counterpart; the order is forced by the *Needs:* lines of §1.2 (on §0.2), §2.4 (on §§1.2–1.4) and §3.1 (on §§2.3–2.5). Coleman1997 was not read.

Research link: Layers 1–3 are the Fredholm and Riesz theory of Serre (1962), extended by Coleman (1997) to Banach coefficient algebras. Coleman uses it for p-adic families of modular forms, and Johansson–Newton (arXiv v4, §2.2) use it for extended eigenvarieties; LocallyAnalyticDistributions and PadicFamilies consume it for slope decompositions. This rests on the README summary and JohanssonNewton §2.2.

## Not verifiable

- Coleman 1997 (Invent. Math. 127), Appendix A3–A4, cited in README §§2–3 and in the docstring of `charPowerSeries_eq_colemanDEntire`: the manifest records it as uncertified (paywalled), so it is cited by its locator only and was not read.

## Source issues

- **Misprint** in Kedlaya2007 at §3, the sentence before Theorem 16, p. 5: the notes introduce Theorem 16 as the archimedean analogue of Weyl's inequality; it should say nonarchimedean, since the section works over a nonarchimedean field; affects nothing.

## For the human reviewers

- The pinned Tau Ceti already proves much of `Suggested.lean` for its own definitions: for example `ContinuousLinearMap.isRowCompact_iff_isCompletelyContinuous` (`RowCompact/CompletelyContinuous.lean:129`), `IsRowCompact.isUnit_one_sub_smul_iff` (`Nonarchimedean/Spectrum.lean:96`) and `Polynomial.colemanDBounded_succ`. The file restates these on local copies of `IsRowCompact`, `IsCompletelyContinuous` and `colemanDBounded`.
- Licence: the Provenance section (README lines 1121–1135) names W. Coram's PhD repository at commit `eefb3d9`. Its LICENSE at that commit is Apache 2.0, which I read. I did not compare `Suggested.lean` with that repository.
- Not tested: Coleman 1997 is paywalled and recorded as uncertified, so the Appendix A3–A4 locators were not read.

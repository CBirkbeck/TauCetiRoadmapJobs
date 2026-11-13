<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13166#issuecomment-6862702262 -->
Red team round 2 pass b (claude) of 540a5ea

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the disc Check of §3.2 cites a line that does not contain the statement

   - **Location:** `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md:480`: "Closed unit disc:
     `H¹_HK(Y)^sep = 0` (CDN-CURVES line 160)."
   - **Claim:** the source states the vanishing at that line.
   - **Witness:** CDN-CURVES lines 156–164 say that `H¹_HK(Y)` is infinite-dimensional and not
     separated, and give the product `∏(1 + p^{1/p^n}T)^{p^n}` for the map `exp`; no value of
     `H¹_HK(Y)^sep` for the disc is stated there.
   - **Repair:** replace the Check by: "Closed unit disc with the triangulation of §2.2: `Γ_int` is
     the single vertex `s₂` without edges, so `H¹(Γ_int, C̆) = 0`; both components are projective
     lines, so the middle piece is `0`; and `H¹_c(Γ, C̆)^* = 0` (§2.2, first Check). By (d),
     `H¹_HK(Y)^sep = 0`." Tested: the three pieces of (d) are `0`, `0`, `0`; for the closed annulus
     the same computation gives `0`, `0`, `C̆(−1)`, the next Check.

2. **F02** (P3) §0.4(a)–(b) is stated for `K/ℚ_p` finite; the characteristic-`p` source covers every local field

   - **Location:** `README.md:204` ("Let `K` be a finite extension of `ℚ_p`"), `README.md:236`
     ("`generalizedSteinberg_isIrreducible`, for every `d ≥ 0`, `K` a finite extension of `ℚ_p`"),
     `Suggested.lean:133–135` (`[NormedAlgebra ℚ_[p] K] [FiniteDimensional ℚ_[p] K]`).
   - **Claim:** irreducibility, pairwise non-isomorphism, multiplicity one and the uniqueness of the
     lattice are stated for a finite extension of `ℚ_p` only, with GK14 as the source in
     characteristic `p`.
   - **Witness:** GK14 lines 9 and 26: the base is any non-Archimedean locally compact field;
     Corollaries 4.3–4.5 (lines 1300, 1328, 1362) need only `char(L) = char(k_F)`. Instance outside
     the README: `K = 𝔽_p((t))`, `A = 𝔽_p`, `d = 1`.
   - **Repair:** add to §0.4, after the locators of (a): "The characteristic-`p` statements of (a) and
     statement (b) hold with `K` any non-Archimedean local field of residue characteristic `p`,
     `𝔽_q((t))` included (GK14, lines 9, 26, Corollaries 4.3–4.5); they are stated here, and in
     `Suggested.lean`, for `K/ℚ_p` finite, the case used by Layers 6–7 and the one CDN-STEIN
     Proposition 5.1 states." Tested on the instance: with the sentence, `LC(ℙ¹(𝔽_p((t))), 𝔽_p)/𝔽_p`
     is recorded as irreducible by GK14 Corollary 4.3 (type `A₁`) and as outside the Lean hypotheses,
     not as excluded by the mathematics.

Two new findings, both P3 (one source locator, one statement scoped more narrowly than its source
without saying so). All eighteen round-1 findings are repaired at this head, and no repair
introduced an error that this pass could find. The dependency check is clean.

## Round-1 findings at this head

Ids are those of the round-1 reports; "line" is a line of `packages/ProetaleCohomologyOfPAdicCurvesAndTowers/README.md`
unless a file is named.

| Id | Status | Repaired passage (quoted) and witness |
|---|---|---|
| 1a/F01 (P2) own parabolic carrier | repaired | `Suggested.lean:85`: "`(J : Set (glTitsSystem K d).simple)`", `:87` "`(glTitsSystem K d).standardParabolic J`". Pin: `TauCeti/GroupTheory/TitsSystem/Parabolic/Basic.lean:48`, `.../Diagonal/TitsSystem.lean:195`; `subgroupB := upperTriangularGroup` (line 196). |
| 1a/F02 (P1) loop subdivision | repaired | line 174: "each `a ∈ A_c` has two incidences `(a, 1)` and `(a, 2)` … kept apart even when `s₁(a) = s₂(a)`". Recomputed: loop, `∂(x_s, x_a) = (x_a − x_s, x_a − x_s)`, `H¹ = L²/L(1,1) ≅ L`. |
| 1a/F03 (P2) graph functoriality | repaired | line 172: "`H⁰_c` and `H¹_c` are contravariant for proper morphisms … `H¹_c(−)^*` is covariant for proper morphisms". Recomputed `∂^* f_* = f_* ∂^*` (needs legs → legs with the same recorded end: stated). |
| 1a/F04 (P1) §3.3 sequence | repaired | line 489: "`0 → O(Y_S)/O_C → H¹_syn(Y_S, 1) --α--> H¹_dR(Ỹ_S)^{φ=p} → H¹(Y_S, O)` is `p²`-exact". CDN-CURVES line 3673–3674 has this form; lines 3685–3686 give the proper case. |
| 1a/F05 (P2) direction of `ι_{a,s}` | repaired | line 385: "`ι_{a,s}: Y_{s,a} ≅ Y_{a,s}`, from the ghost circle of the short to that of the leg"; line 404 has the same source and target, algebra map `O(Y_{a,s}) → O(Y_{s,a})`. |
| 1a/F06 (P2) non-isomorphism absent | repaired | `Suggested.lean:147–152`: "`Nonempty ((generalizedSteinberg K A d J).Equiv (generalizedSteinberg K A d J')) ↔ J = J'`". GK14 line 1328. |
| 1a/F07 (P3) limit stabilizes | repaired | line 662: "a limit that need not be reached at a finite stage". |
| 1a/F08 (P3) `O(X_C)/C` | repaired | line 749: "`Ω⁰/ker d = O(X_C)/H⁰_dR(X_C)`; for connected `X_C` this is `O(X_C)/C`". |
| 1a/F09 (P3) level-zero model | repaired | line 921: "Over `F` (`E = F`) the model is the descent of these two copies along `O_{F₂}/O_F`". Agrees with line 984 (`H⁰ = 𝔽_p` for `K = F`). |
| 1a/F10 (P3) `parabolic_mono` | repaired | declaration absent from `Suggested.lean`; `standardParabolic_monotone` used at `Suggested.lean:90` (pin line 80). |
| 1a/F11 (P2) cocycle headline absent | repaired | `Suggested.lean:226–236` states it; `hyperplaneCocycles` (`:206`) has both conditions. Direction recomputed below. |
| 1a/F12 (P3) Checks for shorts | repaired | lines 377–379 (disc, `TU = p`, two discs). |
| 1a/F13 (P3) truncation counterexample | repaired | line 714: "no comparison is asserted in degrees above `r`"; line 841: "no comparison without the truncation is asserted". |
| 1b/F01 (P3) `A_st` undefined | repaired | line 489: "`A_st = A_cris[Log p̃]^PD` … `N = d/dLog p̃`, so `N(Log p̃) = 1`". CDN-CURVES lines 3749–3759; `N(1⊗x − Log p̃⊗Nx) = 1⊗Nx − 1⊗Nx = 0`. |
| 1b/F02 (P3) missing contracts | repaired | lines 38, 106, 109, 140, 150–151, 156 carry the eleven sections. |
| 1b/F03 (P3) pinned line numbers | repaired | `comapₗ` 327, `Isocrystal` 112, `EllAdicCohomology` 76: each is the declaration line at the pin. |
| 1b/F04 (P3) SR.3.4 | repaired | lines 35, 156, 220, 245, 271 cite "SR.3.4 (*steinberg*)"; supplier (main) line 3004 reads `St_G := C^∞(B\G)/Σ_{B ⊊ P} C^∞(P\G)`. |
| 1b/F05 (P3) `C ⊗ Lie(J)` | repaired | line 637: "`0 → V_p(J) → Ĵ → Lie(J) → 0` … equal to `C ⊗_K Lie(J_K)` when `X` comes from a curve `X_K`". CDN-CURVES lines 4016–4027. |

## Declarations of Suggested.lean

No `variable` or `include` line occurs in the file; every binder is in the declaration's own
signature. The elaborated types are those of the job's `signatures.md` (I ran no Lean); each was
compared with its README statement.

| Declaration (line) | Context it needs | Present in the elaborated type | README |
|---|---|---|---|
| `translation` (69, def, real body) | group, topology, `IsTopologicalGroup G`, `CommRing A` | all four | §0.3, line 206 |
| `steinbergRelations` (84, def, real body) | `Field K`, `Nontrivial Kˣ`, topological ring, `CommRing A` | all | §0.3 |
| `steinbergRelations_le_comap` (97, proved) | same | all | §0.3; needed by `Representation.quotient`, not padding |
| `generalizedSteinberg` (116, def, real body) | same | all | §0.3 |
| `generalizedSteinberg_isIrreducible` (133, sorry) | `K/ℚ_p` finite normed, `Field A`, `CharZero A ∨ CharP A p` | all | §0.4(a) |
| `generalizedSteinberg_nonempty_equiv_iff` (147, sorry) | same | all | §0.4(a) |
| `steinbergIndex` (159, def, real body) | `Field K`, `Nontrivial Kˣ` | both | §0.3 |
| `hyperplaneTranslation` (169, def, real body, laws proved) | topological field | all | §0.5 |
| `hyperplaneCocycles` (206, def, real body) | `Field K`, topology | both | §0.5 |
| `generalizedSteinberg_equiv_hyperplaneCocycles` (226, sorry) | `K/ℚ_p` finite, `r ≤ d` | all | §0.5 |

Headline theorems of the README: the generalized Steinberg results of §§0.4–0.5 (stated); the
fundamental diagrams of §§3.5, 4.1, 4.2, 4.7, 5.5; the Kummer regulator of §2.4; the filtrations and
the similarity of §§2.5, 3.2, 4.3, 4.6; the Jacobian period isomorphism of §§4.8–4.9; the cohomology
of `Ω^d` of §§6.2, 6.4, 6.5, 6.9, 6.10; the tower theorems of §§7.1, 7.2, 7.4, 7.5, 7.7, 7.8. Each
of those not stated is named in the module docstring with its missing carrier (lines 33–57), and
the carriers are absent at the pins (no étale or pro-étale site of an adic space, no `B_cris`, no
Lubin–Tate or Drinfeld space: grep). No padding found: the only proved theorem is the invariance
that the quotient representation requires.

## The adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `steinbergIndex` against the hyperplane presentation | `d = 2, r = 1`; `d = 3, r = 2`; `r = 0`; `r = d` | `J = {s₀}`: block `(2,1)` upper triangular fixes `Ke₀ + Ke₁`, so `G/P_J` = planes = hyperplanes; `d = 3, r = 2`: `J = {s₀}`, blocks `(2,1,1)`, flags of dimensions `2, 3`, which are the annihilators of the flags of dimensions `1, 2` of the dual in CDN-STEIN line 1992; `r = 0`: all reflections, point; `r = d`: `∅`, `G/B` | agrees with source and with §0.5 |
| equivariance of the presentation, `r = 1` | `φ ∈ LC(𝓗)/ℤ`, `e(φ)(H₀,H₁) = φ(H₁) − φ(H₀)` | `e(g·φ)(H₀,H₁) = φ(g⁻¹H₁) − φ(g⁻¹H₀)`; Lean action evaluates `f` at `[a ᵥ* g]`, the equation of `g⁻¹H` (`{y : a g y = 0}`); equal | true as typed |
| `hyperplaneTranslation` composition | `g, g′` | `(g·(g′·f))(H) = f((a·g)·g′) = f(a·(gg′))` | representation |
| `hyperplaneCocycles` | `r = 0`; `d = r = 1`; `d = 1, r = 2` | `f(H₁) − f(H₀) = 0`: constants, `ℤ = Sp_0`; `f = φ(H₁) − φ(H₀)`: `LC(ℙ¹)/ℤ`; any three vectors of `K²` dependent: `0`, while the index set gives Steinberg | true for `r ≤ d`; `hr` needed and present |
| irreducibility | `d = 0`; `d = 1`, `A = ℚ, 𝔽_p`; `A = 𝔽_ℓ`, `ℓ ∣ q + 1` | `Sp_∅ = A`, one-dimensional; `LC(ℙ¹)/A` irreducible (Casselman, GK14 4.3); for `ℓ ∣ q + 1` the constants split off differently and the statement fails, excluded by `hA` | true as typed |
| principal congruence invariants (§0.3 Check, Examples) | `U = 1 + ϖM₂(O_K)` | `LC^U = A^{q+1}`; the connecting map to `Hom(U, A)` is `0` because `U` is generated by its intersections with two opposite Borels; rank `q`; `q = 2` gives `2` | Check true for every `A` |
| char-0 descent of §0.4(a) | `A ⊃ ℚ` arbitrary | image of the rational Hecke algebra spans `End_ℂ`, so has `ℚ`-dimension `n²` and is `End_ℚ`; simple over every `A` | route sound |
| §0.1 exact sequence | annulus graph; disc graph | `0 → 0 → L → L² → L → 0 → 0`; `H¹ = H¹_c = H¹_c^* = 0` | true |
| §0.2 subdivision | loop `µ = µ′ + µ″` | `(1,1) ↦ [(µ′, µ″)] ↦ µ′ + µ″ = µ` | true |
| §1.4 scaling and unit factor | `f(u) ⊗ m`; `u` | both sides `f(eu)⊗N_raw m − e f′(eu)⊗m`; `ι_ϖ(Ψ_ϖ(u)) = ι_p(u) − log_K(a)`; `c_p = e c_ϖ − c_a` | true |
| §1.4 independence of `ϖ` | `ϖ ↦ ϖw` | `exp(log_K(w)N_raw)·exp(−e⁻¹log_K(aw^e)N_raw) = exp(−e⁻¹log_K(a)N_raw)` | true |
| Weil–Deligne law (Conventions, §4.4) | `Φ = diag(1,q)`, `Ne₁ = e₀`; Tate module `diag(q⁻¹,1)` | `NΦe₁ = qe₀ = qΦNe₁`; `NΦe₁ = µe₀ = qΦNe₁` | law with `p^{−deg}` consistent; source misprint confirmed (lines 4432, 4437) |
| §3.3 cone signs | disc, `f = 1 + pT` | `dy = (φ/p)x − x`, so `−(1 − φ/p)x − dy = 0` | cocycle |
| §3.3 `H⁰_syn` | `p` odd; `p = 2` | `ℤ_p t`; contains `t/2` | true |
| §4.6 elliptic Check | `y² + y = x³` over `𝔽₂` | points: `(0,0), (0,1), ∞`; `a = 0`; `X² + 2`, twisted `X² + 1/2` | true |
| §4.7 Dimensions | slopes `(0,1)`, `(1/2,1/2)` | `(1,1) + (0,1) = (1,2)`; `(1,2)` | true |
| §4.8 kernel of `log_J` | `x₀` of prime-to-`p` order | `p^k x₀` does not tend to `0`: excluded by the condition at `−∞` | definition determines `Ĵ` |
| §4.9 normalisations | `μ_{p^∞}` | `D_contra`: slope `1`; `D_raw`: `0`; `D_norm`: `−1`; `(B_cris^+)^{φ=p}` from `D_raw, F = p` and from `D_norm, φ = 1` | consistent |
| §5.1 chain model | node `m` | `X₁X₂ = ϖ^{m+1}T·ϖ^{−m}T^{−1} = ϖ` | true |
| §5.2 sign witness | Kummer representation of `ϖ` | `g x₁ = x₁`, `N x₁ = x₀`; image of `x₁` gains `+log_K(w)·x₀` | agrees with the transport law |
| §5.4 chain-model Check, `r = 1` | `𝔸¹` | fibre of `(B_cris^+)^{φ=p} → O(X_C)`: `H⁰ = ℚ_p t`, `H¹ = O(X_C)/C` | true |
| §6.3 `N = 0` | `φ^f = q^s` | `q^s N = q^{s+1} N` | true |
| §6.7 kernel | `x = μ^i y` | `ξ^iφ^{−1}(μ^i y) = μ^i φ^{−1}(y)` since `μ = ξφ^{−1}(μ)` | `ker = μ^i Ẑ_p` |
| §6.8 three points | `0, 1, 2` | residues `(1,−1,0) + (0,1,−1) − (1,0,−1) = 0` | true |
| §6.10 numbering | Dat's `d = 3` (`d = 2` here) | DAT06 lines 1318–1319: `P_{S∖{i}}` fixes a subspace of dimension `i`; here `P_{Δ∖{i}}` fixes `⟨e₁,…,e_i⟩`; `H³_c ≅ π_{{1}}(−1)`, dual of `H¹` twisted: `Sp_1(1 − 2)` | same numbering |
| §7 preamble dictionary | `q = 2` | `|O_D^×/(1 + ϖO_D)| = 3·4 = 12`, `|Ǧ₀/Ǧ₁| = 3` | true |
| §7.1 action | `(3I₂, 3)`; `(ϖ, 1, Φ_geo)` | `9·9⁻¹ = 1`; `ϖ·rec_F(Φ_geo)` a unit; agrees with EndoscopicTransferAndUnitaryTraceComparison §12.7's Check | true |
| §7.5 slope Check | `φ²e = p³e` | `φ²(a) = p⁻¹a`, so `0` | true |
| §7.6 five-term step | `A = B = 0`; `D = E = 0` | kernel; cokernel | as CDN23 lines 1286–1294 |

## Dependency check

```
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 265 of `merge-order/ORDER.txt`, after
ModpRepresentationsOfGL2OverLocalFields (264), its last supplier.

## Verified sound

- Declarations read: 10 of 10 (the eleventh entry of `signatures.md`, "`Nontrivial`, line 131", is
  a word of a docstring, not a declaration). Targets read: all 51 sections of Layers 0–7, with the
  Conventions, the supplier contracts and the consumers.
- Pinned declarations: 18 Mathlib and 13 Tau Ceti locators of README lines 66–86, each opened at
  the pin; all are the declaration lines. `Representation.IsIrreducible` is
  `IsSimpleOrder (Subrepresentation ρ)`; `Projectivization.Dependent` is dependence of
  representatives; `glTitsSystem.subgroupB` is `upperTriangularGroup`. Imports: `Mathlib` and the
  two Tau Ceti modules used. No `set_option`, `lemma`, `#eval`, `True` placeholder or sorry'd data.
- Source locators verified against the cached texts: about 140 (CDN-CURVES 45, CDN-STEIN 35,
  CDN23 18, CDN20 15, DAT06 8, CDN-DUKE 5, GK14 5, THO24 3, STR08 2, GK05 4, GK05-RT 2, GK07 1,
  CN-I 1). One fails (S01).
- Checks recomputed: about 90 of the README's 214; those in the table above with their values.
  Every section has at least three.
- Sibling citations: `roadmaps resolve` reports none found nowhere. Contents read at the suppliers'
  heads: CohomologyComparisons §4.5 (the transport `ρ_{πu} = ρ_π ∘ exp(−log_K(u)N_raw)`, as cited),
  LocallyAnalyticDistributions §0.CR.6.6 (the finite-piece comparison is stated for
  `x₁⋯x_r = π` in `n` variables, so in every dimension), EndoscopicTransferAndUnitaryTraceComparison
  §12.7, VectorBundlesAndIsocrystals (*A semistable period-space example*), PadicPeriodRings §4.1
  (`N_p(u) = −1`), SmoothRepresentationsOfLocalGroups SR.3.4 and SR.5.2, and the headings of
  ModpRepresentationsOfGL2OverLocalFields §§0.3–0.5, 0.7, 2.4, 2.6 and PadicHodgeTheory §§0.6, 5.3,
  5.4, 8.1. The three consumers named under "Downstream consumers" that have a text
  (ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, PadicLocalLanglandsForGL2QpPartII,
  ModularityAndLanglandsExtensionsPartII) say what the README says of them.
- Gaps: the four slugs of `design/plan.json` are the four of the README, with the same suppliers
  and sections; each is precise and none asks for what its supplier states today.
- Ownership: searched main, the open heads and the board packages for the generalized Steinberg
  quotients, the Schneider–Stuhler and Iovita–Spiess presentation, graphs with legs and the
  Drinfeld tower multiplicities; no second owner. The "generalized Steinberg" of
  SmoothRepresentationsOfLocalGroups (main, line 4451) is the segment representation `L(Δ)`, which
  the scope bullet says. #2287 is this roadmap's own pull request on the roadmap repository; the
  package text supersedes it, as the repair report says.
- Policy: the pull request changes only this package's folder; no pull-request number, process
  word or machine path in `README.md` or `Suggested.lean`.

## Not verifiable

- SS91, IS01, DS01, NAK84, KM74, BW00: uncertified, cited by locator; not read.
- CN-II and CGN23 (scope references only) were not opened.
- Elaboration of `Suggested.lean` was not run in this pass; the types are those of `signatures.md`.
- The equivariant presentation of §0.5 for `2 ≤ r ≤ d − 1` was checked on the flag types
  (`d = 3`, `r = 2`) and against CDN-STEIN line 1992, not on an explicit cocycle.
- Supplier sections other than those listed above were checked by heading only.
- ProetaleCohomologyOfPAdicCurvesAndTowersPartII has no text on the board or among the open pull
  requests; what the README says of it could not be compared.
- The routes of §4.6 for overconvergent affinoids and of the logarithm comparison of §4.9 are the
  README's own; they were read and no gap was found, but there is no written proof to check them
  against.

## Source issues

- **Misprint** in CDN-CURVES at §8.2.5, printed p. 107: the source says the semi-direct product scales the second additive parameter by `p` to the power `+deg g₁`; it should be `−deg g₁`, as its relation `Ng = p^{deg g}gN` requires; affects nothing.
- **Error** in CDN-CURVES at Proposition 6.29, printed p. 90 (and the sentence before it calling `α` a surjection): the source says the symbol sequence ends in `0`; it should end with the map to `H¹(Y_S, O)`, as in Proposition 6.26 and Remarque 6.27(i); affects a stated result.
- **Gap** in CDN-CURVES at §1.2.3, printed p. 19: the source says the edges of the subdivided graph are the pairs of an edge and one of its endpoints; it should count the two incidences of a loop separately; affects nothing.
- **Gap** in CDN-STEIN at §5.2.2, printed p. 38: the source says the dual of `Sp_J(Λ)` is the inverse limit of the duals of the function spaces on the finite quotients; it should be the annihilator of the relation submodule in it; affects nothing.
- **Misprint** in CDN-STEIN at §5.4.1, printed p. 41, the display after the definition of degenerate distributions: the source says the de Rham target is in degree `s` and the pro-étale twist is `(s)`; it should be degree `r` and twist `(r)`; affects nothing.
- **Misprint** in CDN-STEIN at Corollary 5.4, proof, printed p. 39: the source says `St^cont_J(O_L)` is the `p`-adic completion of `Sp_J(O_L)`; it should be `Sp^cont_J(O_L)`; affects nothing.
- **Gap** in CDN20 at Théorème 0.4, printed p. 6: the source says the multiplicity isomorphisms hold for supercuspidal `M` of rank two; it should add slope `1/2`, as its §2.1 and CDN23 do; affects a stated result.

Source independence: 16 passages compared with 7 sources (CDN-CURVES, CDN-STEIN, CDN-DUKE, CDN23, DAT06, STR08, GK14), none shared beyond definitions and hypotheses that can be written in one way only; largest share CDN-CURVES, 121 of 307 locators; contents compared with CDN-CURVES: independent (its chapters 2, 4 and 5 have no layer; Layer 2 draws on chapters 3–6.2, Layer 3 on 6.3–6.4, Layer 4 interleaves chapters 7 and 8 with Théorème 0.4, and Layers 5–7 rest on other sources; the order graphs → patterns → symbols → de Rham and Hyodo–Kato → syntomic → limits is forced by the `*Needs:*` lines of §§2.2–4.2). CN-II and CGN23 were not read.

## For the human reviewers

- **Scope.** §4.6 for overconvergent affinoids rests on CDN-CURVES Remarque 0.16(ii) (lines 412–415), stated there without proof; the route is the README's own (`README.md:612`).
- **Scope.** The good-reduction logarithm comparison of §4.9 is a deduction CDN-CURVES Remarque 7.10(i) only suggests; the route is the README's own (`README.md:658`).
- **Scope.** The extension of Casselman's theorem from `ℂ` to every field of characteristic `0` (`README.md:236`, `Suggested.lean:124–138`) is argued in the README; no cited source states it for such fields.
- **Licence.** Six sources are uncertified and cited by locator alone: SS91, IS01, DS01, NAK84, KM74, BW00 (`sources.toml`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "540a5ea79963e4cd7be03c1da86ad3f9b0b49e87", "job": "RT-ProetaleCohomologyOfPAdicCurvesAndTowers~2b", "model": "fable", "worker": "chris-x52"} -->

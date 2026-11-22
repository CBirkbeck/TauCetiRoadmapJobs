# Review of ThetaChainsAndFrobeniusPrimeSums (pull request #2924 at 75ae60f)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsAndFrobeniusPrimeSums/`
**Verdict:** accepted

**Summary.** Accepted. The four changed lines replace the provenance of 10.3 and 10.4: the formal proof is now cited for the inequality at every translate, not only for its mean, and for the key identity as a proved lemma; each new locator was opened and its statement agrees with what the README says of it. There is no finding; one small correction (the count of hypotheses in the new sentence of 10.4) and two carried format notes, none blocking. The scope, licence and policy questions stay with the human reviewers.

## C01 — The pointwise bound of the formal proof assumes more than the seven lines of the ledger, and does not assume the identity

A reader who opens the cited declaration to match its hypotheses with the ledger of 10.4 finds eleven, not seven. The provenance line of 10.4 (line 885) says the bound is "proved in … (`…each_unit_bound_statement`) from the seven lines of the ledger, each asked at every translate". `PointwiseBoundVariant` (`Formalism/SizeWindowBrackets/QuotientSlopeBoundsWith.lean`, line 72) has the hypotheses `HidaSetting`, `DIV`, `EComp5`, `HComp`, `Count5`, `Slopes`, `QuotientSlopeBoundsWith`, `LossBounds`, `SlopeIneq`, `HHBound`, `FParams`. Six ledger lines are among them (sources as `QuotientSlopeBoundsWith` with `Slopes`, division, level prime, type primes, slopes, losses); the seventh, the identity, is not assumed but proved (`key_identity`, used through `key_identity5`). Beyond the ledger it assumes the comparison of `h_u` between two words (`HComp`: GluedTargetAndDivisionInequality §8.23 (b), step (B) of the route), the bound `H ≤ x^{c_H}·b` (`HHBound`: 9.6 (b), step (C)), the bounds on the frame defects (`FParams`) and the positivity conditions.

It would be exact as: "from six lines of the ledger, the comparison of `h_u` between words (GluedTargetAndDivisionInequality §8.23 (b)) and the bounds of 9.6 (b), each asked at every translate, with the identity of 10.3 proved".

## N01 — "The mathematics of this roadmap follows a complete formal proof"

The first sentence of **Routes** in the Conventions (line 146) still says the roadmap follows a source. The family index words the same fact as "The results that the family states are those of the formal Lean proof"; the same wording would serve here.

## N02 — The letter `C₁` in the locator of 9.4 is already the constant of LocalGainOfThetaChains §4.10a

The locator of 9.4 (line 508) writes the bound of the formal proof as `max(11, 16 + 3C₁)` "with `log g₀, log g₁ ≤ C₁·x^ε`", while 10.6 fixes "the constant `C₁` of LocalGainOfThetaChains §4.10a" (`C₁ = 1` serves) and 10.6a writes the same bound with `max(5, C_g + 1)` in that place. Another letter in 9.4 (say `C_Y`) would keep the two apart.

## Questions for the author

- 10.6 says that in the construction of [FormalProof] the band constant "is the square of the last of its constants". The sentence has no locator, and I did not find where the constant of the band condition is set to a square. Which declaration fixes it? (Carried from the previous reviews.)

## Previous findings

The previous report (of `73ab875`) had no finding and no small correction; its format notes stand as follows.

- N01 (then) — not repaired: line 146 still reads "The mathematics of this roadmap follows a complete formal proof"; written again above as N01.
- N02 (then) — not repaired: line 508 still writes `max(11, 16 + 3C₁)` with `log g₀, log g₁ ≤ C₁·x^ε`; written again above as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 10.3, new locator `key_identity` (`RankGapProofs/WeightedMeanData.lean`, line 170) | `m = 3`, `f = 4`, 5 tops, random `a_τ ∈ (0.5, 9)`, `w ∈ (0.2, 7)`, `v = 2.7`, `γ = 0.577`, `L′/L = −0.3` | source form (with `m·A_top·lg` and the rank-matching terms on both sides): 266.34430877 = 266.34430877; README form: −71.14365003 = −71.14365003 | the source identity is the README's with the level-prime terms added to both sides; `v = rd_E/2` |
| 10.3, `logOm` and `Main` (`MeanBoundSecondForm.lean`, lines 88, 107) | read | `logOm = γ + log(π/v) − L′/L`; `Main = Σ_jΣ_t a_t(log a_t − 1 − γ + L′/L − mean_ρ log w)` | equal to `log Ω` and `𝔐_tr(u₀)` |
| 10.4, new locator `PointwiseBoundVariant` (line 72), `ErrX5at` (line 45) | term by term against `𝔈₁ … 𝔈₉` | `∀ u0, ASK u0 ≤ Main u0 + ErrX5at u0`; `ErrX5at` = `𝔈₁`, `𝔈₂ + 𝔈₃`, `𝔈₄`, `𝔈₅`, `log card (W u0)`, `LoP`, `MLo5`, the `𝔈₈ + 𝔈₉` term | pointwise, with `log|W|`, as the README now says |
| 10.4, "the source loss" (`Lo5`, line 15) | read | `cSl1·IO + cSl1·nT·m·(a/k + b′)·log T + cSl1·Xpp + 1` | equals `C·𝔦_tot + C·|Φ_top|·m·(a/k + b′)·log T(u) + C·X″ + 1` |
| 10.4, "9.2 (c) carrying a further `C·m·B₀`" (`QuotientSlopeBoundsWith`, line 19) | README 9.2 (c): `μ_max(N′_u) ≤ μ_max(M_u) + 𝒩 + F_tot − E_tot(u)` | source: `muMaxN ≤ muMaxM + Ga + Fo − Ee + cSl1·m·B0` | matches |
| 10.4, `each_unit_bound_statement` (`ChainSlopeWindows/LevelOfCongruence.lean`, line 175) | read | a `theorem` of type `PointwiseBoundVariant D C Xpp` for all `D`, `C`, `Xpp`; `LossBounds` is `∀ u0` where `Losses` was a mean | proved there; hypotheses counted in C01 |

The rows for the untouched statements stand as in the previous review, of `73ab875`.

- Source locators checked against the text: 6 declarations in 4 files of [FormalProof] (`Main`, `logOm`, `key_identity`, `PointwiseBoundVariant` with `Lo5`, `ErrX5at`, `QuotientSlopeBoundsWith`, and `each_unit_bound_statement`); namespaces as cited.
- Library declarations: none touched; `Suggested.lean` is unchanged (single `import Mathlib`, no `set_option`).
- Cross-roadmap citations: the changed lines add none; their `*Needs:*` lists are unchanged.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 111 and 122), nothing else. The worker's automatic checks all passed.
- Changes outside the folder: the family index `README.md` only (a re-wrapped paragraph, and "changed since, as its notes describe" for the mirror); nothing outside the family.
- Pull request text read against the head: no sentence contradicted; it does not describe the provenance lines, so the change leaves nothing unstated.

Overlap check: read GluedTargetAndDivisionInequality, ThetaChainsOnDefiniteUnitaryGroups, FrobeniusRestrictedRieszSums; nothing shared.

Source independence: changed passages only; 2 passages compared with 1 source (FormalProof), none shared beyond the formulas the mathematics forces; largest share FormalProof, all located citations; contents not compared again (no layer added, removed or reordered).

Research link: Layers 9–10 conclude the announced formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), assembling Bost's slope inequality (1996), the Chowla–Selberg period (1967), the mass formula of Gan–Hanke–Yu (2001), Harish-Chandra's formal degrees (1966) and Banaszczyk's transference (1993); README Summary and References, [Announcement] lines 9–13.

## Not verifiable

- The family index says the cited files are to be looked up at the first commit of the public repository; the locators were checked in the operator's copy of its directory `src/`, and whether that copy is of the first commit was not checked.
- That each hypothesis of the cited pointwise bound is discharged for the chain: the statements were compared; the proofs were not traced or built.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets (9.6, 10.4, 10.10, 10.11) rest only on [FormalProof], an unrefereed Lean formalization announced 20 November 2026; [Announcement] lines 9–13 and 72–76 say only Lean is presented. No refereed source states them.
- Licence: the family index (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 10–19) says the proof was published without a licence and is mirrored for verification only; the sources service does not classify the repository's host.
- Licence: `HasWindows`, the bundle `PrimitiveDirichletCharacter` and `rieszRemainder` of `Suggested.lean` have the shape of `Formalism.HC.HasWindows`, `Formalism.HC.PChar` and `Formalism.HC.An.gChi` of that repository (`Formalism/SharpRestriction/RamificationFrobenius/TotientGaloisClasses/`), with bodies rewritten.
- Policy: the family index has a section "When a roadmap is wrong" that says what reviews of library contributions carrying out these roadmaps may and may not block on. Whether a roadmap index sets that rule is for the project to decide.
- Not tested: the formal proof was not compiled or kernel-checked in this review; agreement was checked statement by statement at the locators.

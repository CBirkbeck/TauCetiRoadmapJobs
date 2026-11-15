# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 52b00d9)
**Verdict:** needs changes

## R01 (P3) — Description calls a supplier a consumer
**Location:** pull request description, Dependencies paragraph: "HilbertModularVarietiesAndShimuraCurves, AutomorphicGaloisRepresentations, PotentialAutomorphyInfrastructure, PotentialModularityAndCompatibleSystems and PadicLocalLanglandsForGL2Qp are consumers, not prerequisites."
**Claim:** PadicLocalLanglandsForGL2Qp supplies this head; it is not a consumer. The sentence also contradicts the description's own depends-on list, which includes #1312.
**Witness:** `README.md:64–68` ("§6.9 owns … division-algebra Jacquet–Langlands", "§4.4 owns the supercuspidal `GL₂(O_F)`-type"), `:359` (From TauCetiRoadmap.PadicLocalLanglandsForGL2Qp), 21 *Needs:* lines; its head 90b8808, README:2435–2441, names this roadmap as consumer.
**Repair:** Replace the sentence with: "HilbertModularVarietiesAndShimuraCurves, AutomorphicGaloisRepresentations, PotentialAutomorphyInfrastructure and PotentialModularityAndCompatibleSystems are consumers, not prerequisites. PadicLocalLanglandsForGL2Qp is a supplier (§4.4 supercuspidal types, §6.9 division-algebra Jacquet–Langlands) and merges first."

## R02 (P3) — Summary names a consumer the head does not have and omits R17.3.8a–d
**Location:** description, `<!-- roadmap-summary -->`, "Why Tau Ceti wants it": "QuaternionicModularForms its finite-level adapter and complex principal series".
**Claim:** At this head the README hands nothing to QuaternionicModularForms and does not name it. Instead it owns the quaternionic coefficient modules, level forms and Hecke operators (R17.3.8a–d, 13 of the 24 `Suggested.lean` declarations). Two roadmaps consume them, and neither summary paragraph mentions this material.
**Witness:** `README.md:79–94` (R17.3.8a–R17.3.8d own …; AutomorphicGaloisRepresentations builds on them); `## Downstream consumers` `:3418–3444` lists five roadmaps, not QuaternionicModularForms. Its head bed3af7, README:1515, names this roadmap as its consumer.
**Repair:** Replace the clause with "HilbertModularVarietiesAndShimuraCurves and AutomorphicGaloisRepresentations its quaternionic coefficient modules, level and classical forms and Hecke operators (R17.3.8a–R17.3.8d)". In "What this roadmap builds", after "quaternionic Jacquet–Langlands", add "with quaternionic level forms of algebraic weight over every number field and their Hecke operators".

## R03 (P3) — "Admitted constructor" signatures that the file does not contain
**Location:** description: "the Lean contains representative definitions and admitted constructor/theorem signatures against the pinned Mathlib and Tau Ceti".
**Claim:** `Suggested.lean` has no admitted constructor. Its five definitions have real bodies; only its 19 theorems are admitted. The paragraph also never says that the pull request adds a new roadmap.
**Witness:** The `def`s are at `Suggested.lean:210, 238, 274, 280, 346`, each with a body. The gate reports `sorry-data=0`. `lake env lean` gives 19 `declaration uses sorry` warnings.
**Repair:** "Adds the new roadmap folder `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer` (README, `Suggested.lean`, `metadata.toml`). `Suggested.lean` states 19 headline theorems with `sorry` proofs and the five definitions they need (`algWeightSlash`, `algWeightAction`, `quaternionDiagonal`, `quaternionLevelForms`, `gl2Integral`), all with real bodies. The build checks elaboration only; every target is in the README."

## Previous findings

- none: the review of ce17c6f raised no finding.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| R17.6.9, "Legendre symbol at r … odd" (`README.md:3235`) | K=ℚ(√5); r=11, 19, 31 against r=29, 41 (script) | Π_v ξ_v(−1) = −(−1/r): +1 for r≡3 (mod 4), −1 for r≡1 (mod 4). A mixed-sign ρ of norm −r that is a square mod 4 exists for 11, 19, 31 and for neither 29 nor 41 | True |
| R17.6.9, the ξ of the construction | r=11, ρ=−7+5ω, ω=(1+√5)/2 | N(ρ)=−11; the two embeddings give 1.09 and −10.09; ρ≡1+ω (mod 4), a unit square, so K(√ρ)/K is unramified at 2 and ramified only at 𝔯 and one real place | True |
| R17.6.9, r split and coprime to N | `\|D\|Nf(φ̃)=2^νN`; r=11, D=5 | An odd p dividing D divides N, so 𝔯∤2N makes r unramified, and degree one then makes it split. (5/11)=+1 | True |
| R17.6.9, χ and level | φ̃=1 (parity test), D=5, r=11 | χ(−1)=χ₅(−1)·(−1/11)=(+1)(−1)=−1, odd as weight one needs; conductor of Ind ξ = 5·11 = 55 = \|D\|·N𝔯 | True |
| R17.6.9, `b(r)≡φ̃(𝔯)^{−1}≢1` | φ̃(𝔯)=ζ₃ | b(r)=φ̃ξ(𝔯′)=±ζ₃², and ξ(𝔯′)=±1≡1 mod λ\|2. N(ζ₃²−1)=3 is odd, so the congruence is not 1 | True |
| R17.6.9 against the old wording | the old and new sentences, compared clause by clause | the same hypotheses (D>0, D odd or 8\|D, 𝔯 of degree one coprime to 2N, φ̃(𝔯)≠1) and conclusions (level `2^νNr`, the coefficient conditions in cases (ii) and (iv)) | Unchanged |
| R01: PadicLocalLanglandsForGL2Qp direction | README; merge order | 33 mentions in the README, 21 of them on *Needs:* lines. Merge order: supplier at line 34, this roadmap at line 102 | Supplier |
| R02: consumers named in the description | heads of the cited roadmaps | Hits on this roadmap: ModularityAndLanglandsExtensions 12, AutomorphicGaloisRepresentationsPartII 4, EtaleDualityAndPerverseSheaves 15. QuaternionicModularForms: 1 hit, reverse direction; 0 in this README | QMF clause false |
| R03: the Lean contents | `Suggested.lean` | 5 `def`s with bodies, 19 theorems; gate sorry-data=0 | No constructor |

The rows for statements this diff leaves untouched stand as in the review of ce17c6f.

- Gate on 52b00d9: every check is 0, OK. Dependency check: `depcheck: 245 roadmaps, 2227 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder differs from `origin/main`.
- Elaboration: `lake env lean Suggested.lean` gives 19 `declaration uses sorry` warnings and 0 errors (7 s). `Suggested.lean` is unchanged since ce17c6f, so the `#check` signature comparison and the one-tactic probe stand. The `gl2Integral` binder lead is the same harmless one.
- Locators: R17.6.9's three [rt97] locators were checked against rt97 lines 373–426 (pp. 307–308), and agree. Remark on untouched text: the construction of ξ begins on p. 307 (lines 408–412), while the locator says p. 308.
- Description, other claims checked against the head:
  - The title matches `README.md:1`.
  - The local and global items match the headings R16.0–R17.6, and so do Henniart uniqueness (`:499`), the primitive dyadic case (`:497`), the equal-characteristic types (`:854`) and the characteristic-two restriction (`:3355`).
  - PotentialAutomorphyInfrastructure (2 hits, `finite_hecke_full_local_prescription`) and PotentialModularityAndCompatibleSystems (25 hits) do consume this roadmap at their heads.
- Remark on untouched text: those two consumers are absent from `## Downstream consumers`.
- Overlap check: `roadmaps grep` over main and all open heads for Rohrlich–Tunnell and the mixed-signature auxiliary character. Among the closest lists (AutomorphicLFunctionsAndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison, ModularityAndLanglandsExtensions, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactorsPartII, SmoothRepresentationsOfLocalGroups, ModularForms, AdelicAlgebraicGroups), none states R17.6.9's construction; its owner is this roadmap. SmallRamificationAndAbelianVarietyBaseCases and SerreWeightAndLevelOptimisation cite R17.6 only as consumers. No heading changed, so no citation breaks.
- Source independence (changed passages only): 1 passage compared with 1 source, rt97 lines 393–426. The longest shared run is 5 words ("the Legendre symbol at r"), which the formula forces. Largest share of the locators: langlands80, 27 of 228. The arrangement was not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- Texts outside R17.6.9 were not reread this round. Their status is as in the review of ce17c6f.
- The description beyond the quoted cut: none was cut.

## Source issues

- **Misprint** in rt97 at §2, p. 307: the source assigns ν = 3 to case (iii); it should be case (iv), as in the list on p. 306. Affects nothing (R17.6.7 already states it correctly).

## For the human reviewers

- Licence: rt97 was read from the sources cache, copied from msp.org (the publisher). `sources classify` places msp.org in no licence class, so the service refuses to fetch it afresh. Whether the PDF is open on msp.org is for a human to confirm.
- Ownership: QuaternionicModularForms (#934, another author, head bed3af7), README:1515, lists this roadmap's R17.3 as a consumer of its §§0.2–0.4, 1.3, 2.1–2.2 and 3.1. This README's R17.3.8a–d own that material and never name the roadmap, which is on the project's list of names not to cite.

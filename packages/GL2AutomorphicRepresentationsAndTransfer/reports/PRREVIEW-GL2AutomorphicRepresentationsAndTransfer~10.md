# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at 5b20d73)
**Verdict:** accepted

## Previous findings

- R01 — repaired: "PadicLocalLanglandsForGL2Qp is a supplier (its §4.4 supercuspidal `GL₂(O_F)`-type and §6.9 division-algebra Jacquet–Langlands) and merges first. HilbertModularVarietiesAndShimuraCurves, AutomorphicGaloisRepresentations, PotentialAutomorphyInfrastructure and PotentialModularityAndCompatibleSystems are consumers, not prerequisites"
- R02 — repaired: "quaternionic Jacquet–Langlands with algebraic-weight quaternionic forms over every number field and their Hecke operators" and "HilbertModularVarietiesAndShimuraCurves and AutomorphicGaloisRepresentations build on its quaternionic forms and Hecke operators"; QuaternionicModularForms is no longer named.
- R03 — repaired: "Adds the new roadmap folder … `Suggested.lean` states 19 theorems with `sorry` proofs … together with the five definitions they need (…), all five with real bodies."

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| R16.1.7 `chevalley_power_congruence` (cited by the new PotentialModularityAndCompatibleSystems bullet) | ℚ: E=⟨2⟩, n=2, T={3}; E=⟨−4⟩, n=4, T={2}; E=⟨−1⟩, n=2 | ord₅2=4, so 2ᵏ≡1 (5) forces 2∣k. (−4)²≡−1 (17), order 4, so 4∣k. The unit modulus admits −1∉E²; m=3 separates | True |
| R16.1.8 `finite_hecke_full_local_prescription` | ℚ, S={5}, χ₅ trivial on 5, order 4 on ℤ₅× through ψ(2)=i | ψ(−1)=−1, so no Ψ ramified only at 5 is trivial at ∞. Ψ=ω_ψ·ω_{χ₋₄}: sign²=1 at ∞, χ₋₄(5)=1, image of order 4 | True; auxiliary ramification needed, as stated |
| R17.6.8 locator "Case 2 (ν=2), formula (3), p. 303" | rt97 lines 163, 176, 201, 221, 238 | Printed p. 303 starts at line 163; Case 2 at 176, formula (3) at 201. Page 304 starts at 221 (formula (4) at 238) | Correct |
| R17.6.9 locator "construction of 𝔯 and ξ, pp. 307–308" | rt97 lines 373, 408–423 | The construction starts at line 408 (p. 307). 𝔯 and ξ are fixed at lines 417–422 (p. 308). Remark 1 is at line 423 (p. 308) | Correct |
| PotentialModularityAndCompatibleSystems bullet: sections | its head 5a6a670, every line citing this roadmap | 16 citing sections: 2.15, 3.1, 4.2, 4.4–4.8, 4.14–4.15, 6.1, 8.6–8.7, 11.1–11.2, 12.1. The bullet names the same 16 | Exact match |
| Same bullet: ids used | same head, *Needs:* lines | R16.1.7 (§§2.15, 3.1), R16.1.8 (§2.15), Layer R17.3 (§§4.2, 4.5), R17.4.2–R17.4.11 (§§4.4, 4.6, 8.6–8.7), R17.4.16 (§§4.6, 4.15), Layer R17.5 (§4.7), R17.6.19 (§4.6) | Matches |
| PotentialAutomorphyInfrastructure bullet | its head 0f3131e, §1.13 *Route*, supplier table | §1.13 takes `finite_hecke_full_local_prescription` (§R16.1.8) through its supplier's §2.15 | Matches |
| Description: R01–R03 repairs | `Suggested.lean`; merge order | 19 `theorem`s and 5 `def`s with bodies (lines 210, 238, 274, 280, 346). Merge order: PadicLocalLanglandsForGL2Qp at 34, this roadmap at 102, the four consumers at 164, 169, 178, 195 | Text agrees |
| Description: "Downstream consumers section names what each of them uses" | `README.md:3418–3455` | One bullet each for the four named consumers (`:3434`, `:3438`, `:3445`, `:3453`) | True at this head |

The rows for statements this diff leaves untouched stand as in the review of 52b00d9.

- Gate, rerun at 5b20d73: every check 0, OK (the worker's targeted build: build=0). Dependency check: `depcheck: 247 roadmaps, 2252 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing outside the folder differs from `origin/main`.
- Elaboration: `lake env lean Suggested.lean` gives 19 `declaration uses sorry` warnings and 0 errors. `Suggested.lean` is unchanged since ce17c6f, so the `#check` signature comparison and the one-tactic probe stand. The `gl2Integral` binder lead is the known harmless one: the `def` needs only `ValuativeRel`.
- Locators: the 8 rt97 locators of R17.6.8–R17.6.9 were checked against rt97 lines 98–238 and 373–426. No target of the seeded sample lies in the changed passages (they sit at `README.md:830–3164`), and no locator is flagged unverified.
- Citations resolved: 16 sections of PotentialModularityAndCompatibleSystems and §1.13 of PotentialAutomorphyInfrastructure, at their heads; 9 merge-order positions. The leads in the citations scratch file are false positives. R15.2 and R15.3 resolve through AlgebraicModularFormsAndSerreWeights `README.md:17`, which maps R15.1–R15.5 to Layers 1–5. `LocallySymmetric.AutomorphicForm` is ArithmeticLocallySymmetricSpaces `README.md:997`.
- Description, other claims checked against this head:
  - The title matches `README.md:1`.
  - The summary items match the R16.0–R17.6 headings and `:59–68`, `:79–87`, `:497–499` and `:3355`.
  - The validation sentence matches the gate's readme-ids-missing, round-labels and empty-sections counts, all 0.
- Remarks on untouched text:
  - R17.6.8's prose cites "RT Remark2" without its page (rt97 line 427, p. 308).
  - The previous review's two remarks are repaired by this head: the p. 307 start of ξ's construction, and the two consumers that were missing from `## Downstream consumers`.
- Overlap check: read PotentialModularityAndCompatibleSystems (5a6a670) and PotentialAutomorphyInfrastructure (0f3131e), which the changed text names.
  - Shared objects: the S-unit power congruence and the finite Hecke prescription. Their owner is this roadmap (R16.1.7–R16.1.8, merge order 102, against 178 and 195), and both roadmaps cite it.
  - PotentialModularityAndCompatibleSystems §2.15 adds only the infinite-place and p-primary prescriptions. It also sketches its own proof of the congruence, which is a matter for that roadmap's review.
  - The closest lists stand as in the previous review: AutomorphicLFunctionsAndLocalFactors, EndoscopicTransferAndUnitaryTraceComparison, ModularityAndLanglandsExtensions, AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactorsPartII, SmoothRepresentationsOfLocalGroups, ModularForms and AdelicAlgebraicGroups. The diff changes no owned object.

Source independence: changed passages only; 4 passages compared with 1 source, none shared (the 2 locator lines against rt97 lines 201 and 408–423; the 2 consumer bullets cite no source); largest share langlands80, 27 of 225 bracketed citations; contents compared with langlands80 §§1–11: independent. 7 of the 13 layers never cite it, and its §§4–8 have no layer. Its §3 (Artin applications) comes before §§9–11 (the trace comparison), while here R17.2 comes before R17.4–R17.6, an order their *Needs:* lines force. No layer was added, removed or reordered.

## Not verifiable

- Texts outside the changed passages were not reread this round. Their status is as in the review of 52b00d9.
- The description beyond the quoted cut: none was cut.

## Source issues

- **Misprint** in rt97 at §2, p. 307: the source assigns ν = 3 to case (iii); it should be case (iv), as in the list on p. 306; affects nothing (R17.6.7 already states it correctly).

## For the human reviewers

- Licence: rt97 was read from the sources cache, copied from msp.org (the publisher). `sources classify` places msp.org in no licence class, so the service refuses to fetch it afresh. Whether the PDF is open on msp.org is for a human to confirm.
- Ownership: QuaternionicModularForms (#934, another author, head bed3af7), `README.md:1515`, lists this roadmap's R17.3 as a consumer of its §§0.2–0.4, 1.3, 2.1–2.2 and 3.1. This README's R17.3.8a–d own that material and never name the roadmap, which is on the project's list of names not to cite.

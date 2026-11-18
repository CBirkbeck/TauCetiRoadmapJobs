# Review of SpecialFunctionsStruve (pull request #2129 at 912afcd)

**Verdict:** accepted

**Summary.** Accepted: the four points of the previous review are repaired and the repairs introduce no new defect. The two statements added to `Suggested.lean` (Lommel's recurrence in `μ` for `S_{μ,ν}` and the integral of `S_{0,ν}`) elaborate and were confirmed numerically, at regular and at exceptional parameters. There are two small corrections and no format note, none blocking. For the humans: the book locators still could not be read, and two suppliers are open pull requests of the same author.

## C01 — "Downstream consumers" still lists the generalized hypergeometric roadmap as a future consumer, while it is now a supplier

The bullet in `## Downstream consumers` (README line 1264) reads "A roadmap for the generalized hypergeometric functions can identify `𝐇_ν`, `𝐋_ν` and `s_{μ,ν}` with its `₁F₂` through the definitions here." Since this head, SpecialFunctionsGeneralizedHypergeometric is a named supplier of Layer 1 (README 261–265), so a reader meets the same roadmap as supplier and as consumer and suspects a cycle. There is none: at its open head that roadmap mentions this one only under its own downstream consumers (its README 1229–1231), and says the identification with `₁F₂` is made here and needs nothing beyond its Layer 1.

Deleting the bullet, or rewording it to say that the identification is made here from SpecialFunctionsGeneralizedHypergeometric 1.3, would make the text agree with the supplier contract.

## C02 — "The other headlines … stated in prose" leaves it unclear which headlines the Lean file omits

README 81–83 keeps "it is not an exhaustive acceptance test, and the other headlines are targets of the same standing, stated in prose", and the module docstring of `Suggested.lean` keeps "the statements here are a selection of them". With the recurrence of 2.2 and the `S_{0,ν}` integral of 3.3 now stated and 7.2 named as not statable, what remains in prose (the description names the other four Lommel identities of 2.2 and the `S_{1,ν}` integral of 3.3) are companions of stated headlines. Calling them "headlines" suggests that statable headline theorems are still missing from the acceptance test.

Would read correctly as: "`Suggested.lean` states the headline theorems, each with every conclusion the README attaches to it; the remaining targets are stated in prose." The description's Build paragraph would change in the same way.

## Previous findings

- R01 — repaired: README 115–117 and 343–345 hand the joint holomorphy of `𝐅₁₂` to SpecialFunctionsGeneralizedHypergeometric 1.3–1.4; the 1.1 bullet and its Check are gone; a supplier contract (261–265), the `*Needs:*` of 1.1–1.3 and "seven roadmaps" are in place.
- R02 — repaired: `lommelCapitalS_add_two` and `lommelCapitalS_zero_eq_integral` are stated and named in 2.2 and 3.3; the docstring and README 83–85 name 7.2 as not statable. The retained wording is C02.
- R03 — repaired: the Summary now ends the sentence with the plain citation "(Dingle, Ch. XVIII; Magnus–Oberhettinger–Soni, §3.10.2)".
- R04 — repaired: the description now says the headlines cite printed pages "where a book states the result" and lists the six that rest on DLMF alone.

## Verified sound

| Statement | Instances and values computed | Result |
|---|---|---|
| `lommelCapitalS_add_two` (2.2), regular parameters | `μ = 0.35, ν = 0.72, z = 1.9`: both sides `1.50693704858`; `μ = 0.3+0.7i, ν = −1.2+0.4i, z = −1.1+0.6i`: both `0.488372220672 + 0.530116237479i`; `z = −1.1−0.6i`: both `−6.99790725512 + 4.42137336718i` | holds, also for `|ph z| > π/2` with principal `z^{μ+1}` |
| `lommelCapitalS_add_two`, exceptional parameters (limit in `μ`) | `μ = −1, ν = 0`: `S_{1,0} = 1 = z⁰ − 0`; `μ = −3, ν = 0, z = 0.8+1.1i` (both sides exceptional): `0.0907276773678 − 0.336562059979i`; `μ = −2, ν = 1, z = 1.7`: `0.588235294118 = 1/z` | holds |
| `lommelCapitalS_zero_eq_integral` (3.3), regular | `ν = 0.4, z = 1.3`: `0.643128531694` both sides; `ν = 0.4+2.5i, z = 0.6−1.7i`: `0.373406212195 + 0.0267387406069i`; `ν = −2.3+i, z = 0.2+3i`: `0.0540966307916 − 0.174815361428i`; `ν = 2, z = 0.9`: `2.80338647185` | holds |
| `lommelCapitalS_zero_eq_integral`, exceptional `ν` odd | `ν = 1, z = 1.3+0.4i`: limit `0.702702702703 − 0.216216216216i = 1/z` = integral; `ν = 3, z = 1.3`: `4.41055985435` both | holds |
| Supplier contract for `𝐅₁₂` (1.1) | SpecialFunctionsGeneralizedHypergeometric 1.3: `𝐅 = regularizedHGFun` for `p ≤ q`, all `z`; 1.4: joint holomorphy for `p ≤ q + 1` on `univ × univ × D`; `p = 1, q = 2`: `D = ℂ` | contract matches the cited sections |
| "seven roadmaps" (Summary) | Bessel, Airy, EiLiErfIncompleteGamma, Hypergeometric, GeneralizedHypergeometric, AsymptoticExpansions, ZerosOfLFunctions: 7 supplier subsections | agrees |

The rows of the previous review for the untouched statements stand as in that review, of `9961786`.

- Source locators checked against the text: 0 new (the changed passages add no locator; the two new Lean names carry the Magnus–Oberhettinger–Soni and Gradshteyn–Ryzhik locators of 2.2 and 3.3, which could not be read).
- Library: no change to the 13 `#check` lines; all elaborate.
- Cross-roadmap citations resolved: SpecialFunctionsGeneralizedHypergeometric 1.3–1.4 at its open head (README 412–436), cited at 6 places; that roadmap has no `*Needs:*` on this one.
- Automatic checks: all pass. Dependency check: `depcheck: 220 roadmaps, 2377 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing changed outside the folder.
- Elaboration: exit 0, 28 `declaration uses sorry` warnings, no other message. The two new elaborated signatures were compared with README 2.2 and 3.3: same hypotheses (`z` in the slit plane; `Re z > 0`), all `μ`, `ν`; no binder lost.
- Padding probe on the two new theorems (`rfl`, `simp`, `simp [lommelCapitalS]`, `infer_instance`): neither closes.
- Overlap check: read SpecialFunctionsBessel, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsAiry, SpecialFunctionsParabolicCylinder; shared: parameter holomorphy of `regularizedHGFun` — owner SpecialFunctionsGeneralizedHypergeometric 1.4, now cited; Struve, Lommel, Anger–Weber functions — owner this roadmap.

Source independence: changed passages only; 5 passages compared with 1 source (DLMF Chapter 11), none shared; largest share DLMF, 83 of about 172 locators; no layer added, removed or reordered, so the contents were not compared again (independent in the previous review). The six books could not be read.

Research link: the roadmap formalizes the theory of Chapter 11 of the NIST Digital Library of Mathematical Functions, with Olver's uniform expansion of the Anger function through the turning point (Olver, *Asymptotics and Special Functions*, Ch. 9 §§12–13), and states corrected forms of five DLMF formulas; rests on the README Summary and DLMF Chapter 11.

## Not verifiable

- Every page and equation locator into Olver, Magnus–Oberhettinger–Soni, Gradshteyn–Ryzhik, Dingle, Wong and Duverney, among them those of the two new Lean statements (Magnus–Oberhettinger–Soni §3.10.1, pp. 109, 111; Gradshteyn–Ryzhik 8.575): no legal copy was found in the previous round; the statements themselves were confirmed by computation.
- 7.2, the uniform bound of Olver's expansion: unchanged, not verifiable as before.
- The description's account of earlier local reviews and their finding counts.

## Source issues

- none

## For the human reviewers

- **Licence.** The README's "Prior formalization" section names the author's `lean-DLMF` (Apache-2.0) with a per-layer counterpart table; whether `Suggested.lean` is adapted from it, and the attribution owed, was not compared.
- **Not tested.** Wording and locators were compared with DLMF only; Olver, Magnus–Oberhettinger–Soni, Gradshteyn–Ryzhik, Dingle, Wong and Duverney (about 89 locators) could not be read. Target 7.2 rests on Olver, Ch. 9 §§12–13, alone.
- **Scope.** Two suppliers, SpecialFunctionsBessel (#1987) and SpecialFunctionsGeneralizedHypergeometric (#2136), are the same author's open pull requests and are not in the merge-order file; the dependency check passes with them.

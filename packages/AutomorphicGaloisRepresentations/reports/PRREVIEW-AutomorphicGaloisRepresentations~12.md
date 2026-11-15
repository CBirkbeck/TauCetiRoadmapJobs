# Review of AutomorphicGaloisRepresentations (pull request #1007 at 480c64f)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 480c64f. The folder is unchanged; this round read the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the summary block now reads "The imported weight-one Artin representation gets the same normalisation"; the prose reads "The weight-one theory is imported from AlgebraicModularFormsAndSerreWeights §§6.3–6.4, and §2.10 places its Artin representation in the same normalization."
- R02 — repaired: the summary block names "overconvergent quaternionic forms with Fredholm theory, slope families, theta maps, small-slope classicality and the eigenvariety"; a new prose paragraph names §§0.2a–0.2f, §0.3 and GL2AutomorphicRepresentationsAndTransfer §§R17.3.8a–R17.3.8d.
- R03 — repaired: "of any infinity type" is gone; the summary block reads "with all weights at least two, parallel or not" and the prose "every infinity type `(k,w)` with all `k_τ≥2`, parallel or not".

## Verified sound

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| Description: "The imported weight-one Artin representation gets the same normalisation" (§2.10) | `η(z)η(23z)`, coefficients recomputed to `q¹³`; `p=2, 5` | `a₂=−1, ψ(2)=1`: `X²+X+1` for `ρ_f` (arithmetic) and `ρ_f^∨` (geometric). `a₅=0, ψ(5)=−1`: `X²−1`; dual at arithmetic Frobenius `X²−0·X+(−1)⁻¹=X²−1`. | True; Layer 2 has the single target §2.10 |
| Description: "all weights at least two, parallel or not" / "every infinity type `(k,w)` with all `k_τ≥2`" | `(k,w)=(2,0)`, `(12,10)`; `F=ℚ(√5)` parallel weight one; `(2,1)` | Degrees `((w−k+2)/2,(w+k)/2)`: `(0,1)`, `(0,11)`, sums `w+1=1, 11`. `k_τ=1` fails `k_τ≥2`; `(2,1)` fails the parity built into "infinity type `(k,w)`" (Conventions, line 115). | True |
| Description: "using congruences for nonparallel Hilbert weights where the geometric construction of §§3.1–3.9 is not available" | §3.10 at the head | Parallel weight: twist `j=(w−k+2)/2` to `(k,k−2)` and the supplied R18.3.29; nonparallel: §§3.1–3.9 "where available", "otherwise … `μ_s`-new congruences modulo `λ^s`". | True |
| Description: density one of ordinary primes, `fixedSquarefreeForm_ordinary_density_one`, "non-CM" | Lean hypotheses `Squarefree N`, `f.χ = 1`; smallest trivial-character CM levels | 27=3³, 32=2⁵, 36=2²·3², 49=7²: none squarefree; elaborated conclusion `HasNaturalDensity (ordinaryGoodPrimes f) 1`. | True |
| Description: "dictionary to Carayol, Saito and Deligne" | Convention table, lines 140–149; 11a1 at 3 after the norm twist | Rows for Carayol `σ_λ(π)`, Saito `ρ_{f,λ}`, Deligne `M_{f,λ}^∨`. `(t,s,q)=(−3,9,3)`: `X²−tX+qs=X²+3X+27`; Carayol `X²−(t/s)X+q/s=X²+X/3+1/3`. | True |

The rows for the statements of `README.md` and `Suggested.lean` stand as in the previous review, of `480c64f`: this head changes none of them.

- **Gate**, rerun on this head: every check 0, `OK`, exit 0; the worker's gate at this head reports `build=0`. `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- **Dependency check:** `depcheck: 245 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0; the only warning is `declaration uses 'sorry'` at line 89. The two signatures in `signatures.md` agree with README §7.7 (the entry `for` at line 32 is docstring text, not a declaration).
- **Description sentences checked against the head** (19, none contradicted): the title against the README's first heading; the three summary paragraphs sentence by sentence (DFG premotives §§1.3–1.5; Shimura curves §§3.1–3.9, unitary surfaces §0.6, congruences §3.10; local compatibility §§4.4, 4.7 and Ramanujan §4.2; integral Hecke families Layer 6; Layer 7; the consumers against "Downstream consumers"; Skinner beyond Kisin §§4.6–4.7; dyadic primes lines 106, 402; imported determinant laws, Wach lattices and averaging projectors, lines 41–42, 53–55, 106–109); the two prose paragraphs; the folder contents; "real-bodied definitions" (one `def`, one `theorem`); the validation paragraph (gate above). The description says the pull request adds the folder; no section, headline or supplier is removed.
- **Suppliers named:** the 24 roadmaps the README names that are not on main are exactly the 24 of the description's dependency list; the README names no roadmap outside main and the merge order.
- **Library declarations opened at the pins** (2): `TauCeti.det_tateModuleGaloisRepresentation` (Tau Ceti `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Determinant.lean:52`); `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`).
- **Seeded sample and source locators:** no sampled target falls in a changed passage (the folder has none), and the README flags no locator as unverified; no source was re-read this round.
- **Citations and overlaps:** `citations.md` reports no cross-roadmap citation found nowhere (its two Lean-name leads are names of IntegralHeckeAndGaloisDeterminants, resolved in earlier reports); `overlaps.md` reports no pull request changing this roadmap and no dropped or revision-only id.
- **Remark (untouched text, passed by the earlier reviews; no change asked):** QuaternionicModularForms at its open head plans the analytic weights, overconvergent forms, Fredholm theory and theta classicality that §§0.2a–0.2f here own; the README does not cite it, and the description now states this roadmap's ownership.

Overlap check: QuaternionicModularForms, PadicFamilies (open heads) and ModularForms, CompactOperators (main) stand as read in the reviews of 480c64f, the folder being unchanged. Shared with QuaternionicModularForms: analytic and overconvergent quaternionic forms, their Fredholm theory and theta classicality — owned here in §§0.2a–0.2f (the remark above). PadicFamilies: nothing quaternionic shared. ModularForms owns the analytic form spaces and is cited as supplier.

Source independence: changed passages only — the folder has no changed passage, so 0 passages were compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered); the result of the review of 480c64f stands.

## Not verifiable

- **T. Saito, *Modular forms and p-adic Hodge theory*, Theorem 1 (`SaitoMFPH`):** recorded as uncertified (paywalled), cited by its locator; settled, and outside this round's changes.
- **Description, "AI assistance: … two author-side red-team passes":** a statement about the author's process; nothing at the head confirms or contradicts it.

## Source issues

- none

## For the human reviewers

- none

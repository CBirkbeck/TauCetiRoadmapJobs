# Review of ModularIwasawaMainConjectures (pull request #1499 at 8f21cae)

**Verdict:** needs changes

## R01 (P3) — The description says the two proposed suppliers have no pull request and lists too few dependent sections

**Location:** pull request description, the paragraph beginning “Dependencies”: “Two further prerequisites are proposed roadmaps that exist only as accepted packages on the jobs board, with no pull request in this repository yet: KatoEulerSystems and AutomorphicCongruences, whose contracts … must be published before the endpoints of §§1.5, 2.2–2.3, 4.1–4.3 and 5.4(2) can be built”.

**Claim:** KatoEulerSystems and AutomorphicCongruences have no pull request, and only §§1.5, 2.2–2.3, 4.1–4.3 and 5.4(2) wait on them.

**Witness:** Both are open roadmap pull requests (heads 7a6112e and 4291999); the description's own `depends-on` block lists them. `TauCetiRoadmap/ModularIwasawaMainConjectures/README.md` `*Needs:*` lines cite them also in §§0.1, 0.3, 0.4, 0.6–0.10, 0.12–0.13, 1.3–1.4, 2.1, 3.4–3.5, 4.5.

**Repair:** Replace the sentence by: “Two further prerequisites, KatoEulerSystems and AutomorphicCongruences, are roadmaps still in open pull requests (listed under ‘Depends on’). Their sections, and the contracts this roadmap adds to them (gap:modular-zeta-extensions, gap:central-critical-specialization, gap:automorphic-endpoints, gap:tate-twisted-components — Kato's main conjecture on the trivial component of the Tate twists T_K(1) and T_K(k−1) — and gap:central-critical-equality), must be in place before the targets that cite them can be built: §§0.1, 0.3, 0.4, 0.6–0.10, 0.12–0.13, 1.3–1.5, 2.1–2.3, 3.4–3.5, 4.1–4.3, 4.5 and 5.4, with the examples of §§5.10–5.11; the chain is PadicFamilies and the arithmetic foundations → KatoEulerSystems → AutomorphicCongruences → this roadmap.” Checked on the refuting instance: §3.4's `*Needs:*` line is “AutomorphicCongruences §7.9; §3.3; §3.1”, and §7.9 exists at that roadmap's open head (its README line 2250).

## Previous findings

- R01 — not repaired, settled as not actionable in this package (the plan is a board file), not re-raised: README lines 133 and 135 declare `gap:tate-twisted-components` and `gap:central-critical-equality`; the board plan's `gaps` still has eight slugs without them. Moved to “For the human reviewers”.
- R02 — not repaired, settled for the same reason, not re-raised: README lines 149–155 keep the fractional period comparison; the board plan's `manin-period-comparison` still asks for a unit comparison at every odd p. Moved to “For the human reviewers”.

## Verified sound

:robot: Independent AI review. Incremental re-review of 0 changed lines since 8f21cae; this round reads the pull request's title and description against the head.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `gap:tate-twisted-components` as the description words it (trivial component of T_K(1) and T_K(k−1)); README Conventions, §§1.5, 2.3, 4.3 | p=5, κ(γ)=6, δ=−1; k=2 and k=4 | Tw_r(e_χ)=e_(χωʳ). k=2: r=1=k−1, evaluation (ω⁻¹(δ), 6⁻¹)=(−1, 1/6); untwisted (1, 1). k=4: r=1 gives (−1, 1/6), r=3 gives (−1, 1/216). | The description's wording of the gap agrees with the README; the untwisted supplier statement does not give it. | None. |
| Supplier side of the same contract: AutomorphicCongruences §§2.21 and 4.5 at its open head (README lines 1183 and 1595) | read both statements | Both are stated for `H^i(ℤ[1/p], T ⊗ Λ_Iw)` of the untwisted lattice; no twisted-component statement appears. | README line 19 (“stated on the untwisted trivial tame component”) is right, so the gap asks for nothing already provided. | None. |
| `hasRankOneCoinvariants_of_unipotent` (“real-bodied definitions and theorems” in the description) | u=[[1,1],[0,1]], [[1,π],[0,1]], 1 over a DVR | range(u−1) = Oe₁, πOe₁, 0; quotients O, O⊕O/π, O². Second and third fail `hnt` (range inside 𝔪·O²). | Hypotheses select exactly the free rank-one case. | None. |

The rows of the previous review, of `8f21cae`, stand for every untouched statement; the folder's diff is empty.

Description sentences checked against the head, other than R01:

- Summary block: every clause matches the README (Kato's formulation at every prime including 2: Conventions, “Range of primes”; p = 3 through the Hida approximation: §1.6; `KatoPeriodDefectUnit`: 8 README lines from line 100; `TauCeti.completedGroupAlgebra` at README line 66 and at the pinned Tau Ceti; `TauCeti.tateCurve` at README line 13; consumers as in “Downstream consumers”).
- “Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)”: the folder has exactly these three files; the change is 2196 insertions, a new roadmap, no heading or declaration removed.
- “Validation” line: gate rerun, every text, import, name, metadata and folder check 0, `OK` (worker's gate adds `build=0`); `depcheck: 234 roadmaps, 2232 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line; `lake env lean` on `Suggested.lean` exits 0 with three `declaration uses sorry` warnings (lines 53, 68, 87) and nothing else; the outside-folder diff is empty.
- “HeegnerPointEulerSystems Layer 8b and the Birch–Swinnerton-Dyer branch are consumers only”: README line 24 and “Downstream consumers”.
- Cross-roadmap citations resolved this round: every KatoEulerSystems section the README cites (§§2.2, 4.2, 4.3, 4.6, 5.1–5.4, 6.2–6.6, 7.2, 7.4, 7.6, 7.9) and every AutomorphicCongruences section (§§1.11, 2.21, 3.4, 3.7–3.9, 4.3, 4.5, 4.6, 7.9, 7.10) is a heading at the open head; AutomorphicCongruences names this roadmap as a consumer only (its README lines 29, 707, 709, 2300), KatoEulerSystems once, as a consumer.
- Remark on untouched text, no change asked: README line 9 calls the two suppliers “proposed supplier roadmaps” conditional on publication; they are now in open pull requests, which the same paragraph's conditions still describe correctly.
- Elaborated signatures: the four types in the worker's `signatures.md` agree with the README statements of §§0.8, 3.6 and 3.7; no section binder lost. `Suggested.lean` is unchanged, so the padding probes and the statability audit were not rerun.

Overlap check: read AutomorphicCongruences, KatoEulerSystems, ModularIwasawaMainConjecturesPartII (open) and IntegralIwasawaTheory (main); nothing shared: the first two are suppliers that name this roadmap as consumer, Part II starts where this one stops (CM forms and the rational conjecture at p = 2, 3), IntegralIwasawaTheory owns number-field class-group Iwasawa theory.

Source independence: changed passages only; the folder's diff is empty, so 0 passages compared with 0 sources; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- The sentence “AI assistance: … after 0 independent review rounds and 2 red-team rounds on the job board”: the board holds red-team reports for two rounds, which agrees; which models ran them is not recorded where I can read it.
- BSDGP, Kobayashi and Silverman stay settled as uncertified, Serre and Jones as waived; no source was requested and none of the seeded sample falls in a changed passage.

## Source issues

- none

## For the human reviewers

- **Not tested.** The board plan (`packages/ModularIwasawaMainConjectures/design/plan.json`) lists eight gap slugs; README lines 133 and 135 declare two more, `gap:tate-twisted-components` and `gap:central-critical-equality`, both on AutomorphicCongruences. The intake reads the plan.
- **Not tested.** The plan's `manin-period-comparison` asks for a unit comparison at every odd p; README lines 149–155 ask for a fractional one (11a1 at p = 5: normalised symbol value 2/5, valuation −1).
- **Not tested.** Source independence was checked on changed passages only, and none changed; the wording and arrangement comparisons of the earlier full rounds were not repeated.

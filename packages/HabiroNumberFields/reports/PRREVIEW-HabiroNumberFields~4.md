# Review of HabiroNumberFields (pull request #1469 at 2c1e0cb)

**Verdict:** accepted

No findings. Incremental re-review of 0 changed lines since 2c1e0cb; this round reads the pull request's title and description against the head. Acceptance remains conditional on the declared `gap:bloch-foundations` contract (supplier K3BlochGroups §3.13 and the exceptional finite-field comparison adjoining §§5.4–5.5), stated in `TauCetiRoadmap/HabiroNumberFields/README.md` under the K3BlochGroups supplier contract.

## Previous findings

- none — the previous report, of 2c1e0cb, lists no finding; the folder is unchanged since.

## Verified sound

| Statement (cited by the description) | Instances tried | Values computed | Result |
|---|---|---|---|
| "unit denominator 24": `cyclicDilog_one_pow_twentyFour`, D(1)^24 = n^(12n) | n=2, ζ=−1; n=3, ζ primitive cube root | n=2: D(1)=(1−1)⁰(1+1)¹=2, 2^24=2^(12·2). n=3: D(1)=3(1−ζ²), (1−ζ²)²=−3ζ², so D(1)^24=3^24·3^12=3^36 | Holds |
| "KMS … over every field with n invertible, positive characteristic included": `kms` | signature; n=1 | `[Field K]`, `(n : K) ≠ 0`, no characteristic hypothesis; n=1: f=1, every D=1, T=0, both sides 1 | Description equals the Lean and §1.3 |
| "placing K₃(F)/n in inverse-character cyclotomic unit power classes at good orders" (§0.9) | F=ℚ, n=5 | K₃(ℚ)/5=(ℤ/48)/5=0; units of ℚ(ζ₅) mod fifth powers carry χ⁰ (real unit) and χ¹ (ζ₅) only, χ⁻¹=χ³ part 0 | Injection 0→0; consistent |
| "agreeing with the Chern map up to a unit" (§1.13) | zero-reduction sets of a class and its γ-multiple, γ∈(ℤ/n)ˣ | identical sets, so detection fixes ⟨class⟩ only; README claims `R_ζ=c_fixed,ζ^γ`, not γ=2 | Description claims no more than the head |
| "Only the local layers invert 6" | Conventions; Layer 3 Examples | 6∣Δ imposed only for layers with local sections; at p=2, 3 the denominators 24 and the phase normalization fail (README line 1234) | Agrees |

The rows for untouched statements, including all six declarations of `Suggested.lean`, stand as in the previous review, of 2c1e0cb.

- Pull request text against the head: title and every prose sentence of the description, with the `roadmap-summary` block, read against the README and `Suggested.lean`; none contradicted. The change (a new folder of three files, 83 headings, 6 declarations, nothing removed) is stated by the title and the folder sentence.
- Description claims resolved: consumers HabiroNahmSeries (cites §§1.7, 1.10, 1.13, 1.14 here), HabiroRings (cites §§2.1–2.4, 3.8–3.11, 3.14, 3.16 here) and ArithmeticQuantumTopology match the README's downstream paragraph; "2 red-team rounds" matches the package's reports; StableHomotopyKTheory, PolylogarithmFunctions and Chebotarev (completed) are on main.
- Suppliers: the 13 supplier subsections of the README against the description's dependency list (12 roadmaps, 2 of them on main; Chebotarev is completed and its two declarations exist in `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean`, lines 74 and 83, at the pin). None added or dropped unstated.
- Gate at 2c1e0cb: every check 0, `build=0`, OK. Dependency check rerun: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file changed outside the folder.
- Elaboration of `TauCetiRoadmap/HabiroNumberFields/Suggested.lean` with `lake env lean`: four `declaration uses sorry` warnings (lines 43, 50, 62, 71), nothing else; the six elaborated signatures agree with the README, no section binder lost.
- Duplication: `cyclicDilog`, `cyclicHypergeom` and `kms` are declared by no other roadmap's `Suggested.lean`, on main or at an open head.
- Overlap check: read HabiroNahmSeries, HabiroRings, PadicHodgeRegulators; nothing shared (HabiroNahmSeries and HabiroRings consume this roadmap's regulator, ring and lines by section; the completed Coleman comparison stays with PadicHodgeRegulators §§4.7, 5.6–5.9 and is cited).
- Source independence: changed passages only; the diff is empty, so 0 passages compared with 0 sources; largest share and contents as in the previous reviews; arrangement not compared again, since no layer was added, removed or reordered.

## Not verifiable

- The description's "0 independent review rounds" on the job board: the package's reports show the two red-team rounds only; nothing in the folder depends on it.
- The required compatibility b(ξ̄)=r(β) of §1.11 and the positive 𝔽₂ comparison of the declared K3BlochGroups gap, as in the previous review.
- Source locators were not opened again in this round: the folder is unchanged.

## Source issues

- none

The errata listed in the earlier reviews were not re-examined and are not repeated here.

## For the human reviewers

- none

# Review of PhiGammaModulesAndIwasawaCohomology (pull request #1310 at 09f2de3)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 09f2de3; this round reads the pull request's title and description against the head. Both findings are about the description only; the folder's files need no change.

## R01 (P3) — The description's list of sections used omits four open suppliers

**Location:** pull request description, dependencies paragraph: "By section, the README uses: NoncommutativeAndEquivariantIwasawa §§F.3 and F.6; ColemanPowerSeries §§1.45–1.49."

**Claim:** The sentence reads as the complete list of sections consumed from roadmaps not on main. The README consumes sections of four more such roadmaps, all named in the description's own depends-on block.

**Witness:** `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/README.md:170–172` (PadicPeriodRings §§1.1–1.5, 3–4.3), `:186` (PerfectoidTowers P9.0), `:206` (CrystallineCohomology §CR.4.7), `:1195` (IntegralIwasawaTheory §7.1, in a `*Needs:*` line).

**Repair:** Replace the sentence with: "By section, the README uses: PadicPeriodRings §§1.1–1.5 and 3–4.3; PerfectoidTowers P9.0; CrystallineCohomology §CR.4.7; IntegralIwasawaTheory §7.1; NoncommutativeAndEquivariantIwasawa §§F.3 and F.6; ColemanPowerSeries §§1.45–1.49."

## R02 (P3) — The AI-assistance sentence describes an earlier head

**Location:** pull request description, validation paragraph: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package, with author-side red-team passes to follow."

**Claim:** The red-team passes are not "to follow": the head contains their repairs, and three further rounds of review repairs. The models used for them are not named.

**Witness:** `git log origin/main..HEAD`: 10 commits titled "red-team repairs" (21d4f8d4 … 8cb314e9, the last with a `Co-Authored-By: Claude Opus 5.5` trailer) and 3 titled "review repairs" (606424ff, 2b59ba3c, 09f2de3b).

**Repair:** Replace with: "AI assistance: GPT-6 (Codex) for the port from the accepted explorer package; the ten red-team and three review repair rounds since were made with <the models used, e.g. Claude Opus 5.5>." (the author fills in the models actually used).

## Previous findings

- none: the previous review, of this same head, was an acceptance with no numbered finding (its own two carried findings were recorded there as repaired).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `wittProjective_of_flat_phi` (named in the description's summary; `Suggested.lean:65`) | R=𝔽_p, n=1, M=𝔽_p^d, F=id, d=0,1,2; p=2,3 | `truncatedWittFrobenius` is a↦a^p=a on 𝔽_p, so F(a•x)=a•x on both sides; M free of rank d, projective | Pass; none |
| same, flatness hypothesis | n=2, R=𝔽_p, M=ℤ/p over W₂(𝔽_p)=ℤ/p² | Tor₁(ℤ/p,ℤ/p)=ℤ/p≠0: not flat over ℤ/p², and not projective | Excluded by `Module.Flat (ZMod (p ^ n)) M`; none |
| same, junk index | n=0 | `TruncatedWittVector p 0 R`=(Fin 0→R) is the zero ring, every module zero; excluded by `0 < n` anyway | Pass; none |
| ColemanPowerSeries §§1.47–1.49 as cited by the description and README §2.5 | p=2, input π | ψ(1+π)=0, ψ(1)=1, so ψ(π)=−1; trace(π)=pψ=−2; reducing the trace mod 2 gives 0≠ψ(π) | Pass; none |
| Description: "restricts flattening base change to dominant transforms" against README §7.6 (:3074–3079) | A=E⟨X,Y⟩→E⟨X,T⟩, Y↦XT | Ordinary X-chart pullback has X(U−T)=0, an extra component; the dominant transform has U=T | Description agrees with the head; none |

All other rows stand as in the previous review, of `09f2de3`.

- Description sentences checked against the head: 14 (summary block 3 paragraphs, 4 prose paragraphs); 2 wrong (R01, R02), the rest agree. The title is a shortening of the README's title, not a contradiction.
- What the description must state and does: the pull request adds the folder (3403 insertions, no heading or declaration removed; nothing changed outside the folder); the six open suppliers are in its depends-on block.
- Cross-roadmap citations resolved at the open heads this round: 8 (PadicPeriodRings §§1.1, 1.5, 3, 4.1, 4.3; PerfectoidTowers P9.0; CrystallineCohomology CR.4.7; IntegralIwasawaTheory §7.1; ColemanPowerSeries §§1.45–1.49; NoncommutativeAndEquivariantIwasawa §§F.3, F.6), all present. AdicSpaces and LocalFieldsRamification are completed roadmaps on main.
- Pinned declarations the description names, opened at the pin: `TauCeti/RingTheory/FittingIdeal/Basic.lean:343` (`fittingIdeal`), `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145` (`completedGroupAlgebra`), `Mathlib/Algebra/Category/ModuleCat/Descent.lean:59` (`comonadicExtendScalars`), `TauCeti/RingTheory/Trace/Dual.lean:85`, `:98`.
- Gate rerun at this head: every rule 0, OK. Dependency check: `depcheck: 245 roadmaps, 2216 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration of `TauCetiRoadmap/PhiGammaModulesAndIwasawaCohomology/Suggested.lean` with `lake env lean`: one warning, `declaration uses sorry` at line 65. The two elaborated signatures agree with README §0.4; no binder lost.
- Seeded sample: all 15 targets lie in text unchanged since the previous review; no source locator was reread this round. Remark: the summary block says the route "follows Kedlaya–Pottharst–Xiao and Kedlaya–Liu"; the README itself makes no such statement.
- Overlap check: no folder change; the overlap list shows no shared id, second copy or conflicting head; the scopes of the closest roadmaps (PadicHodgeTheory, NoncommutativeAndEquivariantIwasawa, PadicMeasuresIwasawaAlgebras) were not reread this round and stand as in the previous reviews.

Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Which models made the red-team and review repairs (R02): only one commit carries a trailer; the author knows the rest.
- Carried: NSW Theorem 2.4.1, p.111, remains an uncertified paywalled locator; unchanged and not reopened.

## Source issues

- none

(No source was opened this round; the entries of the previous review stand.)

## For the human reviewers

- none

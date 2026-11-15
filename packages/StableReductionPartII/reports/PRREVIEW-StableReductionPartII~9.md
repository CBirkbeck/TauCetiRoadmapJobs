# Review of StableReductionPartII (pull request #1841 at 771fcf1)

**Verdict:** accepted

No findings.

## Previous findings

- none: the previous review, of this same head `771fcf1`, listed no finding, and the folder has not changed since (0 lines).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `nodePhi`·`nodePsi` (the description's "two-periodic matrix factorization") | General γ, δ, s, t; origin with γ=δ=0 | Entry (1,1): `(δv+δt+γu)(v−t)+(u+s+γt)(u−s)=q(u,v)−q(s,t)`, zero in the quotient; (1,2): 0. Origin: `X²·I` before quotient | Holds; agrees with Worked examples |
| §5.19 `λ^{⊗12}≅⟨ω,ω⟩⊗O(Δ)` (quoted in the description) | (2,3) pencil on ℙ¹×ℙ¹, g=2, b=0 | `K²=8−12=−4`, `κ=−4+8=4`, `deg λ=1+1=2`, `δ=16+4=20`; `12·2=24=4+20`. Reversed boundary sign: `4−20≠24` | Holds; sign and coefficient as described |
| §5.20 "universal sign ambiguity" (description) | Two universal choices; characteristic 2 | README line 6666: choices differ by ±1; images coincide in characteristic 2; non-universal isomorphisms differ by any unit | Description agrees |
| Tricanonical Hilbert polynomial (Conventions) | g=2, g=3 | `χ(ω^{3T})=(6g−6)T+1−g=(g−1)(6T−1)`; g=2: `6T−1`, rank 5; g=3: `12T−2`, rank 10=5g−5 | Holds |

Rows for all other statements stand as in the previous review, of `771fcf1`.

- **Pull request text:** 14 claims of the title, summary block and prose were read against the head, and none is contradicted. The pull request adds the folder (`README.md`, `Suggested.lean`, `metadata.toml`); it is not on main, and no heading or declaration is removed. The five theorems named are the five in `Suggested.lean`; its docstring names nine not-statable headlines. The six consumer interfaces are §§7.10–7.15. The two consumer roadmaps match Downstream consumers (README line 7382).
- **Citations in the description resolved:** 3. SchemeAndStackFoundations §4.15 `Mbar.forget` (main, README line 7063); VirtualFundamentalClass §§2.1–2.3 (open head, headings at lines 441, 464, 472); EquivariantIntersectionTheory §§1.4 and 2.4 (main, lines 331, 465). All are used as the description says, in §5.15 and the contracts at README lines 174–180.
- **Suppliers:** the README has 22 `From TauCetiRoadmap.*` contracts: 9 are on main and 13 are open, and these 13 are exactly the generated depends-on block. The prose names VirtualFundamentalClass, the only one by another author. No supplier is left unstated.
- **Gate:** re-run at `771fcf1`, every check 0, result OK, as in the worker's `gate.md` (which also records build=0). The outside-folder diff is empty.
- **Dependency check:** `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- **Elaboration:** `lake env lean` on `TauCetiRoadmap/StableReductionPartII/Suggested.lean` exits 0; the only warnings are five `declaration uses sorry` (lines 122, 139, 148, 155, 171). The file is unchanged, so the signature comparison and the padding probe stand.
- **Seeded sample:** none of the 15 seeded targets lies in a changed passage, since the folder diff is empty; no source locator changed.
- **Overlaps:** no open pull request changes this roadmap or drops an id it cites. The one unresolved-name lead (`ModuliDescent.polarizedDescentComparison`, README line 190) is untouched text, resolved in an earlier review at the AlgebraicModuliForArithmeticGeometry open head.

Overlap check: read StableReduction, SchemeAndStackFoundations, JacobianChallengePartII, AlgebraicModuliForArithmeticGeometry (scope as cited in this README's Scope and contracts); shared object: the identification of `M̄_{g,n+1}` with the universal curve, owner SchemeAndStackFoundations §4.15 (`Mbar.forget`, the statement), with this roadmap §2.248 supplying the proof route only. The results-and-headings list is empty.

Source independence: changed passages only; 0 passages compared with 0 sources, since the folder is unchanged since the previous review; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- `blr-relative-picard-LwkQQl` and `mc6-fc1990`: settled as uncertified, and outside the changed passages.
- The description's "3 independent review rounds and 2 red-team rounds": a statement about the job board, not about the head; not checked.

## Source issues

- none

## For the human reviewers

- none

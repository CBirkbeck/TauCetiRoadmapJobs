# Review of ReductiveGroupsPartIII (pull request #2131 at b10dfae)

**Verdict:** accepted

Incremental re-review of 0 changed lines since b10dfae; this round reads the pull request's title and
description against the head. No finding.

## Previous findings

The previous review, of `b10dfae`, had no finding, so there is none to account for.

## Verified sound

**The pull request's text against the head.** Each sentence of the title, the summary block and the prose
was set beside the README and `Suggested.lean` at b10dfae; none is contradicted and no change of the
pull request is left unstated (it adds the folder: 3 files, 2121 insertions, 0 deletions, no heading or
declaration removed, nothing outside the folder).

| Statement (description sentence → README target) | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| "Chevalley restriction … retaining arbitrary fields and non-split maximal tori" → §0.3 (`README.md` lines 440–463) | `SL₂→PGL₂`, `α=a²`, `s=a+a⁻¹`; norm-one torus of `ℚ(i)` | `α+α⁻¹=s²−2`; `s=±5/2`: `25/4−2=17/4` on both; anisotropic torus: `W=1`, `Conj(T)=T` | the description matches §0.3; a non-split torus is covered | none |
| "an auxiliary rational class yields a common rational Frobenius quotient point" → §5.5 (lines 1588–1600) | `G_m→GL₂`, `t↦diag(t,t⁻¹)` | fibre over `(s,d)=(5/2,1)`: roots of `X²−(5/2)X+1`, `{2,1/2}`, two geometric points | `δ∈Conj(H₁)(ℚ)` is the auxiliary class; injectivity is a hypothesis, as stated | none |
| "a rational representative matches local Frobenius classes away from p and at most one auxiliary prime", under `G_der` simply connected and `G_{ℚ_p}` quasi-split → §§5.8–5.9 (lines 1706–1762) | `GL₂`, `(a,q)=(1,5)`; `(a,q)=(4,4)` | `1−20=−19<0`, elliptic; `X²−4X+4=(X−2)²`: scalar `2` semisimple, companion minus `2` is `[[−2,−4],[1,2]]≠0` with square `0` | hypotheses and "all `ℓ≠p` except at most one" agree with §5.9 | none |
| "the full simply connected Hasse principle includes E₈ factors" → §4.4 line 1343, §5.7a line 1681, §5.8 line 1720 | — | three passages each keep `E₈`, via EndoscopicTransferAndUnitaryTraceComparison §1.9(c) | agrees | none |
| "prove an odd unitary Hasse principle" (over `ℚ`) → §4.6 (line 1400) | `F⁺=ℚ`, `d=1`, `n` odd | `T₁=Res_{F/ℚ}G_m`, `H¹(ℚ,T₁)=ℚ^×/(N(F^×)·ℚ^×)=1`, so `ker¹=1` | agrees: `d` and `n` odd, `ker¹(ℚ,G)=1` | none |
| "dense neat Weil points on Serre tori" → §3.7, `exists_pow_isNeatPoint_dense` | `G_m`, `l=3`, `γ=−3`, `m=2`; `γ=−1`, `m=1` | `γ²=9`, `⟨9⟩≅ℤ` torsion free, weight `4`; `−1` is a `3`-Weil point of weight `0` with `⟨−1⟩` of order `2` | a power `m>1` is needed, as the Lean states (`∃ m, 0<m`) | none |
| "support non-emptiness of Newton strata and Honda–Tate theory" → Downstream consumers (lines 1789–1791) | — | §§2.3, 2.5 for Newton strata; §§2.5, 4.5, 4.6 for Honda–Tate; Newton strata themselves left to BunGAndNewtonStrata (line 131) | agrees | none |
| "The geometric Shimura-variety independence theorem enters as an explicit hypothesis" → Scope lines 125–130 | — | KZ25 Theorem 5.1.4 is a hypothesis of §5.5 | agrees | none |

The rows for the remaining statements stand as in the previous review, of `b10dfae`.

- Gate re-run at b10dfae: every check 0, `OK`; worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ReductiveGroupsPartIII'` is empty.
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/ReductiveGroupsPartIII/Suggested.lean`: six `sorry` warnings (lines 96, 113, 130, 143, 225, 237), nothing else. The 12 elaborated signatures are those of the previous review; none lost a binder.
- Description counts confirmed: 3 files in the folder; 6 definitions with real bodies and 6 sorried theorems; no `set_option`; the 11 roadmaps of the description's dependency list are exactly the README's supplier subsections that are not ReductiveGroups, ReductiveGroupsPartII (main), Chebotarev or GlobalNumberFields (`Completed/` on main).
- Sources: no passage changed, so no locator of the seeded sample falls in a changed passage; the README flags none as unverified.
- Name check at the pin: `isConj_iff_trace_eq` exists for `SU2` (`TauCeti/RepresentationTheory/SU2/ConjugacyClasses.lean:108`), in another namespace and for another object; SatoTateGroups cites that one. No fully qualified name of `Suggested.lean` is declared by another roadmap.
- Remark (no change requested): the description names KZ25 Theorem 5.1.4 as the hypothesis; the README also takes KMPS22 Proposition 2.2.2 as a hypothesis of §4.5 (line 127). The citations file's `Neat.IsNeatAut` lead is AdelicAlgebraicGroups' own target, as recorded before.

Overlap check: read BunGAndNewtonStrata, EndoscopicTransferAndUnitaryTraceComparison, ShimuraData, ReductiveGroupsPartII, AdelicAlgebraicGroups, ReductiveGroups; nothing shared (searched by object: class-function equalizer, group Chevalley restriction, Jordan's covering lemma, Serre condition for tori, prime-units, Weil points, Harder approximation; Newton strata stay with BunGAndNewtonStrata, the Lie Chevalley quotient with ReductiveGroups Layer 11C).

Source independence: changed passages only; 0 passages changed, so 0 compared; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Noot09 and Kottwitz82: settled as waived; cited by locator, not read.
- The description's sentence on the AI assistance (the number of review and red-team rounds before the port) describes the board's history, which the folder does not record.

## Source issues

- none (none found in this round; the Harder66 gap at the proof of Lemma 5.5.3 is recorded in the previous review)

## For the human reviewers

- none

# GATE-PurityForFlatCohomology~4: answers to human review

Head before: `057858f`. Head after: `a825987` (one commit, README only; `Suggested.lean` unchanged).
One comment was unanswered (CBirkbeck, 2026-11-15T08:17:18Z, review of `160e354`); it makes one
point, F01.

## H01 (CBirkbeck) — applied differently

The claim is right, and the reviewer's replacement sentence for the description is accurate: [CS24]
Theorem 3.2.4 (CS24 line 1381) is the invertible-order case, and Theorem 6.2.4 is deduced from
Theorem 6.2.3 for `G = ℤ/p` on a hypersurface (CS24 lines 3549–3554), as README §6.3 (`*Needs:*
§§1.1, 1.6, 6.2`, line 2065) records. The pull-request description is outside this job's files, so
that sentence is the worker's to replace with the reviewer's text; in the folder the same over-claim
(the full étale-depth bound attributed to the classical, perfectoid-free Layer 1) stood in three places
and is now scoped:

- README line 24 (layer table, Layer 1): "Gabber's étale-depth bound" → "Gabber's étale-depth bound
  for coefficients of invertible order".
- README lines 780–783 (How to read the build): "the étale depth bound through absolute purity and
  local duality" → "the étale-depth bound for coefficients of order invertible in `R` through absolute
  purity and local duality … ; the bound for every commutative finite étale group is Layer 6's (§6.3),
  through purity for complete intersections."
- README line 1199 (§1.6 heading): "The étale depth is at least the virtual dimension" → "The
  étale-depth bound for coefficients of invertible order". With no set of primes named, SGA 2's
  étale depth is taken for every prime (SGA2 line 5994–6001, Exposé XIV Définition 1.2), so the old
  heading stated Theorem 6.2.4, while §1.6 proves only the case of Theorem 3.2.4. The section number is
  unchanged; no README link points to the old anchor, and the one outside citation found
  (EtaleDualityAndPerverseSheavesPartII: "PurityForFlatCohomology §1.6 … CS24 Theorem 3.2.4") cites
  by number and still matches.

The Layer 1 introduction (lines 1006–1008) and the end of §1.6 (line 1215) already restricted the
perfectoid-free claim to invertible order and are unchanged. `Suggested.lean` already agrees: the
docstring of `etaleDepth_ge_virtualDimension` (lines 233–240) cites Theorem 6.2.4 for the general
bound and Theorem 3.2.4 for invertible order, and it sits in the Layer 6 section.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Layer 1 delivers the étale-depth bound only for coefficients of invertible order (lines 24, 781, 1199) | `R = k⟦x,y,z,w⟧/(xy − zw)`, `G = ℤ/ℓ`, `ℓ ≠ char k`; `R = 𝔽_p⟦x,y⟧`, `G = ℤ/p` | first: `vdim = 4 − 1 = 3`, §1.6 gives `H^i_𝔪 = 0` for `i < 3` (as in the Layer 1 Examples); second: order `p` is not invertible, so §1.6 does not apply; `vdim = 2`, `H^0_𝔪 = 0`, and `H^1_𝔪 = 0` because `H^0(R, ℤ/p) = ℤ/p → H^0(U_R, ℤ/p) = ℤ/p` is bijective (`U_R` connected) and `H^1(R, ℤ/p) = R/(F − 1)R → H^1(U_R, ℤ/p)` is injective by Artin–Schreier and `Γ(U_R, 𝒪) = R`; this is §6.3's | first case is Layer 1's, second is Layer 6's: the scoped wording matches both | scoped |
| The bound for every commutative finite étale `G` is Layer 6's (§6.3), through purity for complete intersections (line 783) | `R` mixed characteristic `(0, p)` hypersurface, `G = ℤ/p` | §6.3 route: §1.6's reduction ends at `ℤ/p` on `R̃/(f)` (complete intersection, `vdim = dim`), then §6.2 (CS24 lines 3549–3554); the shorter route of CS24 Remark 6.2.5 still passes through Theorem 2.2.7, a tilting statement for perfectoid rings (CS24 lines 827–835), so no perfectoid-free route is claimed | holds; agrees with §6.3 `*Needs:*` line 2065 and §6.2 `*Needs:*` (… 5.10) | added clause |
| Old §1.6 heading against SGA 2's definition | `R = 𝔽_p⟦x,y⟧`, prime `p` | SGA 2 XIV Définition 1.2 with the set of primes omitted means every prime (SGA2 lines 5994–6001); the old heading therefore asserted `prof_ét(R) ≥ vdim(R) = 2` including `ℤ/p`, which the §1.6 statement (order invertible) does not cover | old heading over-claimed | heading scoped |

No definition, Lean statement or Check changed, so the elaborated signatures in `signatures.md` (25
declarations, none missing a section binder) stand for this head; no `#check` file was rerun because
`Suggested.lean` is byte-identical to `057858f`. No construction was added, so ownership against open
pull requests is not affected by this round.

## Build and gate

- `lake build TauCetiRoadmap.PurityForFlatCohomology.Suggested`: `Build completed successfully
  (18658 jobs).` 15 warnings, all ``declaration uses `sorry` `` (lines 161, 172, 185, 241, 258, 268, 275,
  288, 320, 336, 378, 394, 421, 436, 450); 0 errors.
- Gate (after the commit): `gate PurityForFlatCohomology: set_option=0 blob=0 latex=0 tex=0 prnum=0
  sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
  no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
  empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
  stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)` — no UPWARD, CYCLE or
  `moved:` line.
- Commit: `a825987` "PurityForFlatCohomology: review repairs (Layer 1 étale-depth bound scoped to
  invertible order; full bound §6.3)". Not pushed.

## For the worker

- Replace in the pull-request description the clause "the étale-depth bound and Zariski–Nagata purity
  need no perfectoid input" by the reviewer's text: "the étale-depth bound for coefficients of order
  invertible in `R` (§1.6) and Zariski–Nagata purity need no perfectoid input; the bound for every
  commutative finite étale group (§6.3) rests on purity for complete intersections (§6.2)."

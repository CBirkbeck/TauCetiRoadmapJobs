# Review of BianchiModularForms (pull request #1719 at 70ba211)

**Verdict:** accepted

This is an incremental re-review of the 20 lines changed since 21cc412. All of them are in §9.4 of `TauCetiRoadmap/BianchiModularForms/README.md`: the face criterion now requires a strict margin, and a negative-control Check covers the Euclidean case. The one previous finding is repaired. The new criterion is mathematically sufficient. Its three negative-control instances (`d = 1, 2, 11`) are correct, recomputed by hand and numerically. The gate passes. No new finding.

## Previous findings

- R01 — repaired: `README.md:2283–2287` now reads "a hemisphere carries a face when the floor formed by the other primitive hemispheres is strictly lower than its apex … equality at the apex decides nothing". `README.md:2292–2302` adds the `ℚ(i)` negative control `(1 + i, −i)`, with `d = 2` and `d = 11` instances.

No repair report marks any finding "not actionable in this package".

## Verified sound

I read:

- the full diff (`scratch/changes.md`);
- §9.4 as it stands at this head (`README.md:2266–2324`);
- the passages it cites or that cite it: §0.3's termination criterion (`:391–437`), the §9.4 boundary fact for `ℚ(√−11)` (`:2276–2278`), the Fundamental-domains worked example (`:2441–2444`);
- the previous report.

Scope of the change:

- `git diff --stat 21cc412..HEAD` lists only `README.md` (17 insertions, 3 deletions). `Suggested.lean` is byte-identical to the file reviews ~3 to ~5 read.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.

### The changed passages

- **The criterion is sufficient.** Let `S` have centre `p` and radius `r`, and suppose the other primitive hemispheres have floor height strictly below `r` at `p`. Only finitely many hemispheres reach height `> r/2` near `p`: that needs `|c|² < 4/r²`, and for each `c` the centres lie in the lattice `c⁻¹𝓞_K`. Near `p`, the floor of the others is therefore a maximum of finitely many continuous functions, so the strict inequality holds on a neighbourhood and `S` carries a face of positive area.
- **"Carries none when its height never exceeds the floor" is right.** Two distinct spheres cannot agree on an open set.
- **"Equality at the apex decides nothing" is right.** With a single competitor of equal height at `p`, `S` beats it on the open half-plane beyond their radical line through `p`. So equality can go either way, and the `d = 1` Check shows the negative side.
- **Consistency with the face lists.** Every face-list Check of §9.4 certifies its faces by a strict margin (`3/20 < 1/4`, `8/99 < 1/9`, `0.0493 < 1/16`, `0.0380 < 1/23`, `< 0.022` at `d = 163`). For `d ≡ 3 (mod 4)`, `d ≥ 19`, the first Check is strict too:
  - the norm form `(x + y/2)² + ((1 + d)/4 − 1/4) y²` takes no value in `(1, 4)`;
  - `±2` are the only elements of norm 4;
  - every other hemisphere with `|c|² > 4` has radius² `< 1/4`.

  So the new criterion confirms every listed face. §0.3's criterion (vertices lying *strictly* below a further hemisphere, `:418–421`) is consistent with it.
- **`d = 1` negative control.**
  - The centre of `(1 + i, −i)` is `−(−i)/(1 + i) = (1 + i)/2`, with radius² `1/|1 + i|² = 1/2`. The pair is primitive because `−i` is a unit.
  - With `p = (1 + i)/2` and `|p|² = 1/2`: `h_S² − h_a² = 2x·(p − a) + |a|² − 1`. This is positive exactly when `x` is on the far side of the bisector of `a` and `2p − a = 1 + i − a`.
  - The four half-planes are `x₁ + x₂ > 1`, `x₂ > x₁`, `x₁ > x₂` and `x₁ + x₂ < 1` (for `a = 0, 1, i, 1 + i`). They are pairwise opposite, so their intersection is empty.
  - The floor height² at `p` is `1 − 1/2 = 1/2`, and the Euclidean list `{1}` matches `:2273–2274`.
- **`d = 2` instance.**
  - `(2, −1 − √−2)` is primitive (norms `4` and `3`), with centre `(1/2, √2/2)` and radius² `1/4`.
  - The distance² to each of `0, 1, √−2, 1 + √−2` is `3/4`, so the floor height² is `1/4`. This is the lowest vertex (Euclidean minimum `3/4`, `:2275`).
  - The half-planes are again pairwise opposite: `x₁ + √2x₂ ≷ 3/2` and `−x₁ + √2x₂ ≷ 1/2`.
- **`d = 11` instance.**
  - `(2, 1 + ω)` is primitive (`N(1 + ω) = 5`).
  - Its centre `(−3/4, −√11/4)` is the midpoint of `−1` and `−ω`. That is `(1 + d)/16 = 3/4` from each, which agrees with the formula of the next Check.
  - The circle where `U_{−1}` and `U_{−ω}` meet lies in their bisector plane, has centre `m` and radius² `1 − 3/4 = 1/4`. It is a great circle of `S`, so `S` contains the whole edge, and heights² along it are `1/4 − t²` on all three spheres.
  - The radical plane of `S` and `U_{−1}` passes through `m` and is perpendicular to the segment, so it is that bisector plane. `S` therefore beats `U_{−1}` only on the `−ω` side and `U_{−ω}` only on the `−1` side, never both.
  - The edge ends at the lowest vertices of height² `2/11 = 1 − 3/44 − 3/4`. This is the contact `:2276–2278` records.
  - "Tangency" means a supporting contact: `S` lies below the floor and meets it along the crease, while it crosses each unit hemisphere at 60° (`cos θ = (1 + 1/4 − 3/4)/(2·1·½) = 1/2`). The untouched worked example at `:2443` uses the word in the same sense.

### Adversarial calculations

Rows for statements the diff leaves untouched are carried from PRREVIEW-BianchiModularForms~5 (at 21cc412), which carried them from ~3 (916795e) and ~4 (3ffc099). The changed statements are recomputed here. The numerical values come from a pure-Python maximisation of `h_S² − max_{others} h²` on a `161 × 161` grid of radius `0.25` around the centre. The others are all primitive hemispheres with `|c|² ≤ 24` and centres within `1.6` (957, 1067 and 793 hemispheres). Primitivity is tested as the gcd of the `2 × 2` minors of the coordinates of `c, ωc, d, ωd`.

| Statement | Instances and values on each side | Result |
|---|---|---|
| 9.4 face criterion, sufficiency (strict) | `d = 19`, `S_{2,1+ω}`: floor² of others at centre `0.150 = 3/20 < 0.25`, margin `0.100` → face. `d = 43`, `S_{3,2+ω}`: `0.0808 < 0.1111`, margin `0.051` → face. `d = 67`, `S_{3−ω,5}`: `0.0380 < 0.0435` → face. | Sound. |
| 9.4 face criterion, "equality decides nothing" | `d = 1`, `(1+i, −i)`: floor² at centre `0.500000` = radius² `0.500000`; grid supremum `0.000e+00` at the centre; `0` grid points strictly above. | Sound: equality occurs and no face. |
| 9.4 Check `d = 1` negative control | Centre `0.5 + 0.5i`; floor attained at the centre by the four units at `0, 1, i, 1+i` (`|c|² = 1`). Half-plane test of `h_S² − h_a²` at `x = (0.6, 0.3)`: `a = 0` gives `2(0.45) − 1 = −0.1 < 0`; `a = 1` gives `−0.3 < 0`. So `S` is below both, consistent with `x₁ + x₂ < 1`, `x₁ > x₂`. | Sound. |
| 9.4 Check `d = 2` instance | Centre `0.5 + 0.70711i`, radius² `0.25`; floor² at centre `0.250000`, attained by the four units and also by `|c|² = 2, 3` hemispheres through the vertex; supremum `−5.6e−17`; `0` points above. | Sound. |
| 9.4 Check `d = 11` instance | Centre `−0.75 − 0.82916i`, radius² `0.25`; floor² `0.250000`, attained by the units at `−1`, `−ω` and two `|c|² = 3` hemispheres; supremum `−1.1e−16`; `0` points above. Along the edge, `h_S² = h_{−1}² = 1/4 − t²`; the end vertex is at `t² = 3/44`, height² `2/11`. | Sound. |
| 9.4 Check 1 (`d ≡ 3 mod 4`, `d ≥ 19`) | Carried from ~5: distance² `(1 + d)/16 = 1.25, 2.75, 4.25, 10.25`; floor² `1/4`; competitor `3/20` at `d = 19`. Here, also `(1 + 11)/16 = 3/4 < 1` for `d = 11`, matching the new instance. | Sound. |
| 9.4 `d = 19, 43, 67, 163` face lists | Carried from ~5 (sizes `{1, 4}`, `{1, 4, 9}`, `{1, 4, 9, 16, 23}`, `4…36` plus `41`, `49`; margins and suprema there). | Carried. |
| 0.3 finiteness bound, termination criterion | Carried from ~5 (Aranés's `|µ| ≤ 21436` against `|µ| = 3` for `d = 43`; `d = 19` covering hypothesis). | Carried. |
| 9.5 covolumes | Carried from ~4: `G/3 = 0.30532`, `√3 L(2, χ₋₃)/8 = 0.169157`. | Carried. |
| 0.1, 0.4, 0.5, 1.2–1.5, 2.1, 2.4, 2.5, 2.7, 3.1, 3.5, 4.1–4.7, 5.2, 5.3, 5.5, 5.6, 5.8, 6.1–6.6, 7.3, 7.5, 7.7, 8.1, 8.3, 8.4, 8.6, 9.1, 9.3, 9.4 Euclidean floors; both `Suggested.lean` theorems | Untouched; values as computed in ~3: cusp counts 3/4/3, `dim E_k = (k−1)²`, Casselman `max(0, r − c + 1)`, Atkin–Lehner signs, period `16π²I(1)/(w_K|d|)`, inert `a_𝔭 = a_p² − 2χ(p)p`, Vogtmann's list, floor heights² `1/2, 2/3, 3/7, 1/4, 2/11`. | Carried. |

### Seeded sample

None of the sampled targets (1.2, 1.5, 1.6, 2.2, 3.4, 4.5–4.8, 5.2, 5.3, 6.4, 6.7, 8.2, 8.5) falls in the changed passage, so they were not re-checked in this incremental round. They stand as verified in reviews ~3 to ~5. The README flags no locator as unverified (a search for "unverified", "not verified" and "uncertified" finds nothing). The changed passage adds no locator. Its existing citations (Swan Proposition 8.4; Aranés §3.2.4, Proposition 3.2.25, p.76) are as verified in ~5: `aranes2010thesis line 3378–3384` and `rahm2010thesis line 752–755`.

### Suppliers, direction and gate

The changed passage adds no citation. §9.4's `*Needs:*` line (§0.3; KleinianGroups Layer 2 face-pairing criterion) is unchanged and was resolved in ~5. The dependency check on this head:

```text
depcheck: 235 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The gate with the candidate merge order and the targeted build:

```text
gate BianchiModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The worker's gate (`scratch/gate.md`) reports the same. Without the order flag the gate stops only at `depcheck: NOT IN ORDER: BianchiModularForms`, because main's order does not list the roadmap yet. The brief places it after its last supplier, so this is not a finding.

`scratch/overlaps.md`: no open pull request changes this roadmap, drops an id it cites, or alone defines one.

The eight "Lean names found nowhere" in `scratch/citations.md` are LMFDB knowl ids (`mf.bianchi.weight2`, `ec.q_curve`, …) listed as references at `README.md:2541–2545`, not Lean declarations.

### Lean acceptance test

- **Elaboration.** `lake env lean TauCetiRoadmap/BianchiModularForms/Suggested.lean` from the worktree exits 0. Its output is exactly the two `declaration uses sorry` warnings, at lines 140 and 160.
- **Imports and options.** The file has the single line `import Mathlib` and no `set_option`.
- **Signatures.** The ten elaborated signatures in `scratch/signatures.md` match ~5. The four "dropped" `[NumberField K]` binders belong to `cusps`, `cuspidalHom`, `cuspidalH1` and `sl2Image`, whose types do not mention the instance. Both theorems carry `NumberField`, `IsTotallyComplex`, `Fact (finrank ℚ K = 2)`, and `finrank_H1_sub_cuspidal` also the two nonzero-ideal hypotheses.
- **Probes and headlines.** The one-tactic probes of ~3 stand: both theorems resist `simp`, `rfl` and `infer_instance`. The headline inventory is unchanged: two headlines are stated (§1.2 boundary dimension, §9.3 vanishing list), and the others are named in the module docstring with their missing carriers.

Remarks on untouched text, no change requested: the two remarks of earlier reports stand (Layer 9 Dependencies and the Kleinian-groups supplier contract list Layer 3, which is consumed only transitively through Layer 4). Ownership against open pull requests was checked for the overlap list only. The by-object search of ~3 was not redone, because the diff introduces no object.

## Not verifiable

- **Swan 1971** (Adv. Math. 6): recorded `uncertified` in the manifest. Proposition 8.4, cited again by the changed paragraph, was verified only through Aranés's and Rahm's restatements, which cite it by that number.
- **Elstrodt–Grunewald–Mennicke, Bianchi 1892, Harder 1987, Weil, Bygott 1998, Lingham 2005, the LMFDB knowls**: as in the previous reports. The diff touches none of the passages that cite them.

## Source issues

- none

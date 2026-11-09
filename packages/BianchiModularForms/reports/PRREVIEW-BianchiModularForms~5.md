# Review of BianchiModularForms (pull request #1719 at 21cc412)

**Verdict:** needs changes

Incremental re-review of the 73 lines changed since 3ffc099 (§0.3's Swan locators and termination criterion, §1.3's capitalisation, §5.1's `*Needs:*` placement, §9.4's non-Euclidean face lists as Checks, three reference entries). Both findings of the previous review are repaired, and the new Checks are numerically correct (values under Verified sound). One new finding: a sentence the repair added to §9.4 states a face criterion that is false as written, refuted by the roadmap's own Euclidean fields.

## R01 (P2) — The face criterion of §9.4 lacks its strictness hypothesis

**Location:** `TauCetiRoadmap/BianchiModularForms/README.md:2283–2284`: "a hemisphere carries a face when the floor height at its centre is its own radius, and carries none when its height never exceeds the floor."

**Claim:** Equality of the floor height with the radius at the centre of a primitive hemisphere is sufficient for the hemisphere to carry a face of the floor.

**Witness:** Over `ℚ(i)` the primitive pair `(1+i, −i)` gives the hemisphere `|x − (1+i)/2|² + y² = 1/2`, whose apex `((1+i)/2, 1/√2)` is the lowest vertex of the floor, where the four unit hemispheres at `0, 1, i, 1+i` meet: the floor height at its centre is `1/√2`, its own radius, yet the hemisphere lies below one of the four unit hemispheres on every open set near the apex (it beats the unit hemisphere at `a` only on the open half-plane away from `a`, and the four half-planes have empty intersection), so `sup (h_S² − floor_others²) = 0` and it carries no face, as §9.4 line 2273 itself states ("unit hemispheres `|c| = 1` alone"). The same happens over `ℚ(√−2)` for `(2, −1−√−2)` (apex at the lowest vertex, height² `1/4`, competitor `|c|² = 3` equal there, supremum `−5.6e−16`) and over `ℚ(√−11)` for `(2, 1+ω)`, whose apex is the midpoint of `−1` and `−ω` and which contains the whole edge where those two unit hemispheres meet (heights `1/4 − t²` on both sides along the edge), the tangency the README records at line 2277. The Checks of §9.4 are unaffected: each of them records a competitor strictly below (`3/20 < 1/4`, `8/99 < 1/9`, `0.0493 < 1/16`, `0.0380 < 1/23`, `< 0.022` against `1/25` and `1/36`), which is the hypothesis the sentence omits.

**Repair:** State the criterion with the strict margin the Checks use: "a hemisphere carries a face when every other primitive hemisphere is strictly lower at its centre, so that the floor height there is its own radius with a positive margin, and carries none when its height never exceeds the floor; equality at the centre decides nothing." Add the `ℚ(i)` instance as a negative-control Check of the Euclidean case: the hemisphere of `(1+i, −i)` has its apex at the lowest vertex of the floor and carries no face, so a criterion that accepts equality would list `|c|² = 2` for `ℚ(i)`.

## Previous findings

- R01 — repaired: `README.md:404–406` and `:416–420` now cite Swan by Theorem 3.13, §8 and Proposition 8.4, with Rahm Theorems 6 and 12 and Aranés Proposition 3.2.25 as open restatements; `README.md:2281–2282` cites Proposition 8.4 and Aranés for the non-Euclidean face lists, which are Checks.
- R02 — repaired: `README.md:603` reads "Use k for the cohomological parameter"; §5.1's `*Needs:*` line is now last, at `README.md:1334–1335`, after its API bullets and Checks.

No repair report marks any finding "not actionable in this package".

## Verified sound

I read the full 73-line diff and the passages it touches or that cite it: §0.3 (`README.md:391–437`), §1.3 (`:596–606`), §5.1 (`:1310–1335`), §9.4–9.5 (`:2266–2307`), the references (`:2477–2489`), the Kleinian-groups supplier at the head of its open pull request (Layer 2, `isFundamentalDomain_of_facePairing`, and Layer 4), and the previous report. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD` excluding the folder is empty); `Suggested.lean` is unchanged since 3ffc099 (`git diff --stat 3ffc099..HEAD` lists only `README.md`).

### The changed passages

- **§0.3 finiteness.** The README's statement (finitely many primitive hemispheres carry faces over a translation cell, with a bound `B_K` on `|c|²`) is Rahm Theorem 6 (`rahm2010thesis line 664`, printed p.19 under the running head at line 654; §1.1.1 runs from line 592 to 669) and Aranés Theorem 3.2.18 (`aranes2010thesis line 3232`), whose proof (line 3233) cites Elstrodt–Grunewald–Mennicke Chapter 7, Theorem 3.8 and Swan Theorem 3.13, exactly the two locators the README gives. Swan §8 for the explicit bound is Aranés Remark 3.2.24 (line 3335), which also says the bound is far above the actual face sizes (`|µ| ≤ 21436` against `|µ| = 3` for `d = 43`), as the README's "far below it" says.
- **§0.3 termination criterion.** Rahm Theorem 12 (`rahm2010thesis line 752`, printed p.21, §1.1.4 from line 736) and Aranés Proposition 3.2.25 (`aranes2010thesis line 3378–3384`, printed p.76, §3.2.4 from line 3320, proof citing Swan Proposition 8.4): a family covering the cell apart from the singular points cuts out the floor iff no vertex lies strictly below a further hemisphere. The README's statement has the same hypothesis (Rahm's "collection", line 748–749) and the same conclusion. The `d = 19` remark is right: the unit hemispheres meet only along rows (`|ω|² = 5 > 4`), the bisector lines `Re x = n + 1/2` are parallel, so the cell structure has no vertex, while `(1 + 19)/16 = 5/4 > 1` leaves the centre of `S_{2,1+ω}` uncovered.
- **§9.4 Checks.** Recomputed (table below) by direct maximisation of `(1 − |cx + d|²)/|c|²` over primitive `(c, d)`, primitivity tested as the gcd of the `2 × 2` minors of the coordinate matrix of `c, ωc, d, ωd`. Every stated value agrees; for `d = 163` the sizes `41` and `49` carry faces (margins `2.8e−3`, `6.2e−3`), which is the "further sizes above 36" the Check asserts.
- **§1.3, §5.1.** Capitalisation and `*Needs:*` placement as the previous review asked; §5.1's `*Needs:*` content is unchanged and its suppliers (ALS.3.6, ALS.3.14) are as resolved in the previous reports.
- **References.** Rahm's HAL id `tel-00526976` matches the cached copy's header (`rahm2010thesis line 5`); Aranés is the Warwick repository copy (`aranes2010thesis line 5–7`); both are recorded `certified` in the board manifest, Swan `uncertified`. The `Elstrodt–Grunewald–Mennicke` entry (`README.md:2494`) already lists Chapter 7 for the fundamental domains.

### Adversarial calculations

Rows for statements the diff leaves untouched are carried from PRREVIEW-BianchiModularForms~3 (computed at 916795e) and ~4 (§9.5 at 3ffc099); the changed statements are recomputed here.

| Statement | Instances and values on each side | Result |
|---|---|---|
| 0.3 finiteness bound | Aranés's explicit bound for `d = 43`: `|µ| ≤ 2 B_max D M/√3 ≈ 21436`; actual largest face size `|µ| = 3`, `|c|² = 9`. The README's "far below" holds. | Sound. |
| 0.3 termination criterion, hypothesis | `d = 19`, unit hemispheres only: centre of `S_{2,1+ω}` at distance² `5/4 > 1` from `𝓞_K`, not covered; row spacing `√19/2 = 2.18 > 2`, so no two rows meet; no vertex. Criterion inapplicable, floor incomplete (`|c|² = 4` faces missing). | Sound: the covering hypothesis is needed. |
| 9.4 Check 1 (`d ≡ 3 mod 4`, `d ≥ 19`) | Centre `(−3/4, −√d/4)`; distance² to `−1` and `−ω` both `(1 + d)/16 = 1.25, 2.75, 4.25, 10.25` for `d = 19, 43, 67, 163`, all `> 1`; floor² at the centre `0.25 = 1/4` in all four, carried by `c = ±2`; best competitor `d = 19`: `0.150 = 3/20` by `(ω, −3 + ω)`, `|c|² = 5`. | Sound. |
| 9.4 `d = 19` | Sizes: `4` margin `0.100`; `5` (`c = ω`, 4 residues) supremum `5.6e−17`; `7` (`c = 1 + ω`) supremum `−4.5e−14`. Face set `{1, 4}`. | Sound. |
| 9.4 `d = 43` | Centre `(−5/6, −√43/6)` of `S_{3,2+ω}`: floor² `0.111111 = 1/9`, competitor `0.080808 = 8/99` by `(ω, 4 − ω)`, `|c|² = 11`; `9` margin `0.051`; `11`, `13`, `16` suprema `8e−17`, `1e−16`, `−2e−17`. Face set `{1, 4, 9}`. | Sound. |
| 9.4 `d = 67` | `S_{4,2+ω}`: `1/16 = 0.0625` vs `0.049342` (`|c|² = 19`); `S_{3−ω,5}`: `1/23 = 0.043478` vs `0.038043` (`|c|² = 16`); `16` margin `0.0197`, `23` margin `0.0087`; `17`, `19` suprema `8e−17`, `4e−17`. Face set `{1, 4, 9, 16, 23}`. | Sound. |
| 9.4 `d = 163` | Centres of `S_{2,1+ω}, S_{3,2+ω}, S_{4,2+ω}, S_{5,3+2ω}, S_{6,3+ω}`: floor² `1/4, 1/9, 1/16, 1/25, 1/36`; competitors `0.0183, 0.0217, 0.0218, 0.0205, 0.0207`, all `< 0.022`; sizes `41` and `49` carry faces (margins `0.0028`, `0.0062`). Primitivity: `N(3 + 2ω) = 179`, `N(3 + ω) = 53`, primes. | Sound. |
| 9.4 face criterion (R01) | `ℚ(i)`, `(1+i, −i)`: floor² at centre `0.5 = 1/|c|²`, competitor `0.5` (unit at `i`), supremum `0.0`; `ℚ(√−2)`, `(2, −1−√−2)`: `0.25 = 0.25`, supremum `−5.6e−16`; `ℚ(√−11)`, `(2, 1+ω)`: apex on the edge of the units at `−1`, `−ω`, heights `1/4 − t²` on both. Sufficiency fails. | Finding R01. |
| 9.5 covolumes | Carried from ~4: `G/3 = 0.30532`, `√3 L(2,χ₋₃)/8 = 0.169157`, indices 60 and 168. | Carried. |
| 0.1, 0.4, 0.5, 1.2–1.5, 2.1, 2.4, 2.5, 2.7, 3.1, 3.5, 4.1–4.7, 5.2, 5.3, 5.5, 5.6, 5.8, 6.1–6.6, 7.3, 7.5, 7.7, 8.1, 8.3, 8.4, 8.6, 9.1, 9.3, 9.4 Euclidean floors; `Suggested.lean` declarations | Untouched by the diff; values as computed in ~3 (cusp counts 3/4/3, `dim E_k = (k−1)²`, Casselman `max(0, r − c + 1)`, Atkin–Lehner signs, period `16π²I(1)/(w_K|d|)`, inert `a_𝔭 = a_p² − 2χ(p)p`, Vogtmann's list, floor heights² `1/2, 2/3, 3/7, 1/4, 2/11`). | Carried. |

### Suppliers, direction and gate

The changed passages cite only Kleinian-groups Layer 2 (face-pairing criterion) and Layer 4 (covolumes), both present at the head of that roadmap's open pull request (its Layer 2 deliverables list `isFundamentalDomain_of_facePairing` with the covering and disjointness hypotheses as separate named hypotheses; Layer 4 lists `covolume_bianchiGaussian`, `covolume_bianchiEisenstein`). The dependency check on this head:

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The gate with the candidate merge order:

```text
gate BianchiModularForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Without the order flag the same gate stops at `depcheck: NOT IN ORDER: BianchiModularForms`, because main's order does not list the roadmap yet; the brief places it after its last supplier, so this is not a finding. `scratch/overlaps.md`: no open pull request changes this roadmap, drops an id it cites, or alone defines one.

### Lean acceptance test

`Suggested.lean` is byte-identical to the file the previous two reviews read. `lake env lean TauCetiRoadmap/BianchiModularForms/Suggested.lean` from the worktree: exit 0, output exactly the two `declaration uses sorry` warnings at lines 140 and 160. The elaborated signatures (`scratch/signatures.md`, ten declarations) are unchanged: the four "dropped" `[NumberField K]` binders belong to `cusps`, `cuspidalHom`, `cuspidalH1` and `sl2Image`, whose types do not mention the instance; both theorems carry `NumberField`, `IsTotallyComplex`, `Fact (finrank ℚ K = 2)` and the nonzero-ideal hypotheses. The one-tactic probes of ~3 (both theorems resist `simp`, `rfl`, `infer_instance`) stand. Headline inventory unchanged: two headlines stated (§1.2 boundary dimension, §9.3 vanishing list), the rest named in the module docstring with their missing carriers.

### Sources

| Target | Located text |
|---|---|
| §0.3 finiteness | `rahm2010thesis line 664` (Theorem 6, printed p.19); `aranes2010thesis line 3232–3233` (Theorem 3.2.18 with the EGM 7.3.8 and Swan 3.13 citations); Swan §8 bound at `aranes2010thesis line 3333–3370` (Remark 3.2.24). |
| §0.3, §9.4 termination criterion | `rahm2010thesis line 752–755` (Theorem 12, printed p.21; collection defined at line 747–749); `aranes2010thesis line 3378–3384` (Proposition 3.2.25, printed p.76, proof citing Swan Proposition 8.4). |
| §9.4 face lists | Computed (table above); Aranés's `|µ| = 3` for `d = 43` (line 3369) agrees with the face set `{1, 4, 9}`. |
| §9.5 | KleinianGroups Layer 4 at its open head, as in ~4. |

Remarks on untouched text, no change requested: the previous report's two remarks (Layer 9 Dependencies and the supplier contract still list Kleinian-groups Layer 3, consumed only transitively through Layer 4) stand. Ownership against open pull requests was checked for the overlap list and the Kleinian-groups roadmap only; the by-object search of ~3 for the Bianchi carriers was not redone.

## Not verifiable

- **Swan 1971** (Adv. Math. 6): recorded `uncertified` in the manifest; Theorem 3.13, §8 and Proposition 8.4 were verified only through Aranés's and Rahm's restatements, which cite them by those numbers.
- **Elstrodt–Grunewald–Mennicke, Chapter 7, Theorem 3.8**: the book is not in the cache; the locator is the one Aranés gives for the same theorem (`aranes2010thesis line 3233`).
- **Bianchi 1892, Harder 1987, Weil, Bygott 1998, Lingham 2005, the LMFDB knowls**: as in the previous reports; the diff touches none of the passages that cite them.

## Source issues

- none

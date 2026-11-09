# GATE-EllipticModularityEffectiveComparisons~13: answers to the human review of `ba802e5`

This answers one review: CBirkbeck, 2026-11-09T19:11:46Z (the incremental re-review of `ba802e5`). It makes five points, numbered here H01–H05:
- H01 is its one finding, F01. Its "Previous findings" entry R01 restates F01.
- H02–H04 are its three "Remarks, not findings", in order.
- H05 is its "Source issues" entry.

Its "Not verifiable" entries ask for nothing. The README locates the seven j-values at lemos-2017 lines 197–202 and does not cite the table that lemos-2017 calls [6, p.98]. The Kenku keys stay settled as uncertified. The review was read as data. It contains no instruction beyond its findings, and nothing suspicious was found in it or in any other file read.

The repairs are one commit on top of `ba802e5`: `b26ab9f` ("EllipticModularityEffectiveComparisons: review repairs (X_s⁺(p), X₀⁺(p²), Y₀(p) defined at first use via ModularCurvesPartII)"). It changes 13 lines of `TauCetiRoadmap/EllipticModularityEffectiveComparisons/README.md` and is not pushed. `Suggested.lean` is byte-identical to `ba802e5`.

## H01 (CBirkbeck) — answered

The finding is correct, and no edit inside this folder can repair it. Closing #1810 or closing #1491 is a human decision. All facts in F01 hold at the sibling's current head `504db2f`, which the open-PR index now also lists. The only change since GATE~12's `ac022ff9` is one README line in the sibling's §2.2.

The facts, checked at `504db2f`:
- The sibling's README line 7 still says that Part II "owns the six comparison layers below".
- Its line 587 (§5.0a, heading at line 559) proves that degrees 19, 43, 67 and 163 force geometric CM.
- Its line 778 is the heading of §6.0f, which cites Bilu–Parent–Rebolledo.
- `NonCM` (its `Suggested.lean` line 198) and `HasCyclicIsogeny` (its line 206) are token for token `GeometricallyNonCM` (line 215 here) and `CyclicIsogenyDegree` (line 158 here).
- `noncm_prime_isogeny_degrees` (its line 219) and `rational_isogeny_j_tables` (its line 257) have the same bodies as `non_cm_prime_isogeny_degrees` (line 252 here) and `isogeny_j_tables_11_17_37` (line 286 here).
- In `ORDER.txt` the sibling is on line 275 and this folder on line 285.
- ErdosProgressionPowers (`3e1048c`) names the sibling on 17 README lines and this folder on none.

**Content that exists only here** and would have to move into the sibling under option 1:
- The four exceptional j-values: `grep` for 884736, 5280 and 640320 finds 0 matches in the sibling's README and `Suggested.lean`.
- The finer decompositions that F01 lists.

**If #1810 closes**, three downstream-consumer lists still name this folder. Each is a list of consumers, not a supply edge:
- ModularSymbolsPadicLFunctions README line 2695;
- FaltingsFinitenessAndIsogenyTheorems README line 2928;
- ImaginaryQuadraticClassNumber README line 205.

## H02 (CBirkbeck) — applied

The remark is right that GATE~12 was wrong to say Y₀(r) first appears at line 1184. Line 86 uses Y₀(p)(K) first. X_s⁺(p) was used at line 1261 without saying which curve is meant, and the literature does not use that symbol consistently (ModularCurvesPartII §9.6's citation dictionary records an author whose `X_s` is this `X_s⁺`). So each notation is now defined at its first use by the supplier section that defines the curve.

The edits:
- **Line 86.** "b=x₁∈Y₀(p)(K)." → "b=x₁∈Y₀(p)(K), where Y₀(p)=C−D is the complement of the two cusps."
- **Line 1261.** New sentence: X_s⁺(p) is the curve of ModularCurvesPartII §9.6 for the normalizer C_s⁺(p) of the diagonal Cartan subgroup of GL₂(𝔽_p). Its noncuspidal ℚ̄-points are the elliptic curves with an unordered pair of distinct order-p subgroups. This is bilu-parent-split's X_split(p), lines 25–28.
- **Line 1289.** "X0^+(p²)" → "X₀⁺(p²)", with a new sentence: X₀⁺(p²)=X₀(p²)/⟨w_(p²)⟩ is the quotient of ModularCurvesPartII §9.8, isomorphic over ℚ to X_s⁺(p) by that roadmap's §9.5 (bilu-parent-rebolledo line 165).
- **Lines 1291, 1331, 1357 and 1361.** The ASCII `X0^+` and `Xsplit` in §§5.4–5.7 became X₀⁺(p²) and X_s⁺(p) (X_split(p) inside the source locator at line 1357). `10^7` became 10⁷, and "Theorem1.1" became "Theorem 1.1".
- **Needs lines.** ModularCurvesPartII §9.8 (with §9.5 at line 1297) was added to the Needs of §§5.4, 5.5, 5.6 and 5.7 (lines 1297, 1339, 1353, 1369) and to the Layer 5 Dependencies (line 1703).
- **Supplier contract, line 78.** "§§9.5–9.7" → "§§9.5–9.8 …, and the Atkin–Lehner quotients X₀⁺(N)=X₀(N)/⟨w_N⟩".

Y₀(p²) at line 1305 follows the convention of line 86 and is unchanged.

## H03 (CBirkbeck) — answered

The pull-request description is outside this job's files. At `b26ab9f`, `Suggested.lean` declares 17 theorems and 10 definitions, so the description should say seventeen and ten, not "fourteen" and "nine":
- the definitions are 7 `def`, 2 `abbrev` (`newDimension`, `GeometricTorsion`) and 1 `instance` (`torsionModule`);
- the theorems are the 17 `sorry` warnings at lines 83, 88, 97, 108, 122, 139, 186, 192, 198, 205, 243, 252, 259, 267, 277, 286 and 298.

## H04 (CBirkbeck) — answered

`design/plan.json` is outside this job. It still contains `"all-embedding-frobenius"`, but README.md and Suggested.lean contain it 0 times. The README uses seven gap slugs, plan.json's eight without that one, so the intake withdraws that entry:
- chen-winding-comparison;
- mixed-cusp-charts;
- modular-rank-zero;
- optimized-elliptic-weight-two;
- positive-characteristic-support;
- quantitative-abelian-periods;
- weight-two-local-reduction.

## H05 (CBirkbeck) — answered

The misprint does not reach the roadmap, so nothing changes. The README uses h(j)=log max(1,|j|) at both places it states an integral height: line 1275 (§5.3c) and the §5.3b Check at line 1268, which evaluates j=0 to 0. It never writes log|j|. The two formulas differ only at j=0: a nonzero imaginary quadratic integer has norm |j|²≥1, so |j|≥1.

## Build, gate and dependency check

- **Build.** `lake build TauCetiRoadmap.EllipticModularityEffectiveComparisons.Suggested` reports "Build completed successfully (9205 jobs)". The only warnings are the 17 "declaration uses `sorry`" warnings at the lines listed under H03.
- **Gate** at `b26ab9f`:

      gate EllipticModularityEffectiveComparisons: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

- **Dependency check** (`--depcheck … --movable`, board order, content checkout at `3090489`):

      depcheck: 235 roadmaps, 2262 edges, 0 problem(s)

  It prints no UPWARD, CYCLE or `moved:` line. ModularCurvesPartII, the only supplier the new text cites, is on line 71 of `ORDER.txt`, against 285 for this folder.
- **`roadmaps resolve`** on the README lists no Lean name found nowhere. The resolver notes that it checked no Lean name outside TauCetiRoadmap, since this host has no pinned Lake packages.
- **Diff scope.** `git diff ba802e5 --stat` touches only the README (13 lines).

## Lean signatures

`git diff ba802e5 -- …/Suggested.lean` is empty, so the worker's `signatures.md` is current: 27 declarations, none with a dropped section binder. The file has no `variable`, `include` or `set_option`. No new `#check` file was elaborated, because no declaration changed.

## Ownership, citations and sources

- **New citations.** The new text cites only ModularCurvesPartII §§9.5, 9.6 and 9.8, at the head of #913 (`07e21ad`). Their headings there are:
  - §9.5, "The split Cartan normalizer quotient": X₀(ℓ²)/⟨w_(ℓ²)⟩≃X_s⁺(ℓ) over ℚ for every prime ℓ;
  - §9.6, "Cartan modular curves": X_s⁺(ℓ)=X_{C_s⁺(ℓ)}, with C_s⁺(ℓ) the normalizer of the diagonal Cartan for odd ℓ;
  - §9.8, "Atkin–Lehner quotient curves `X₀⁺(N)`": X₀⁺(N)=X₀(N)/⟨w_N⟩ for N≥2.
- **Ownership.** No target or object was added. The curves belong to ModularCurvesPartII, which is cited and is earlier in the order. No notion moved down, and no later roadmap is cited.
- **Ownership against the open pull requests** was checked for F01's objects at the sibling's head `504db2f`, and with `roadmaps grep --fixed --readme-only 'EllipticModularityEffectiveComparisons'`. The only second owner is the sibling. `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id that only an open revision defines.
- **Sources.** No new source. The H02 wording rests on lines of existing manifest keys: bilu-parent-split lines 25–28, and bilu-parent-rebolledo lines 104, 165 and 626. `needs-references.toml` was not written.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Line 86: Y₀(p)=C−D, the complement of the two cusps | p=23; composite N=4 as a control | cusps of X₀(N) number Σ_(d∣N) φ(gcd(d,N/d)): 1+1=2 at p=23, both rational, so C−D=Y₀(23); at N=4, 1+1+1=3, so "two cusps" needs p prime, which §5.4a assumes (p>11) | holds at prime level | gloss |
| Line 1261: X_s⁺(p) = curve of C_s⁺(p), noncuspidal ℚ̄-points = curves with an unordered pair of distinct order-p subgroups | p=11, 17; the ordered X_s(p) as the wrong model; p=2 | index of C_s⁺(p) in GL₂(𝔽_p) is (p²−1)(p²−p)/(2(p−1)²)=p(p+1)/2. At 11: 13200/200=66=C(12,2) pairs of lines. At 17: 78336/512=153=C(18,2). The ordered X_s(11) has degree 132, which "unordered" excludes. At p=2 the normalizer differs from the monomial group, but the hypothesis p=11 or p≥17 excludes 2 | the gloss determines the curve; agrees with bilu-parent-split lines 25–28 | gloss |
| Line 1289: X₀⁺(p²)=X₀(p²)/⟨w_(p²)⟩ ≅ X_s⁺(p) over ℚ | p=11, 17; threshold 1.4·10⁷ | ψ(p²)=p(p+1)=132 at 11 and 306 at 17, twice the j-degrees 66 and 153 of X_s⁺(p), as a degree-2 quotient must be. 1.4·10⁷=14000000, equal to the §5.6 Check cutoff. The statement matches bilu-parent-rebolledo line 626, and the identification matches line 165 | consistent | gloss, Unicode |
| Lines 1291, 1331, 1357, 1361: notation only | — | same sets as before; Theorem 1.1 at bilu-parent-rebolledo line 104 reads p>11, p≠13, r>1, as §5.7 states | unchanged mathematics | notation |
| Lines 78, 1297, 1339, 1353, 1369, 1703: §9.8 (and §9.5) added to the contract and Needs | headings at #913 `07e21ad`; ORDER lines | §9.8 is stated for N≥2, and N=p²≥121 here; ModularCurvesPartII is on line 71, this folder on 285; depcheck reports 0 problems | correct and downward | citation |
| H01: sibling at `504db2f` | `git diff ac022ff9 504db2f` on the sibling; the declarations F01 names | 1 README line changed in the sibling's §2.2. The bodies at its lines 198, 206, 219 and 257 equal those at lines 215, 158, 252 and 286 here. The seven j-values are equal on both sides: −24729001, −32768, −121, −297756989/2, −882216989/131072, −162677523113838677, −9317. The j-values −96³, −960³, −5280³, −640320³ appear 0 times in the sibling | duplicate stands | none (decision) |
| H03: declaration counts | `Suggested.lean` at `b26ab9f` | 17 `theorem`; 7 `def` + 2 `abbrev` + 1 `instance` = 10 | description outdated | none (outside job) |
| H05: integral height | j=0; nonzero imaginary quadratic integer | log max(1,0)=0, while log 0 is undefined; N(j)=|j|²≥1 gives log max(1,|j|)=log|j| for j≠0 | README formula correct at lines 1268 and 1275 | none |

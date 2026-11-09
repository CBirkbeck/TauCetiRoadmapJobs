# Review of GroupSchemesOverABase (pull request #1522 at 71b006e)

**Verdict:** needs changes

This is an incremental re-review of the 27 lines changed since 6417bcc. They are the consumer bullets under "Downstream consumers" and the sentence after them that resolves identifiers (README lines 1435–1462). Nothing outside the folder changed: `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GroupSchemesOverABase'` is empty. `Suggested.lean` has not changed since 9265182.

The previous R01 is settled on the other side. PurityForFlatCohomology now cites 0.1, 1.1–1.5, 2.1–2.3 and 2.7 here as its supplier, but the bullet that describes it still does not say so (R04).

The three new consumer bullets are false at the heads of the roadmaps they name. Each of those roadmaps took the material back after this head was committed and now owns it itself. So three objects each have two owners: `π₀(G/k)`, Cartier's theorem and the Picard group of a reductive group over a field (R01–R03).

- R01 can be repaired in this folder. The repair was tested.
- R02 and R03 also need a human decision. The project's dropped-names list still names this roadmap, and that list is why the later roadmaps stopped citing it.

## R01 (P2) — `π₀(G/k)` has two owners, and the NeronModels bullet is false

**Location.**
- `TauCetiRoadmap/GroupSchemesOverABase/README.md` lines 1446–1449: "NeronModelsAndSemistableAbelianVarieties consumes 0.2, 4.6 and 4.8 (… `π₀(G/k)`) … and names 4.2, as GS4.2, as the owner of Chevalley's theorem for noncommutative groups".
- 4.8, lines 961–998.

**Claim.** NeronModels takes 0.2, 4.6 and 4.8 from here and names 4.2 as GS4.2.

**Witness.** #852 (861f8ce), `README.md`:
- lines 42–45 and its 2.2 (line 1244) own `π₀(G/k)` for every finite-type group over a field;
- line 47 leaves noncommutative Chevalley unstated;
- "GroupSchemesOverABase" and "GS4.2" occur 0 times.

**The duplication.** For `G` of finite type over `k`, 4.8 here and 2.2 at #852 state the same things:
- the same étale `k`-group;
- the same faithfully flat projection with kernel `G⁰`;
- the same points over `k_s`;
- the same compatibility with extensions of `k`;
- the same comparison with Tau Ceti's `TauCeti.FiniteTypeCommHopfAlgCat.componentGroupScheme` and with ReductiveGroups Layer 3.

On `μ₃/ℚ`, `μ_p/𝔽_p` and `𝔾_m ⋊ ℤ/2`, both give `μ₃`, `1` and `ℤ/2` (table, row 46). #852's commit f2f4bf5 (13:43 UTC, after this head) built its 2.1–2.2 without this roadmap. NeronModels is #66 in the candidate order and this roadmap is #67, so NeronModels owns the object. It is already a supplier here: its 2.3 is used for 4.2.

**Repair.**
- Delete the NeronModels bullet (lines 1446–1449). In line 1460, delete "GS4.2 is 4.2;": no roadmap uses GS4.2 any more.
- In 4.8:
  - Cite NeronModelsAndSemistableAbelianVarieties 2.2 for `π₀(G/k)` of a group of finite type.
  - Delete the sentences that restate it: the points over `k_s`, the compatibility with extensions of `k`, the `TauCeti.FiniteEtaleScheme.galoisEquivalenceGrp` description, and the affine comparisons with ReductiveGroups Layer 3 and Tau Ceti.
  - Keep what 2.2 does not state: groups locally of finite type, the universal property among homomorphisms to étale `k`-groups, the comparison with 4.7, and compatibility with products.
  - Add "NeronModelsAndSemistableAbelianVarieties 2.2" to 4.8's *Needs:* (line 983).
- Elsewhere in the README:
  - Add 2.2, for 4.8, to the **From NeronModelsAndSemistableAbelianVarieties** contract (line 256) and to Layer 4's Dependencies (line 1060).
  - Under **Left to other roadmaps**, add one line: NeronModelsAndSemistableAbelianVarieties 2.2 owns `π₀(G/k)` for groups of finite type over a field, and 4.8 extends it to groups locally of finite type.
- Leave `exists_componentGroup` as it is. It assumes only `LocallyOfFiniteType`, so it states the extension.

**Tested.** A scratch copy of the README with exactly these edits, plus the deletions of R02 and R03, was run through the dependency check with `--movable`. It gives "236 roadmaps, 2269 edges, 0 problem(s)", with no `moved:` line.

## R02 (P2) — Cartier's theorem has two owners, and the EllipticCurveModularityPartII bullet is false

**Location.** README lines 1437–1439: "EllipticCurveModularityPartII (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 4.5, Cartier's theorem `smooth_of_charZero`, for the intersection of two abelian subvarieties." The theorem is 4.5 at README line 851 and `Suggested.lean` line 301.

**Claim.** EllipticCurveModularityPartII consumes `smooth_of_charZero` through a contract with this roadmap.

**Witness.** #1491 (cd7c37d), `README.md`:
- line 11: §6.0f owns Cartier's theorem for groups locally of finite type in characteristic zero;
- line 784 states it without affineness;
- "GroupSchemesOverABase" occurs 0 times;
- commit 41d3851: "Cartier owned in §6.0f again".

**The duplication.** Line 784 there has the same statement as `smooth_of_charZero`. Its hypotheses are a field of characteristic `0`, a group object over `Spec k` and `LocallyOfFiniteType`, and its conclusion is `Smooth`. Its route is the one 4.5 gives: the differentials are free, then the Jacobian criterion applies (table, row 44).

This roadmap is #67 in the candidate order and EllipticCurveModularityPartII is #276. So this roadmap is the owner, and §6.0f should cite 4.5.

#1491 cannot cite it. The project's dropped-names list (the `dropped_names_file` of the roadmap tool's configuration) still names GroupSchemesOverABase, and the gate refuses any mention of a listed name. This is the same list as in last round's R01.

**Repair.**
- **In this folder.** Delete lines 1437–1439.
- **For a single owner, a human must decide.**
  - Either remove GroupSchemesOverABase from the dropped-names list. Then §6.0f cites 4.5, and the bullet can come back.
  - Or keep the list and make §6.0f the owner. Then this roadmap cannot keep 4.5's Cartier statement without citing #276. 7.5 uses that statement, so this roadmap would move behind #276 in the merge order.

**Tested.** `roadmaps grep 'GroupSchemesOverABase'` covers main and the 456 open heads. It matches only FlagVarieties on main and #1676, #1828 and #1840; it finds nothing in #1491.

## R03 (P2) — The Picard group of a reductive group over a field has two owners, and the HeightsRationalPointsAndObstructions bullet is false

**Location.**
- README lines 1443–1445: "HeightsRationalPointsAndObstructions (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 6.2, as GSOB §6.2, the Picard groups of a connected split reductive group and of its flag variety over a field."
- Line 1460: "GSOB §6.2 is 6.2".

**Claim.** HeightsRationalPointsAndObstructions consumes 6.2 under the name GSOB §6.2.

**Witness.** #1017 (3dc9d71), `README.md`:
- §3.8e, line 1567: "For Pic Ḡ prove the field case here", giving `Pic Ḡ ≅ P/X*(T_der)`;
- commit: "own field-case reductive Picard groups in §3.8e";
- "GroupSchemesOverABase" and "GSOB" occur 0 times.

**The duplication.** Over an algebraically closed field every connected reductive group is split. There, §3.8e's exact sequence and its Checks (line 1576) agree with 6.2's value by value:
- `Pic SL₂ = 0`;
- `Pic PGL₂ = ℤ/2`, the weight lattice modulo the root lattice;
- `Pic GL_n = 0`, with kernel `ℤ·det`;
- `Pic = 0` for a torus.

See table, row 45. This roadmap is #67 and HeightsRationalPointsAndObstructions is #142. So this roadmap is the owner, and §3.8e should cite 6.2 for the reductive quotient. The dropped-names list refuses that citation, as in R02.

**Repair.**
- **In this folder.** Delete lines 1443–1445, and delete "GSOB §6.2 is 6.2;" from line 1460.
- **For a single owner,** the same human decision as R02. If the list changes, §3.8e cites 6.2 for `Ḡ_red`. It then keeps only the reduction along the unipotent radical and the product with `X̄`, which 6.2 does not state.

## R04 (P3) — The PurityForFlatCohomology bullet does not say that Purity consumes these sections

Previous R01, partly repaired.

**Location.** README lines 1450–1455: "PurityForFlatCohomology §§7.12a–7.12e treat, for its purity results, the material of 0.1, 1.1–1.5, 2.1–2.3 and 2.7 here, at the same generality: …".

**Claim.** Purity's sections treat the same material at the same generality. Under "Downstream consumers" this reads as a second treatment, not a consumption.

**Witness.** #1840 (96339c0), `README.md`:
- lines 128–133 give these objects to "GroupSchemesOverABase §§0.1, 1.1–1.5, 2.1–2.3, 2.7", which §§7.12a–7.12e "cite … section by section";
- its contract *From TauCetiRoadmap.GroupSchemesOverABase* is at line 538.

**Repair.** Replace the bullet by: "PurityForFlatCohomology (its contract *From TauCetiRoadmap.GroupSchemesOverABase*) consumes 0.1, 1.1–1.5, 2.1–2.3 and 2.7 for its purity results. Its §§7.12a–7.12e prove only that the points of `D_S(ℤ)` and `D_S(ℤ/n)` and the Kummer sequence match Tau Ceti's sheaves `𝔾_m` and `μ_n`, and that finite groups of multiplicative type are finite locally free."

The dropped-names list refuses #1840's contract too. If the list stays as it is, #1840 has to drop the contract again, and last round's two-owner finding returns. That is the same decision as in R02 and R03.

## Previous findings

- R01 — partly repaired: "PurityForFlatCohomology §§7.12a–7.12e treat, for its purity results, the material of 0.1, 1.1–1.5, 2.1–2.3 and 2.7 here, at the same generality". At #1840 (96339c0) Purity cites these sections, so there is one owner. 1.5 is now included. The bullet still does not say that Purity consumes them (R04).

## Verified sound

### Gate, build, dependency check, elaboration

- **Worker's gate** (`scratch/gate.md`): every counter is `0`, and the result is `OK`.
- **My rerun with the configured order.** It gives `depcheck: NOT IN ORDER: GroupSchemesOverABase`. This is expected: the roadmap is on the dropped-names list and is absent from the configured order, and this review places it by the candidate merge order.
- **My rerun with `--order` set to the candidate order, and `--build`.** Every counter is `0`, including `build=0`, `depcheck=0`, `dropped=0` and `outside-folder=0`, and the result is `OK`.
- **Dependency check** (the brief's command, with `--movable`): `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** I ran `lake env lean` on `Suggested.lean` with `#check @…` appended for all 33 declarations.
  - It exits 0 with exactly 25 `declaration uses 'sorry'` warnings, at lines 82, 115, 121, 128, 135, 142, 178, 195, 209, 225, 233, 243, 261, 273, 280, 285, 292, 301, 308, 317, 326, 334, 346, 361 and 377, and nothing else.
  - All 33 types print. They match `scratch/signatures.md`, and every binder is in its declaration's own signature.
  - The two statements the findings touch:
    - `smooth_of_charZero : ∀ (k) [Field k] [CharZero k] (G : Grp (Over (Spec ↧k))) [LocallyOfFiniteType G.X.hom], Smooth G.X.hom` (README 4.5).
    - `exists_componentGroup` assumes only `[LocallyOfFiniteType G.X.hom]` (README 4.8, groups locally of finite type).
- **Headlines and padding.** `Suggested.lean` is unchanged. The headline list (0.2, 1.2–1.4, 2.2, 2.5, 2.6, 3.1–3.3, 4.2, 4.3, 4.5–4.9, with the docstring naming the carriers the others lack) still holds, and so does the earlier one-tactic probe: all 25 theorems resist it.

### The changed passage, resolved

- **The ids the bullets name exist here.** 0.1 (line 286), 0.2 (304), 1.1–1.5 (337, 358, 373, 389, 413), 2.1–2.3 (453, 489, 501), 2.7 (592), 4.2 (767), 4.5 (817; `smooth_of_charZero` at 851), 4.6 (893), 4.8 (961), 6.2 (1217). 6.2 states what the Heights bullet says it does.
- **Consumer heads.**

  | Pull request | Head | Mentions of this roadmap |
  | --- | --- | --- |
  | #1491 EllipticCurveModularityPartII | cd7c37d (14:21 UTC) | 0 |
  | #1017 HeightsRationalPointsAndObstructions | 3dc9d71 (13:36) | 0 |
  | #852 NeronModelsAndSemistableAbelianVarieties | 861f8ce (15:12) | 0 |
  | #1840 PurityForFlatCohomology | 96339c0 (12:37) | 44 lines |

  This head is from 13:21 UTC. #1840 has the contract at line 538 and §§7.12a–7.12e at lines 2462, 2500, 2528, 2564 and 2591. Their *Needs:* lines name §§0.1, 1.1, 1.3, 1.4, 2.1–2.3 and 2.7 here, and their text names 1.2 and 1.5.
- **The identifiers the last sentence resolves.**
  - GS7 is used by FlagVarieties on main (`README.md` line 19, "GroupSchemesOverABase GS7 owns relative `Bor(G)`"), and the resolution is right.
  - GS4.2 and GSOB occur nowhere (R01, R03).
- **ReductiveGroups ids at #1676 (69572c3).** The ids this roadmap cites resolve there: §8.1 (line 2799), §8.2 (2823), 9B (3310), Layer 9D (3608) and the bullet *Relative reductive groups over an arbitrary affine base* (3621). The pull-request description names #1676.
- **Overlaps** (`scratch/overlaps.md`). No other open pull request changes this roadmap, and no cited id is dropped. The ReductiveGroups ids are those above.

### The seeded sample where it falls in the change

- **0.1:** no source locator. Its Mathlib names (`Functor.mapGrp`, `Over.pullback`, `AlgebraicGeometry.hopfSpec`) were resolved last round, and the pins are unchanged (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`).
- **1.1:** SGA 3, Exp. VIII, 2.1, in the Gille–Polo text of Exp. VIII held in the sources cache, lines 273–280:
  - a) `D(M_S)` is faithfully flat and affine;
  - b) `M` is finitely generated iff `D(M_S)` is of finite type iff it is of finite presentation;
  - d) `M = 0` iff it is the unit group.

  This supports 1.1 and its first Check.
- **2.7:** sga3-9 lines 184–197 (IX 2.7 with N.D.E. 5) and 245–252 (IX 2.11), as last round.
- **4.2:** conrad-chevalley line 8 ("algebraic group" means connected and smooth) and lines 81–86 (Thm 1.1: over a perfect field, a unique normal linear subgroup with abelian-variety quotient, whose formation commutes with perfect extensions). 4.2 is supported as written.
- **4.5, named by R02:** sga3-6b lines 300–319.
  - VI_B 1.6: over a base of characteristic `0`, a locally free `ω_{G/S}` gives smoothness along the unit section, by EGA IV₄ 16.12.2 and 17.12.5.
  - 1.6.1 (Cartier): a group locally of finite type over a field of characteristic `0` is smooth.
  - Spreading from the unit section uses VI_B 1.3.1 (lines 137–141).
- **The rest of the sample** (2.6, 3.1, 3.2, 3.4, 3.5, 4.3, 5.3, 5.5, 6.1, 7.2, 7.6) lies outside the change. Earlier rounds verified these targets.

### Remarks on untouched text (no change requested in this round)

- **ReductiveGroups #1676 cites this roadmap.** At 69572c3, committed after this head, it cites 1.1, 1.2, 2.4, 4.5 and Layers 1–3 here as supplier (its lines 777–787, 1159 and 1238). This roadmap consumes its Layers 2, 3, 6 and 7, §§8.1–8.2, 9B and Layer 9D.
  - ReductiveGroups is on main, so these are upward edges on #1676's side.
  - There is no cycle at the level of targets: 4.5's three *Needs:* lines name no ReductiveGroups section.
- **AlgebraicModuliForArithmeticGeometry §7.9 overlaps 4.6.** At #853 (d0a9af8), §7.9 constructs the neutral component of a quasi-separated group algebraic space locally of finite type over a field: open, closed, quasi-compact, geometrically irreducible and compatible with field extension. That is 4.6's first statement. 0.2 cites §7.9, but 4.6 does not.
- **GS8.5 is no longer used.** SpringerResolutionAndCharacteristicCycles (#1828, f8ea4db) now writes "GroupSchemesOverABase §7.6", so "GS8.5 is 7.6" resolves an identifier that no roadmap uses.

### Adversarial table

- Rows 1–41 carry the previous report's values, same numbering. That report is PRREVIEW-GroupSchemesOverABase_r14, which carried them from r13. Every statement they cover is untouched.
- Rows 42–43 are r14's rows 45–46.
- Rows 44–52 were computed this round, for the changed bullets, the sample and the repair.
- r14's rows 42–44 and 47, which concerned the old Purity bullet, are superseded by row 47.

| # | Statement | Instances | Values computed | Result |
| --- | --- | --- | --- | --- |
| 1 | 0.1 `baseChange` (r14) | `f = 𝟙 S`; `D_ℤ(ℤ/2)` to `𝔽₂`; `S′ = ∅` | chosen pullback, iso not equal; `𝔽₂[t]/(t² − 1) = 𝔽₂[t]/(t − 1)²`; `End(𝔾_m)` goes `ℤ → {∗}` | ok |
| 2 | 0.2 `exists_identityComponent` (r14) | `𝔾_m/ℤ_p`; `Spec(O × K)`; `μ₂/ℤ` | `G⁰ = G`; RGPartII excludes the disconnected generic fibre; `μ₂` not smooth, union of identity components not open | ok |
| 3 | 1.1 Checks (r14) | `D_S(0)`; `D(ℤ)`; `D_ℤ(ℤ/2)` at `3`, `2` | `S`; `O_S[t^{±1}]`; two reduced points; `(t−1)²` | ok |
| 4 | 1.2 `bijective_diagonalizableMap` (r14) | connected `S`; `Spec(k × k)`; `∅`; `Hom(μ₂, 𝔾_m)` | `ℤ`; `ℤ²`; one map vs many `φ`; `ℤ/2` | ok |
| 5 | 1.3 smooth/étale iff (r14) | `ℤ/6` over `ℤ`; `M = ℤ`; `M = 0`; `ℤ/p` over `𝔽_p`; `S = ∅` | smooth over `ℤ[1/6]` only; smooth, never étale; étale; `(t−1)^p`; vacuous | ok |
| 6 | 1.4 kernel, flatness (r14) | `n·id`; `0 → ℤ`; `ℤ → 0`; `φ = 0` | `μ_n`; kernel `𝔾_m`; unit section, not flat (excluded); `𝔾_m` | ok |
| 7 | 1.5 Cartier duality (r14) | `ℤ/n`; `0`; `(ℤ/2)²` | `μ_n` also when `p ∣ n`; trivial; `μ₂ × μ₂` | ok |
| 8 | 1.6 torsors (r14) | `k`, `μ_n`; local ring; `ℤ`, `μ₂` | `k^×/k^{×n}`; `Pic = 0`; `{±1}` | ok |
| 9 | 2.1 bullet 1 (r14) | `D(M) ×_S D(N)` | `O_S[M ⊕ N]` | ok |
| 10 | 2.1 bullet 2 (r14) | `Spec(k × k)`, `𝔾_m ⊔ μ₂` | types `ℤ`, `ℤ/2`, no single `M` | ok |
| 11 | 2.1 bullets 3–4, Check (r14) | `μ_p/𝔽_p`; `𝔾_m × μ₄/ℤ`; a torus | not smooth; `(t−1)⁴` at `2`, smooth over `ℤ[1/2]`; smooth | ok |
| 12 | 2.1 Checks (r14) | `μ_p`; `𝔾_a`; norm-one torus; `M = 0` | multiplicative, not torus; `X* = 0`; `X*(ℝ) = 0`; rank `0` | ok |
| 13 | 2.2 `exists_etale_cover` (r14) | `μ_n/ℤ`; norm-one torus; Kummer at `2` | identity cover; `Spec ℂ`; not étale at `2` | ok |
| 14 | 2.5 `isotrivial` (r14) | `Spec(k × k)`, `𝔾_m ⊔ 𝔾_m²`; nodal curve; field | componentwise only; infinite monodromy; X 1.4 | ok |
| 15 | 2.6 `exists_torus_not_isotrivial` (r14) | `n`-cycle; chain; identity gluing; rank `1` | `[[1, n],[0, 1]] ≠ 1`; split; `𝔾_m²`; rank 1 has monodromy `±1` | ok |
| 16 | Linearity paragraph (r14) | norm-one torus; 2.6 torus; `GL_n`; semisimple | embeds in `GL₂`; not linear; linear; linear | ok |
| 17 | 2.7 (r14) | `𝔾_m × μ₂`; `𝔾_m`; `μ_n` | `Hᵗᵒʳ = 𝔾_m`, quotient `μ₂`; `X_* = ℤ`; `Hᵗᵒʳ = 1` | ok |
| 18 | 3.1 (r14) | `k[ε]`, `𝔾_m`; `𝔾_a`; `Spec(k × k)` | `ℤ = ℤ`; `(1 + ε)t` excluded; `(a,b) ↦ a` | ok |
| 19 | 3.2, 3.3 (r14) | `t, t⁻¹`; `Spec(k × k)`; `𝔾_a` char 0; `μ_n` | differ on every fibre; agree on one fibre only; `𝔾_a[n] = 1`; `H[n] = H` | ok |
| 20 | 3.4 Checks (r14) | `Hom(𝔾_m, 𝔾_m)`; `Hom(μ_n, 𝔾_m)`; `Hom(𝔾_m, GL₂)` | `ℤ_S`; `(ℤ/n)_S`; infinitely many components | ok |
| 21 | 3.5 Checks (r14) | diagonal torus; `±1`; `μ_p ⊂ SL_p` | `N/Z = ℤ/2`; `Z = GL₂`; `Z = SL_p` | ok |
| 22 | 3.6 transporter Check (r14) | `u = diag(t, 1)`, `K = diag(1, s)` | antidiagonal, misses `1` | ok |
| 23 | 4.1 Checks (r14) | `GL_n/B`; `𝔾_m/μ_n`; `G/G`, `G/e` | dim `n(n−1)/2`; `t ↦ tⁿ`; `Spec k`, `G` | ok |
| 24 | 4.2 `chevalley` (r14) | `A`; `A × 𝔾_m`; `A[2] × 𝔾_m` | `L = 1`; `L = 𝔾_m`; `2^{2g}` components | ok |
| 25 | 4.3 `affinization` (r14) | `(ℤ/2)_k`; `A`-by-`𝔾_a` | `k × k`; `L = 𝔾_a` | ok |
| 26 | 4.4 ranks (r14) | `E`; `𝔾_m`; `𝔾_a`; `GL_n`; `B ⊂ GL₂` | `(1,0,1,0,0)`; `(0,1,1,0,0)`; `(0,0,1,1,0)`; `(0,n,n,0,n²−1)`; `(0,2,2,0,0)` | ok |
| 27 | 4.5 separated, reduced, Cartier (r14) | glued group; `Y^p = tX^p`; `μ₃ ⋊ ℤ/2`; `∏_ℕ 𝔾_a` | not separated; non-reduced; `G_red` not normal; reduced, not smooth | ok |
| 28 | 4.5 `isClosedImmersion_of_mono` (r14) | `ℤ_k → 𝔾_a`; Frobenius; `𝔾_m → 𝔾_m ⋊ ℤ/2` | not qc (excluded); kernel `α_p`; closed | ok |
| 29 | 4.5 route (r14) | `u : H → G` | finite type, separated, proper by VI_B 1.4 | ok |
| 30 | 4.6–4.8 (r14) | `μ₃/ℚ`; `μ_p/𝔽_p`; `𝔾_m ⋊ ℤ/2`; `ℝ[x,y]/(x²+y²)` | `π₀ = μ₃`; `π₀ = 1`; `π₀ = ℤ/2`; `Spec ℝ` | ok |
| 31 | 4.9 Perrin (r14) | `∏_ℕ 𝔾_m`; `ℤ_k`; `∏ GL₂ ⊇ ∏ B` | `G_n = 𝔾_m^n`; `ℤ̂ ≠ ℤ_k`; `∏ ℙ¹` not a scheme | ok |
| 32 | 5.1–5.2 (r14) | `𝔾_m`; `G^{(p)}`; `GL_n` | constant; `ρ_r: 1 → 0`; diagonal torus | ok |
| 33 | 5.3 (r14) | split multiplicative Weierstrass; `G^{(p)}`; Iwahori of `SL₂` | `ρ_ab: 1 → 0`; `1 = 1`; `d_s: 3 → 0` | ok |
| 34 | 5.4 (r14) | `G^{(λ)}`; `𝔾_m × 𝔾_a` | `ρ_r` `1` on `D(λ)`, `0` on `V(λ)`; `(1, 1)` | ok |
| 35 | 5.5 (r14) | supersingular; class `0`; class `ω` | `P = x^p`; `𝔾_a`; `(G_s)_affq = 𝔾_a` | ok |
| 36 | 6.1–6.3 (r14) | `SL₂`; `PGL₂`; `GL_n`; torus | `O(1)`, `Pic(ℙ¹_S) = Pic(S) ⊕ ℤ`; `ℤ/2`; `ℤ^{n−1}`; `Pic(S)` | ok |
| 37 | 7.1–7.2 (r14) | `SL₂`; `PGL₂`; `GL_n` | `ℤ[t + t⁻¹]`; Cor. 6.4; `𝔸^{n−1} × 𝔾_m` | ok |
| 38 | 7.3–7.4 (r14) | `SL₂`; `SL₂ × 𝔾_m` | `{±1}` codim `3`; trace `−c`; `C` of dim `1 < 2` | ok |
| 39 | 7.5 (r14) | char 2 unipotent; `c ≠ ±2`; `c = 2` | `k[a,b]/((a−1)²)`; split iff `c² − 4` square; `μ₂ × 𝔾_a` | ok |
| 40 | 7.6–7.8 (r14) | `SL₂` regular semisimple, regular unipotent, `±1`; torus | `{t, t⁻¹}`; `k[t]/(t−1)²`; `ℙ¹`; `Pic(G̃) = ℤ`, `Pic(G) = 0` | ok |
| 41 | Research context (r14) | `𝔾_m^r`; DVR; ramified `R` | `Pic(R)^r = 0`; case (2); open | ok |
| 42 | 2.3 locators (r14 row 45) | X 5.1, 5.6, 5.7, 5.9 | twisted constant = fpqc-locally `M_S`; Hom representable; anti-equivalence for quasi-isotrivial (5.7), for finite type (5.9) | ok |
| 43 | 2.7 locators (r14 row 46) | IX 2.7, 2.11; X 5.9 | `ker u` and `G/ker u` of multiplicative type, `I → H` closed immersion; subgroups of `D_S(M)` diagonalizable over connected `S` | ok |
| 44 | 4.5 `smooth_of_charZero` vs EllipticCurveModularityPartII §6.0f (#1491 cd7c37d, line 784) | `μ_n/ℚ`; `μ_p/𝔽_p` or `α_p/𝔽_p`; `B₁ ∩ B₂` proper non-affine; `Spec k[T]/(T²)` monoid | both: étale; both exclude it (char `p`), there `α_p` has free `Ω¹` of rank 1 and dimension `0`, here `μ_p` not smooth; both cover it, while Tau Ceti `smooth_of_grpObj_of_charZero` (affine) does not; both need the group law | same statement, two owners (R02) |
| 45 | 6.2 vs HeightsRationalPointsAndObstructions §3.8e (#1017 3dc9d71, lines 1567, 1576) | `SL₂`; `PGL₂`; `GL_n`; torus; over `k̄` | `Pic = 0` both; `ℤϖ/2ℤϖ = ℤ/2` both; `Pic = 0` with kernel `ℤ·det` both; `Pic = 0`, kernel `X*(T)` both; both give `Pic(G) = P/X*(T_der)` from the big cell's boundary divisors `D_α` | same object over `k̄`, two owners (R03) |
| 46 | 4.8 `exists_componentGroup` vs NeronModels 2.2 (#852 861f8ce, line 1244) | `μ₃/ℚ`; `μ_p/𝔽_p`; `𝔾_m ⋊ ℤ/2`; `ℤ_k` | `π₀ = μ₃` (2 points, 3 geometric points) both; `π₀ = 1` both, no smoothness used in either; `ℤ/2` both; here `π₀ = ℤ_k`, outside #852's finite-type hypothesis | finite type duplicated, locally-finite-type case only here (R01) |
| 47 | Purity bullet vs #1840 96339c0 | its lines 128–133, 538; §§7.12a–e | consumes 0.1, 1.1–1.5, 2.1–2.3, 2.7; proves only points of `D_S(ℤ)`, `D_S(ℤ/n)` vs Tau Ceti `Gm`, `mu`, the Kummer sequence, finite multiplicative type ⇒ finite locally free; 0 of these stated here (`Γ(T`, `Scheme.Gm`, `schemePointsMulEquiv`: 0 hits) | one owner; bullet wording (R04) |
| 48 | NeronModels bullet: 0.2, 4.6, GS4.2 | #852 2.1 (line 1197), lines 42–47 | identity component from AlgebraicModuliForArithmeticGeometry §7.9, not 0.2 or 4.6; "Chevalley's theorem for noncommutative groups is not stated"; "GS4.2": 0 hits | false (R01) |
| 49 | Identifier sentence | GS7; GS4.2; GSOB; GS8.5 over main and 456 open heads | 1 (FlagVarieties, main, line 19); 0; 0; 0 (#1828 writes "§7.6") | GS4.2, GSOB unused (R01, R03); GS8.5 remark |
| 50 | 1.1 locator (sample) | SGA 3 VIII 2.1 a), b), d) | faithfully flat, affine; f.g. ⇔ finite type ⇔ finite presentation; `M = 0` ⇔ unit group | ok |
| 51 | 4.2 and 4.5 locators | Conrad Thm 1.1 (conrad-chevalley lines 8, 81–86); VI_B 1.6, 1.6.1 (sga3-6b lines 300–319) | perfect `k`, smooth connected `G`, unique linear normal `H`, perfect base change; char-0 field, locally of finite type ⇒ smooth | ok |
| 52 | R01 repair probe | scratch README: three bullets and two identifiers deleted, 2.2 added to 4.8 *Needs:*, the contract and Layer 4 Dependencies | `depcheck: 236 roadmaps, 2269 edges, 0 problem(s)`, no `moved:` | feasible |

## Not verifiable

- **Sansuc 1981, §6** (6.2's locator, named by R03). The cached `sansuc1981` text is the GDZ landing page, not the article. 6.2 is not in the sample, and I did not fetch it again. Popov 1974, §4, was not read.
- **Carried and untouched:**
  - Demazure–Gabriel, *Groupes algébriques* I: no legal online copy.
  - Slodowy, LNM 815: paywalled.
  - Not read: Jantzen II.1.8 and II.4.4; Humphreys 1.12; Bourbaki, Lie VI §3 no. 4; Milne's CUP print. The 2017 PDF that the README names has the cited numbers.

Ownership was checked against the open roadmap pull requests:
- `roadmaps grep` over main and the 456 open heads;
- `roadmaps show` for #852, #853, #1017 and #1840;
- the sibling checkouts of #1491, #1676, #1828 and #1840, whose heads match the list's.

## Source issues

- none

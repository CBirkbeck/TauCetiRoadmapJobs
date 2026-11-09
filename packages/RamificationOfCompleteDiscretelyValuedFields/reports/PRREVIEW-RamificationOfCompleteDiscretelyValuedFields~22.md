# Review of RamificationOfCompleteDiscretelyValuedFields (pull request #1410 at 1dc3055)

**Verdict:** needs changes

This is an incremental re-review of the 43 README lines that changed since 20db688. They fall in three hunks:
- the summary, lines 15–21;
- the ownership paragraph of the scope section, lines 113–127;
- the downstream-consumers paragraph, lines 1137–1158, where the ClassFieldTheory sentence is deleted.

`Suggested.lean` is byte-identical to 20db688 (`git diff --quiet 20db688 HEAD -- Suggested.lean`), and nothing outside the folder changed.

The README side of the previous R01 is repaired:
- the summary and the scope give the local-field filtration built from the completed roadmap's finite upper groups to ClassFieldTheory Layer 7;
- the scope says why ClassFieldTheory comes first in the order;
- §4a.1 keeps the general valuation-subring filtration and its local-field agreement;
- the claim that ClassFieldTheory consumes §4a.1 is gone.

What remains is in the pull-request description. It still orders this pull request before #1411 on the grounds that #1411 consumes §4a.1, which the README now rules out. It also does not name #1215, the only head where ClassFieldTheory Layer 7 defines the object the README assigns to it. R02 is unchanged. Both findings concern only the description, and no README or Lean change is asked.

Mechanical checks at this head:
- **Gate.** I re-ran it, and every check passes: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. My run printed no build field. The worker's gate at this head reports `build=0`, and my own elaboration also passes.
- **Dependency check of this README.** `depcheck: 239 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 9.4 s. The only output is nine `declaration uses sorry` warnings, at lines 62, 111, 130, 151, 197, 215, 239, 263 and 289.
- **Declared gaps.** None (there is no `design/plan.json`).

## R01 (P3) — The description still makes #1411 a consumer of §4a.1, and does not name #1215

**Location.** In the pull-request description:
- *Merge order*: "#1411 consumes its §4a.1 absolute filtration, so the order is this PR (#1410) → #1411";
- *Why*: "and the ClassFieldTheory amendment #1411 consumes the absolute upper filtration";
- the roadmap-summary block: "ClassFieldTheory needs the absolute upper filtration for reciprocity–filtration compatibilities".

Against these, `TauCetiRoadmap/RamificationOfCompleteDiscretelyValuedFields/README.md` lines 116–118 now read: "is ClassFieldTheory Layer 7's. ClassFieldTheory precedes this roadmap, … both consume it; it takes no input from this roadmap."

**Claim.** Two problems remain.
1. **The description contradicts the README.** The description makes ClassFieldTheory, at #1411, a consumer of §4a.1. The README rules out that edge, and the dependency check flags it as UPWARD.
2. **#1215 is not named.** The README's "ClassFieldTheory Layer 7's" holds only at #1215. On main, ClassFieldTheory Layer 7 (README lines 1312–1432) is the absolute Artin map and conductors, with no upper filtration at all. When a citation is defined only by an open revision, the description's merge-order paragraph must name that revision, and this one does not name #1215.

**Witness.**
- `gate --depcheck` on #1411's ClassFieldTheory README (656f837): `UPWARD: ClassFieldTheory (on main) -> RamificationOfCompleteDiscretelyValuedFields (#2) at README lines [507, 538, 1435, 1488]`, 1 problem. On #1215's (024927f): `0 problem(s)`.
- Main's ClassFieldTheory README has 0 hits for `upper` and 0 for this roadmap's name.
- #1215 defines the object at README lines 1188–1199 and `Suggested.lean` lines 109–117 (`localAbsoluteUpperRamificationGroup`).

**Repair.** Change the description only; the README is right as it stands.
- Replace *Merge order* with: "ClassFieldTheory's revision #1215, whose Layer 7 defines the absolute upper filtration of a nonarchimedean local field, precedes this pull request; the summary and the scope name that layer as the object's owner, and ClassFieldTheory takes no input from this roadmap. #940, #856, #1713, #1795 and #1812 cite §§3a–4a and merge after this pull request."
- In *Why*, delete "and the ClassFieldTheory amendment #1411 consumes the absolute upper filtration".
- In the roadmap-summary block, replace the ClassFieldTheory sentence with: "On a nonarchimedean local field its absolute upper filtration agrees with ClassFieldTheory Layer 7's."
- For #1411 itself (outside this folder, and for its own review), the README's "takes no input" stays true after both pull requests merge only if #1411 drops its §4a.1 citations and takes `localAbsoluteUpperRamificationGroup` from #1215's Layer 7. Those citations are at README lines 94–95, 136–139, 507, 538–547, 1389–1392, 1430–1442 and 1490, and in the `AbsoluteUpper` section of its `Suggested.lean`, lines 1122–1148.

**Tested.**
- After the repair, the description and the README state the same order: ClassFieldTheory (#1215), then this roadmap, then its consumers. Each consumer cites §4a: `roadmaps grep '§4a\.[12]'` gives 6 lines in #940, 9 in #856, 20 in #1713, 9 in #1795 and 6 in #1812.
- #1215's README already says the same as lines 113–121 (its lines 187–191: "No result from that generalization is an input here").
- On `ℚ_2(ζ_8)` at `u = 3/2`, #1215's definition and §4a.1's fourth bullet both restrict to `{1, 5}` (row 89).

## R02 (P3) — The description still lists suppliers and a consumer the README does not have, and its summary sentence is false

**Location.** In the pull-request description:
- *Dependencies*: "the completed roadmaps LocalFieldsRamification, ProfiniteProPGroups and ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)";
- *Why*: "FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879) consume this package";
- *Merge order*: "#940, #856 and #879 cite its §§3a.1–3a.3 and §§4a.1–4a.3";
- **Summary**: "On a nonarchimedean local field every object restricts to the completed roadmap's, and that agreement is a target."

**Claim.** The description is unchanged since 20db688.
- README line 99 says this roadmap "consumes nothing from that section" (§F.3a).
- ProfiniteCohomology is never named in the README.
- #879 does not cite this roadmap. It reaches the package through PadicPeriodRings.
- The **Summary** sentence contradicts README lines 15–21, which name three local-field objects that are not the completed roadmap's:
  - ClassFieldTheory Layer 7's filtration;
  - ReductiveGroupsPartII's `Breve E`;
  - the non-Galois `ψ_(L/K)`, which is this roadmap's.

**Witness.**
- `grep -c ProfiniteCohomology README.md` returns `0`.
- `roadmaps grep --fixed RamificationOfCompleteDiscretelyValuedFields` returns lines only from #1215, #1410, #1411, #1713, #617, #856 and #940.
- For `L = ℚ_3(∛3)`, §4a.2 gives `ψ_(L/K)(2) = 3`, while the pinned `upperRamificationGroup` needs `[IsGalois K L]` (`Herbrand/Basic.lean` lines 255 and 421).

**Repair.**
- Make *Dependencies* read: "Mathlib and Tau Ceti at the pins; the completed roadmaps LocalFieldsRamification and ProfiniteProPGroups, through the Tau Ceti declarations that prove them; ReductiveGroups Layer 3, SchemeAndStackFoundations §0.24, AdicSpacesPartII §R0.19.9 and ReductiveGroupsPartII §RG2.0.4, all on main. EtaleCohomologyFoundations §F.3a and ClassFieldTheory Layer 7 (#1215) are named in the scope as owners and are not suppliers."
- In *Why* and *Merge order*, drop #879. Add "integral `p`-adic Hodge theory reaches the package through PadicPeriodRings", as README lines 1157–1158 say.
- In **Summary**, replace the quoted sentence with the sentence at README lines 15–21.

**Tested.** Each section named in the edited text resolves on main at a169c04:
- ReductiveGroups Layer 3, line 234;
- SchemeAndStackFoundations §0.24, line 1565;
- AdicSpacesPartII §R0.19.9, line 7793;
- ReductiveGroupsPartII §RG2.0.4, line 852;
- EtaleCohomologyFoundations §F.3a, line 776.

The edited *Dependencies* then names exactly the suppliers of README lines 156–288 and 1112–1135.

## Previous findings

- R01 — partly repaired: the README now reads "is ClassFieldTheory Layer 7's. ClassFieldTheory precedes this roadmap, … it takes no input from this roadmap" (lines 116–118). The description still says "#1411 consumes its §4a.1 absolute filtration" and does not name #1215. Carried as R01.
- R02 — not repaired: the description's *Dependencies* still reads "ProfiniteCohomology on main; EtaleCohomologyFoundations §F.3a (§4a.1's tame inertia)", *Why* still names #879, and the **Summary** sentence is unchanged. Carried as R02. No repair report marks it not actionable.

## Verified sound

### Changed passages (3 hunks, read in full against the diff)

- **Summary, lines 15–21.** Each ownership clause holds at its owner:
  - the finite-Galois objects and inertia and wild inertia are the completed roadmap's (rows 67–68);
  - the filtration from finite upper groups is ClassFieldTheory Layer 7's at #1215 (row 88, R01);
  - `Breve E` is ReductiveGroupsPartII's (row 70);
  - the non-Galois `ψ_(L/K)` is this roadmap's (row 71).

  The deleted clause about the finite images of `G_K^u` survives in the scope (row 89) and in §4a.1's fourth bullet (lines 777–781).
- **Scope, lines 113–127.**
  - The set description equals #1215's `⨅ M, comap` definition (row 89).
  - The order argument is true on main (row 90).
  - "Takes no input from this roadmap" is true on main and at #1215, and false only at #1411 (row 91, R01).
  - The fourth-bullet agreement holds at every `u ≥ −1` on `ℚ_3(ζ_9)` (row 92).
  - The reduction from "Two objects" to "One object" is correct (row 93).
  - The remaining text has no "not defined a second time" claim about `G_K^u`. The other two "second time" sentences are line 76's, on the restriction pattern, and line 127's, about `ψ_(L/K)`.
- **Downstream, lines 1137–1158.** Deleting the ClassFieldTheory sentence matches line 118. The previous repair asked for a replacement sentence; deletion is equivalent, because the scope already states the order. The remaining five consumers each cite §4a (row 94).
- **Leftover claims.** No text in the README still asserts that ClassFieldTheory consumes §4a.1. `grep -n ClassFieldTheory` hits only lines 19, 92 and 116–117.

### Seeded sample

These are checked where they fall in the changed passages.
- **Agreement with `Breve E` on a local field** (line 1058), restated in the summary clause. brinon-conrad Exercise 1.4.4 is at lines 375–386, in the page 10 block that starts at line 359:
  - part (2), lines 378–381: the unique extension of the valuation, and incompleteness of `K^un` when the residue field is not algebraically closed;
  - part (3), lines 382–386: the completion's algebraically closed residue field, and the equivalence of finite extensions.

  The exercise is stated for `p`-adic fields, which matches the README's "in mixed characteristic". The locator is correct.
- **The perfect-residue Herbrand package** (line 324), whose §4a.1 export the scope paragraph describes. serre1961 n° 3.1 has Proposition 3 at line 931, and the sentence defining the upper groups of an infinite Galois extension by passing to the limit at lines 936–938, in the page 25 block that starts at line 923. Proposition 4 (transitivity) is at lines 942–947. This matches §4a.1's locator (lines 789–794).
- **Residue enlargement** (line 579), **proalgebraic units** (line 600) and **graded norms** (line 643) are untouched by the diff and by anything that cites the changed text. They are carried from r19 (rows 45–47), checked at the same locators.

### Adversarial table

Notation:
- `Z8 = ℚ_2(ζ_8)/ℚ_2`, with `#G_0..#G_4 = 4, 4, 2, 2, 1`;
- `Z9 = ℚ_3(ζ_9)/ℚ_3`, with `#G_0..#G_3 = 6, 3, 3, 1`;
- `S3 = ℚ_3(ζ_3, ∛3)/ℚ_3`, with `#G_0..#G_4 = 6, 3, 3, 3, 1`;
- `T6 = ℚ_2(ζ_3, ∛2)/ℚ_2`;
- `AS` is `y^p − y = t⁻¹`;
- `I2` is `F_2(s)((t))` with `M = K(y, w)`;
- `W = Frac W(F̄_p)`.

Which rows come from where:
- Rows 1–48, 51–61, 72–76 and 83 cover statements the diff leaves untouched, including all 13 Lean declarations. They are carried from r21, which carried them from r19 and r20.
- Rows 67, 68, 70 and 71 test clauses of the rewritten summary sentence, and were recomputed this round.
- Rows 64 and 65 test the unchanged description.
- Rows 77–82 and 84–86 tested the texts this head rewrote, and are replaced by rows 88–97.

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | Hilbert (Lean 62) | `Z9` | `5 + 2 + 2 = 9`; disc `ℚ(ζ_9) = 3^9` | agrees (r21) | none |
| 2 | Hilbert | `S3` | `Σ = 11`; tower `1 + 2·5 = 11` | agrees (r21) | none |
| 3 | Hilbert | `T6` | `Σ = 3 − 1 = 2 = e − 1` | agrees (r21) | none |
| 4 | Hilbert, separability dropped | `CpCp`, `p = 2` | `d = 2`, `Σ = 3` | hypothesis needed (r21) | none |
| 5 | §3a.1 Check `z^p − t^(p−1)z = s` | `p` | `#G_0 = p`, `e = 1`, `d = p − 1 = Σ` | consistent (r21) | none |
| 6 | `herbrandFun` (Lean 81) | `Z8` | `φ(1) = 1`, `φ(3) = 2`, `φ(7) = 3` | agrees (r21) | none |
| 7 | same, below `−1` | unramified quadratic | `φ(−2) = −3`, `ψ(−2) = −3/2` | stated on `[−1, ∞)` (r21) | none |
| 8 | same, trivial action | `C_2` on `ℤ_2` | ratio `1`, `φ = id` | agrees (r21) | none |
| 9 | `inverseHerbrandFun` (Lean 90) | `Z8` | `ψ(2) = 3`, `ψ(3) = 7`, `ψ(−1) = −1` | agrees (r21) | none |
| 10 | `upperRamificationGroup` (Lean 97) | `Z8`, `v = 3` | `G^3 = G_7 = 1` vs `G_3 = {1, 5}` | wrong model excluded (r21) | none |
| 11 | Herbrand (Lean 111) | `S3`, `H = C_3`, `v = 1/2` | `ψ_G(1/2) = 1`; `(G/H)^(1/2) = 1` | agrees (r21) | none |
| 12 | Herbrand | `Z8`, `H = {1, 7}`, `v = 2` | `G^2 = {1, 5} ↦ G/H = (G/H)^2` | agrees (r21) | none |
| 13 | Herbrand | `T6`, `H = A_3`, `v = 0, −1` | `A_3 ↦ 1`; `G ↦ G/H` | agrees (r21) | none |
| 14 | Herbrand, separability dropped | `I2`, `v = 1/2` | order `2` vs `1` | hypothesis needed (r21) | none |
| 15 | tower (Lean 130) | `Z9`, `H = C_3`, `u = 5` | `φ_G(5) = 3/2`; `φ_(G/H)(3) = 3/2` | agrees (r21) | none |
| 16 | tower | `Z8`, `H = {1, 7}`, `u = 7` | `φ_G(7) = 3`; `φ_(G/H)(4) = 3` | agrees (r21) | none |
| 17 | tower below `−1` | any | both `−1 + f(u + 1)` | harmless (r21) | none |
| 18 | tower, separability dropped | `I2`, `u = 1` | `1` vs `1/2` | hypothesis needed (r21) | none |
| 19 | Hasse–Arf (Lean 151) | `Z9` | `6 ∣ 0`, `6 ∣ 6`; non-jump `6 ∤ 3` | agrees (r21) | none |
| 20 | Hasse–Arf | `Z8` | `4 ∣ 4`, `4 ∣ 8`; non-jump `4 ∤ 6` | agrees (r21) | none |
| 21 | Hasse–Arf, commutativity dropped | `S3` | `j = 3`: `6 ∤ 9` | hypothesis needed (r21) | none |
| 22 | Hasse–Arf, infinite residue | `AS` over `F̄_p((t))` | `p ∣ p` | agrees (r21) | none |
| 23 | negative control | abstract `C_9` | `9 ∤ 21`, `φ(5) = 7/3` | consistent (r21) | none |
| 24 | `absoluteUpperRamificationGroup` (Lean 176) | `ℚ_2`, `Z8`, `u = 1, 2, 3` | `G_1 = G`, `G_3 = {1, 5}`, `G_7 = 1` | agrees (r21) | none |
| 25 | same, non-henselian | `ℚ`, `ℤ_(5)`, `ℚ(i)` | `D_M = 1` | decomposition groups needed (r21) | none |
| 26 | `_zero` (Lean 197) | `O = AlgebraicClosure K` | `𝔪 = 0`, `G_0 = 1` = inertia | agrees (r21) | none |
| 27 | `_zero` | `W` | `ψ(0) = 0`; inertia `= G_K` | agrees (r21) | none |
| 28 | `_zero` | `ℚ_p`, Frobenius lift | outside both sides | agrees (r21) | none |
| 29 | `_zero`, `q`-power step | `F_p((t))`, `t^(1/p)` | `(σx − x)^p = 0` | sound (r21) | none |
| 30 | finite projections (Lean 215) | `ℚ_2`, `Z8`, `u = −1, 3/2` | `G`; `G_2 = {1, 5}` | agrees (r21) | none |
| 31 | same, perfectness dropped | `I2`, `u = 1/2` | `≤ 2` vs `4` | hypothesis needed (r21) | none |
| 32 | `0+` (Lean 239) | `W`, `K(ζ_3)` | `P_K ↦ 1`, `I_K ↦ C_2` | strict inclusion (r21) | none |
| 33 | `0+` | `ℂ((t))` | `G_1 = 1`; both `⊥` | agrees (r21) | none |
| 34 | `0+` | `AS` over `F̄_p((t))` | `G_1 = C_p` for `0 < w ≤ 1` | agrees (r21) | none |
| 35 | subgroup identity (Lean 263) | `S3`, `H = ⟨(12)⟩`, `u = 0, 1/2, 2` | LHS `H, 1, 1` = RHS `H, 1, 1` | agrees (r21) | none |
| 36 | same | `H = G`; `H = ⊥` | `φ_G ∘ ψ_G = id`; `⊤ = ⊤` | agrees (r21) | none |
| 37 | open-subgroup identity (Lean 289) | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `ψ(1) = 2`, `H^2 = H`; `ψ(3/2) = 5`, `1 = H^3` | agrees (r21) | none |
| 38 | same, `L` not Galois | `L = ℚ_3(∛3)` | `ψ = u` on `[0, 3/2]`, `3u − 3` after; `ψ(2) = 3` | agrees (r21) | none |
| 39 | same, `u = −1` | any | `G_K ↦ G_L` | agrees (r21) | none |
| 40 | same, `hO′` dropped | `W`, trivial `O′` | `G_L` vs `⊥` | hypothesis needed (r21) | none |
| 41 | integral formula | `L = ℚ_3(∛3)` | slopes `1`, then `3` | agrees (r21) | none |
| 42 | integral formula | unramified quadratic | `(1/2)·∫_0^u 2 dt = u` | agrees (r21) | none |
| 43 | §4a.3 base change | `Z9` | `d/e = 9/6 = 3/2`; upper jumps `0, 1` | agrees (r21) | none |
| 44 | sampled: perfect-residue package | `AS`; `W(ζ_p)`; `Z8` | `d = 2(p − 1)`; `d = p − 2`; upper `1, 2` | agrees (r21; locator re-read) | none |
| 45 | sampled: residue enlargement | `κ[[t]] → κ̄[[t]]`; `ℚ_(p²)`; `X^e − t` | uniformizer kept; splits; `#G_0 = e` | agrees (r21) | none |
| 46 | sampled: proalgebraic units | `E = F`; `AS` | `V = 1`; `π₀(V) ≅ C_p` | agrees (r21) | none |
| 47 | sampled: graded norms | `AS`; tame `C_e`; `F_3` | `N(1 + λy⁻¹) = 1 + (λ^p − λ)t`; kernel `μ_e`; `{0, ±√2}` | agrees (r21) | none |
| 48 | sampled: `Breve E` agreement | `ℚ_p`; `F_q((t))`; `√p` | `W(F̄_p)[1/p]`; unbounded degree; `v = 1/2 ∉ ℤ` | agrees (r21; locator re-read) | none |
| 51 | agreement of the two filtrations on a local field | `Z8`, depths `0..3` | `(ℤ/8)ˣ, (ℤ/8)ˣ, {1,5}, {1}` on both sides | agrees (r21) | none |
| 52 | `IsGalois` reason | pin `Herbrand/Basic.lean` | `[IsGalois K L]` at 255 | agrees (r21) | none |
| 53 | Conventions example | `F_p(s)((t))` | `e = 1`, `e = 1`; difference `t^(1/p)`, `v = 1/p` | agrees (r21) | none |
| 54 | `K^ur` over perfect `k` | `F̄_p((t))`, `K(t^(1/p))` | `e = p`, `f = 1` | agrees (r21) | none |
| 55 | Layer-4a-only objects | grep of Layer 3a | 0 occurrences | agrees (r21) | none |
| 56 | `H_i` quantified over subgroups | `ℚ_3 ⊂ ℚ_3(ζ_9)` | no `K′` | agrees (r21) | none |
| 57 | `K̃ = Frac A′` | `k = F_2(s)` | `s^(1/2)` in residue field of `A′` | agrees (r21) | none |
| 58 | `H_i = H ∩ G_i` | `S3`, `H = ⟨(12)⟩` | `H_0 = H`, `H_1 = 1` both sides | agrees (r21) | none |
| 59 | separability inherited | `k ⊆ k_F ⊆ l`; `I2` | both steps separable; `I2` fails at top | agrees (r21) | none |
| 60 | class formula | `Z8`, `H = {1, 7}` | `(4 + 2)/2 = 3 = v(−2√2)` | agrees (r21) | none |
| 61 | Herbrand's lemma | `Z8`, `H = {1, 7}`, `u = 1, 3, 4` | `φ_H = 1, 2, 5/2`; `G_uH/H = G/H, G/H, 1` | agrees (r21) | none |
| 64 | description *Dependencies* | grep of README | `ProfiniteCohomology` 0 hits; §F.3a consumed 0 times (line 99) | contradicts (unchanged) | R02 |
| 65 | description: #879 cites §§3a–4a | `roadmaps grep --fixed` | 0 lines from #879 | false (unchanged) | R02 |
| 67 | summary 15–16: finite Galois objects are the completed roadmap's | `Z8` | lower jumps `1, 3`; `φ(1) = 1`, `φ(3) = 1 + 2·(1/2) = 2`; `ψ(2) = 3` | agrees (recomputed) | none |
| 68 | summary 16: inertia and wild inertia are the completed roadmap's | `ℚ_2`, `Z8` | `G_K^0 ↦ G_0 = (ℤ/8)ˣ`; `G_K^(0+) ↦ G_1 = (ℤ/8)ˣ` (as `F_2ˣ = 1`) = images of `inertiaSubgroup`, `wildInertiaSubgroup` | agrees (recomputed) | none |
| 70 | summary 18–19: `K′` is `Breve E` | `E = ℚ_p`; `E = F_q((t))` | `K′ = W(F̄_p)[1/p]`, `e(K′/E) = 1`; `K′ = F̄_q((t))`; RG2.0.4 at main 852 | agrees (recomputed) | none |
| 71 | summary 20–21: non-Galois `ψ` is this roadmap's | `L = ℚ_3(∛3)` in `S3`, `H = ⟨(12)⟩` | `ψ_(M/K)(2) = 3 + 6·(1/2) = 6`; `H_1 = 1`, so `φ_(M/L)(6) = 3`; `ψ_(L/K)(2) = 3 = 3·2 − 3` | agrees (recomputed) | none |
| 72 | 3a scope bullet: agreement list | §3a.2 bullet; pin | five Herbrand and upper objects | matches targets (r21) | none |
| 73 | negative control on "every object" | a local field; §3a.3's proalgebraic `U_K` | finite residue field, no proalgebraic object | narrowing correct (r21) | none |
| 74 | 3a scope bullet: recovers `hasseArf` | `Z8`; `Z9` | upper jumps `1, 2`; `0, 1` | agrees (r21) | none |
| 75 | open-subgroup identity on a local field | `ℚ_3 ⊂ ℚ_3(ζ_3) ⊂ Z9`, `u = 1, 3/2` | `G_K^1 ↦ C_3 = H = H^2`; `G_K^(3/2) ↦ 1 = H^3` | agrees (r21) | none |
| 76 | sole owner of `ψ_(L/K)` | #1215 at 024927f | 0 hits for `ψ_(L/K)`, `ψ_{L/K}`, "open-subgroup identity" in its README and `Suggested.lean` (re-run) | §4a.2 sole owner | none |
| 83 | downstream: FilteredLocalGaloisGroups and FieldOfNorms consume §§4a.1–4a.2 | #1795 at f235b83; #1812 at 5b260a9 | projections, inertia, `ψ`, identity, integral formula on both | agrees (r21; heads unchanged) | none |
| 87 | line 68 "owns everything on nonarchimedean local fields" vs lines 116 and 121 | — | the list after line 68's colon omits `G_K^u` and non-Galois `ψ` | remark on untouched text | none |
| 88 | summary 17–19 and scope 116: the local-field filtration from finite upper groups is ClassFieldTheory Layer 7's | main; #1215; #1411 | main README: `upper` 0 hits (Layer 7 at 1312–1432); #1215: owner at 187–191, def at 1188–1199, `Suggested.lean` 109–117; #1411: gives it to §4a.1 (136–139) | true at #1215 only | R01 |
| 89 | scope 113–116: the set equals #1215's definition | `ℚ_2`, `M = Z8`, `u = −1, 3/2, 5/2` | `⨅ M, comap` membership ⇔ every restriction in the upper group; `ψ(3/2) = 1 + 2·(1/2) = 2`, `G_2 = {1, 5}`; `ψ(5/2) = 3 + 4·(1/2) = 5`, `G_5 = 1`; `u = −1`: `G`; the same on both sides | agrees | none |
| 90 | scope 116–117: ClassFieldTheory precedes, via both suppliers | main | ReductiveGroupsPartII 377–380 take ClassFieldTheory layer 9, and §4a.3 needs RG2.0.4 (line 1091); SchemeAndStackFoundations 424 takes Layers 5 and 10, and §3a.3 needs §0.24 (lines 624, 736) | true | none |
| 91 | scope 117–118: ClassFieldTheory takes no input from this roadmap | main; #1215; #1411 | main: 0 hits for this roadmap; #1215 190–191 "No result … is an input here", depcheck 0 problems; #1411: §4a.1 at 507, 538, depcheck UPWARD, 1 problem | true on main and at #1215; contradicted by #1411 and the description | R01 |
| 92 | scope 118–121: the fourth bullet gives the agreement at every `u ≥ −1` | `Z9`, `u = 0, 1/2, 2` | `φ(1) = 1/2`, `φ(2) = 1`; `ψ(0) = 0`, `G_0` of order 6; `ψ(1/2) = 1`, `G_1 = C_3`; `ψ(2) = 2 + 6·1 = 8`, `G_8 = 1`; README 777–781 | agrees | none |
| 93 | scope 121–127: one local-field object is this roadmap's, because Herbrand functions assume `IsGalois` | pin; `L = ℚ_3(∛3)` | `[IsGalois K L]` at `Herbrand/Basic.lean` 255, `upperRamificationGroup` at 421; `ψ_(L/K)(2) = 3` (row 71); #1215 0 hits (row 76) | true | none |
| 94 | downstream 1137–1158 after the deletion | `roadmaps grep '§4a\.[12]'` | #940 6, #856 9, #1713 20, #1795 9, #1812 6; ClassFieldTheory on main 0 | consistent with line 118 | none |
| 95 | description *Merge order*: "#1411 consumes its §4a.1" | rows 90–91 | upward edge from a roadmap on main | contradicts README 116–118 | R01 |
| 96 | description *Why* and roadmap-summary: ClassFieldTheory needs or consumes the filtration | README 116–118 | ClassFieldTheory owns it, and takes nothing from here | contradicts | R01 |
| 97 | description **Summary**: "every object restricts to the completed roadmap's" | README 15–21 | three exceptions: ClassFieldTheory Layer 7, `Breve E`, non-Galois `ψ` (`ψ_(L/K)(2) = 3`) | false | R02 |

### Lean form and signatures

- **Signatures.** `Suggested.lean` is byte-identical to 20db688. I put `#check @name` for all 13 declarations in one scratch copy and elaborated it once: exit 0, nine `sorry` warnings. After whitespace normalisation the output is byte-identical to `signatures.md` (9666 = 9666 characters, `cmp` equal). None lost a binder, and nothing changed.
- **Headlines.** The headline theorems are:
  - Hilbert's formula (Lean 62);
  - Herbrand's theorem (111) and tower transitivity (130);
  - Hasse–Arf (151);
  - the absolute filtration's term at `0` (197), finite projections (215) and term at `0+` (239);
  - the finite-level subgroup identity (263) and the open-subgroup identity (289).

  All are stated. §4a.3 is named in the module docstring as not statable, because there is no maximal unramified extension beyond local fields at the pins. The one-tactic probe from r19 and r20 closes none of the 9 theorems; the file is unchanged, so this is carried.

### Library declarations opened at the pins (this round)

- **Tau Ceti, `NumberTheory/LocalField/Herbrand/Basic.lean`:** line 421 (`upperRamificationGroup (v : RamificationIndexDomain) : Subgroup (L ≃ₐ[K] L)`).
- **Tau Ceti, `NumberTheory/LocalField/RamificationGroup.lean`:** line 86 (`RamificationIndexDomain := Set.Ici (-1)`).
- **Tau Ceti, `NumberTheory/LocalField/FiniteExtension/IntermediateField.lean`:**
  - line 69, `finiteIntermediateFieldValuativeRel`;
  - line 75, `finiteIntermediateFieldTopology`;
  - line 81, `finiteIntermediateField_valuativeExtension`;
  - line 97, `finiteIntermediateField_isNonarchimedeanLocalField`.

  These are the structures that both §4a.1's fourth bullet and #1215's definition put on each finite level.
- **Absolute upper filtration:** `grep -rn absoluteUpper` over pinned Tau Ceti finds 0 hits.

### Cross-roadmap citations resolved

- **Main** moved from deebc70 to a169c04. Only `PROGRESS.md` and `STATUS.md` of LocalFieldsRamification, OneParameterSemigroups and PseudodifferentialOperators changed, and no supplier's README changed.
- **ClassFieldTheory:**
  - main: Layer 7 at 1312–1432;
  - #1215 (024927f): README 181–191 and 1188–1199, `Suggested.lean` 105–117;
  - #1411 (656f837): README 94–95, 136–139, 507, 538–547 and 1389–1442, `Suggested.lean` 1122–1148;
  - #617: 0 hits for "absolute upper".
- **Suppliers on main:**
  - ReductiveGroupsPartII lines 377–380 and 852;
  - SchemeAndStackFoundations lines 424 and 1565;
  - ReductiveGroups line 234;
  - AdicSpacesPartII line 7793;
  - EtaleCohomologyFoundations line 776.
- **Ownership against open pull requests.** I searched by object (`absolute upper (ramification|filtration)`). Hits are in #1215, #1410, #1411, #1795, #1812, #1835, #856, #879 and #940. Only #1215 defines the local-field object, and the README now names it as owner. #1411's claim that §4a.1 owns it is R01's remaining part. #1795 and #1812 consume §4a.1's general filtration, and #879 and #1835 route through PadicPeriodRings.
- **Tools.**
  - `roadmaps overlaps` finds no other pull request changing this folder and no dropped id.
  - `roadmaps resolve` finds nothing unresolved.
  - The tool's "only an open revision defines: None" is correct for the id "Layer 7", which exists on main. The content the README assigns to it is defined only at #1215 (R01).
- **Remark on untouched text (no change asked).** Line 68's "The completed roadmap owns everything on nonarchimedean local fields" reads as unconditional. The scope paragraph now names two exceptions: ClassFieldTheory Layer 7's filtration and §4a.2's `ψ_(L/K)`. The list after line 68's colon is accurate.

## Not verifiable

- `serre-local-fields` is settled as uncertified, and its locators are cited without the text.
- #1411, #1795, #1812, #879, #940, #856 and #1713 have no checkout in this brief. I read them at their indexed heads through `roadmaps show` and `roadmaps grep`. #1411's line numbers above are file lines, with the printed header line removed.
- The serre1960 and ega3 locators belong to sample targets untouched by the diff. I did not re-read them this round; they are carried from r19.

## Source issues

- none

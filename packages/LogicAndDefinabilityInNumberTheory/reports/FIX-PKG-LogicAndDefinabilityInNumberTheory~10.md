# FIX-PKG-LogicAndDefinabilityInNumberTheory~10

## F01 (P2) — applied

Old → new: §6.4 "C^p cell decomposition" and §6.5(d) triangulation are deleted. §6.4 is now "Connected components and definable paths" (former (a), (b)). §6.5 is now "Uniform bounds on the components of fibres" (former (c)). Six links are repointed. Scope lines 9, 17 and 24 are trimmed, and a Scope bullet names StratifiedSpacesAndTameTopology §4.1 and §7.1.

**Verification.** I read StratifiedSpacesAndTameTopology at its open head (`roadmaps show`).
- Its Scope owns "the triangulation theorem for o-minimal expansions of ordered fields" (Layer 4) and "`C^p` cells … of definable sets" (Layer 7).
- Its §4.1 states triangulation of every definable `A ⊆ Fin n → R` and finitely many definable `B_i`, over every ordered field `R`.
- Its §7.1 states the `C^p` refinement of cell decomposition for every finite `p ≥ 1` over ℝ, with van den Dries–Miller 4.2(1)–(2) as the source.
- Our former §6.5(d) was the case `R = ℝ` of its §4.1, and our former §6.4 was its §7.1.

That roadmap cannot obtain its more general §4.1 by citing ours. A grep of the README found no consumer here of either statement. The consumers of the old §6.5 are §§6.6, 6.8, 6.10, 6.13, 6.14 and 7.3, and they use components and paths only. Lines 1646 ("C^p decomposition is insufficient") and 1520 are remarks that C^p cells do not suffice. Neither cites §6.4.

**Ownership.** The general statements go to the roadmap that states them over every ordered field. This roadmap only names that owner in Scope, as the owner of statements it neither uses nor restates. That is not a supplier edge: no *Needs:* line, no supplier contract and no `gap:` entry. The dependency check shows no problem. If StratifiedSpacesAndTameTopology never merges, no target here loses an input. The round-9 report said the other roadmap should cite §§6.4–6.5 here. That is superseded: nothing is left here for it to cite.

**What changed, in detail.**
- **§6.4 statement.**
  - (a) is restated: every cell is definably path connected, and each definable set has finitely many connected components, each definable and a union of cells of every decomposition partitioning it.
  - (b) is unchanged: a definable connected set is definably path connected.
  - The proof route uses only cell decomposition (ShimuraVarieties §3.4c) and curve selection (§3.4e).
  - The cell clause is stated because §6.5 uses it.
- **§6.4 Checks** (three):
  - the hyperbola as two graph cells;
  - `[0,∞)` as two cells forming one component, which refutes "components = cells";
  - the closed topologist's sine curve, which is connected, not path connected and not o-minimally definable.
- **§6.4 locator and *Needs:*.** Locator: van den Dries–Miller 4.3 and 4.6, p.13, and connectedness of cells, p.12. *Needs:* §6.1 and ShimuraVarieties §§3.4c, 3.4e.
- **§6.5 statement.** The fibre bound, with the proof route spelled out: permute so the parameter is the cell base; fibres of cells are cells; N is the number of cells.
- **§6.5 Checks** (four):
  - `|x|<1, x≠t` (N=2, and N=1 fails);
  - `sin(tx)`;
  - `ℝ×(0,1)`, where uniform finiteness says nothing and the component bound applies;
  - m=0, where the statement reduces to §6.4(a).
- **§6.5 locator and *Needs:*.** Locator: van den Dries–Miller 4.4, p.13. *Needs:* §6.4 and ShimuraVarieties §3.4c.
- **Line 1462.** "finite C^p cell decomposition" becomes "continuous cell decomposition".
- **New Scope bullet.** "StratifiedSpacesAndTameTopology §4.1 owns the triangulation theorem for o-minimal expansions of ordered fields and §7.1 the C^p cell decomposition of definable sets over ℝ; neither is used or restated here."

**Where this differs from the suggested repair, and why.**
- I did not carry the old opening paragraph on §3.4d (dimension, frontier law), the definable-choice section convention (vdD–M 4.5) or the two-point-map Check into the new sections. They served only the deleted proof of (d) ("induction on n from cell decomposition, the frontier law and definable choice"). §6.4 needs neither dimension nor choice, and §6.5 needs neither choice nor curve selection. So the *Needs:* are §§3.4c, 3.4e for §6.4 and §3.4c for §6.5, not "§§3.4c–3.4e".
- The closure-remainder convention stays in Conventions. Consumers that use dimension (§§6.8, 6.13) already cite §3.4d directly.
- Pattern repair: the ShimuraVarieties supplier contract (README line 104) said this roadmap uses definable choice. It now imports only curve selection from §3.4e.

**Other occurrences repaired.**
- `sources.toml`:
  - `geometric_categories_and_o_minimal_structures` locator "§§4.1–4.10, pp.12–13" → "4.1–4.4 and 4.6, pp.12–13" (4.10 triangulation, 4.5 choice and 4.7 dimension are no longer cited);
  - `vd_dr_tame` locator "Chapters 3–4 and 8–10" → "Chapters 3–4 and 9–10" (Chapter 8 is triangulation). The References line of the README changes the same way. The entry stays `waived`, with the same key.
- `Suggested.lean` names neither §6.4 nor §6.5 and is unchanged.

## F02 (P3) — applied

Old → new: BKT "§1.1, pp.2–3" → "§1.2, pp.2–3" in §6.2 (README line 1512) and §6.3 (line 1522). The manifest `bkt` locator goes "§1.1; …" → "§1.2, pp.2–3; …". §6.2's citation now says that BKT normalizes on [0,1]ⁿ, and it attaches the closed cube [−1,1]ⁿ to van den Dries–Miller §2.5(4), p.9. A new Check shows that the two cubes give the same sets.

**Verification.**
- `bkt` line 23: §1.1 "Arithmetic quotients", p.1.
- `bkt` line 49: §1.2 "Moderate geometry of arithmetic quotients", p.2.
- `bkt` lines 101–113: R_alg, R_an (restricted to `[0,1]ⁿ`, line 106), R_exp and R_an,exp, all on p.3.
- `geometric_categories_and_o_minimal_structures` lines 336–338: §2.5(4) on p.9, functions vanishing off `[−1,1]ⁿ`.
- Same source, line 370: the o-minimality definition, also on p.9.

The citation now gives "§2.5, pp.8–9, with the closed cube … in item (4), p.9, and the o-minimality definition, p.9". The new Check composes `e^x·1_[0,1]` with `x↦(x+1)/2` to get `e^((x+1)/2)·1_[−1,1]`, and recovers the original by `x↦2x−1`. The pattern search found no other BKT "§1.1" citation.

## F03 (P3) — applied

Old → new:
- §3.3 citation: "§4.1, pp.18–19; … §4.2, pp.19–20" → "§4.2, p.19 (the ring A, its evaluations L↦q for real q>1, the order and A_+)".
- §3.3 *Needs:*: 3.2 → Mathlib `LaurentPolynomial`, `LaurentPolynomial.isLocalization`, `Localization`, `IsLocalization.lift`.
- §§2.6, 3.1, 5.1 and 5.3: page ranges and labels as below.

**Verification against `cluckers_loeser_2008`.**
- Line 742: §4.1 is Presburger sets, p.18.
- Lines 764–775: A, ϑ_q, the order, A₊ and "L−2 ∉ A₊", all in §4.2 on p.19.
- Line 3722: §16.4 begins on p.90. Line 3759: p.91 begins, and §16.4 ends there.
- Line 3751: Theorem 16.4.1 compares with arithmetic motivic integration.
- Line 3763: Remark 16.4.2 (p.91) is the specialization to p-adic integrals.
- Lines 3290–3323: §14.4 lies wholly on p.80.
- Lines 400–458: §2.3 runs pp.10–12; gluing by closed embeddings and finite affine covers is lines 434–443, p.11.
- Line 459: §2.4 (GDef_k) is on p.12.

The exponential paper's Theorem 9.1.5 (Specialization Principle) is `cluckers_loeser_exp` line 1703, p.43.

**Edits.**
- **§2.6.** "specialization Theorem 16.4.1, p.90" → "comparison with arithmetic motivic integration, Theorem 16.4.1, p.90, and Remark 16.4.2, p.91; specialization to local fields, [exponential paper] Theorem 9.1.5, p.43, as in §2.4".
- **§3.1.** "§2.2–2.3, pp.10–11; global subassignments §2.4, pp.11–13" → "§§2.2–2.3, pp.10–12, with definable subassignments of varieties by closed embeddings and finite affine covers in §2.3, p.11; the category GDef_k …, §2.4, p.12".
- **§5.1.** "Theorem 14.4.1, pp.79–81; §16.4, pp.89–90" → "Theorem 14.4.1, p.80; §16.4, Theorem 16.4.1 and Remark 16.4.2, pp.90–91".
- **§5.3.** "§14.4, pp.79–81, and §16.4, p.90" → "§14.4, p.80, and §16.4, pp.90–91".
- **§3.3 edge.** A is the localization of `LaurentPolynomial ℤ` at the elements 1−L^(−i). Mathlib's `LaurentPolynomial.isLocalization` makes `ℤ[T;T⁻¹]` the localization of `ℤ[X]` away from X, and `IsLocalization.lift` gives the evaluations. Nothing of §3.2 enters. The Layer 3 Dependencies list gains the same Mathlib names.

**Pattern repair in the manifest.**
- `cluckers_loeser_2008` locator gains "§§2.2–2.4, pp.10–12" and "Theorem 16.4.1, p.90; Remark 16.4.2, p.91".
- Its `cited_for` "Layers 1–3" → "Layers 1–3; 5.1; 5.3" (§§5.1 and 5.3 cite it).
- `cluckers_loeser_exp` `cited_for` gains 2.6 and 5.2 (§2.6 now cites Theorem 9.1.5, and §5.2 cites Theorem 9.2.4).

The other Cluckers–Loeser locators of the README are right as cited: Theorem 2.1.1 and Corollary 2.1.2, §7.1, Theorem 7.2.1, Theorem 4.4.1, §§4.2–4.5, §5, §§6.1–6.2, §10.1, Theorems 10.1.1, 12.1.1 and 14.1.1, §15.1, Proposition 16.1.1, §16.2 and §16.3.

## Checks

- **Elaboration.** Ran `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` from the content checkout. It exits 0 in 6 s with exactly twelve `declaration uses sorry` warnings (lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185) and nothing else. `Suggested.lean` is unchanged this round, and no module needed building.
- **Signatures.** One scratch file holds the module followed by `#check @name` for all 18 declarations; `mrdp` is checked under its namespace `Diophantine`. It elaborated with no error. Each type is identical to `scratch/signatures.md` and to the README statements. No binder was lost and nothing changed.
- **New library names.** The same scratch file elaborates `@LaurentPolynomial.isLocalization : IsLocalization.Away Polynomial.X (LaurentPolynomial R)`, `@IsLocalization.lift`, `@Localization` and `LaurentPolynomial` at the pinned Mathlib.
- **Dependency check** (command as prescribed): `depcheck: 207 roadmaps, 1904 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line. The StratifiedSpacesAndTameTopology Scope bullet adds no edge.
- **`roadmaps resolve`.** No cross-roadmap citation and no Lean name is reported as found nowhere.
- **Links.** All 208 internal anchors resolve to a heading of the README, including the six repointed to `#64-connected-components-and-definable-paths`.
- **Hygiene.** No TeX brace or macro outside code spans in the added lines. No LaTeX delimiter, machine path or pull-request number. `sources.toml` parses, with 41 entries and 41 distinct ids, and no key is added or renamed. No `needs-references.toml` was needed: every source used is in the cache.

## Adversarial pass (new or changed statements)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.4(a) cells path connected; finitely many definable components | A=∅; A=ℝ⁰; A=[0,∞) with cells {0},(0,∞); hyperbola | 0 components; 1; cells 2, components 1 (0∈cl(0,∞)); 2 components, two graph cells, neither meeting the other's closure | Holds; the cells-equal-components model fails on [0,∞) | Check added |
| Open-cell path step (section of a band) | band {0<x<1, y<x²} with section x²−1; points (0.5,−5), (0.25,0) | vertical to (0.5,−0.75), along to (0.25,−0.9375), vertical to (0.25,0); 0<0.0625 keeps it in the band | Holds | none |
| §6.4(b) definable connected ⇒ definably path connected | point; [0,∞) from 0 to 1; topologist's sine curve; ∅ | constant path; γ(t)=t from curve selection at 0; connected, not path connected, and its trace on y=0 is {0}∪{1/(kπ)}: infinite, no interval, so not definable; vacuous | Holds; the definability hypothesis is needed | Check added |
| Adjacency argument | X=[0,1)∪(1,2], cells [0,1)→{0},(0,1) and (1,2),{2} | 1∉X, no adjacency across 1, so two classes; X is disconnected, consistent | Holds | none |
| §6.5 uniform fibre bound | A={(t,x): \|x\|<1, x≠t}; n=0; m=0; A=ℝ×(0,1); empty fibre | t=0: (−1,0)∪(0,1), 2; t=2: 1; proof bound = 2 cells over (−1,1) + 1 over each of 4 other base cells = 6 ≥ 2; fibres ∅ or a point, ≤1; one fibre A; N=1 with infinite fibres; 0 components | Holds; the bound counts components, not points | Checks added |
| Fibre of a cell is a cell | graph y=t over base (−1,1), fibre at t=0.3 | the point {0.3}, a 0-cell; bands (−1,t),(t,1) give (−1,0.3),(0.3,1) | Holds | none |
| Cube conventions [0,1]ⁿ vs [−1,1]ⁿ | f=e^x·1_[0,1], g(x)=f((x+1)/2) | g(−1)=1, g(1)=e, g(1.5)=0 (1.25∉[0,1]), g(−1.2)=0; g(2·0.5−1)=g(0)=e^0.5=f(0.5) | Same sets | Check added |
| §3.3 A without §3.2 | ϑ_q(1−L⁻¹) at q=3/2 and q=1; L−2 at q=3/2 | 1/3; 0, so q=1 is excluded; −1/2<0, so L−2∉A_+ | A is a localization of ℤ[L,L⁻¹]; no residue objects needed | *Needs:* changed |
| Locators | bkt 23/49/101–113; vdD–M 336–338, 370; CL 742, 764–775, 3290–3323, 3722, 3751, 3759, 3763, 400–458, 459; exp 1703 | §1.1 p.1, §1.2 p.2, definitions p.3; §2.5(4) and the o-minimality definition p.9; §4.1 p.18, §4.2 p.19; §14.4 p.80; §16.4 pp.90–91, Theorem 16.4.1 p.90, Remark 16.4.2 p.91; §2.3 pp.10–12, §2.4 p.12; Theorem 9.1.5 p.43 | Values as now cited | edited |
| Ownership of the deleted targets | StratifiedSpacesAndTameTopology §4.1 at R=ℝ; §7.1 | our (d) = its §4.1 for R=ℝ; our §6.4 (a)–(c) = its §7.1, vdD–M 4.1–4.2; consumers here: none | Second owner removed | deleted, Scope bullet |

## Notes for the maintainer

- **Renamed headings.** §6.4 is now "Connected components and definable paths", and §6.5 is now "Uniform bounds on the components of fibres". The section numbers do not change. No roadmap on main or at an open head cites §6.4, §6.5 or Layer 6 of this one. `roadmaps grep` finds only TopologicalMirrorSymmetryForHitchinSystems, which cites Layer 2, and a mention of LogicAndDefinabilityInNumberTheoryPartII in QuadraticFormInvariantsPartII.
- **Ownership.**
  - The triangulation theorem and C^p cell decomposition are left to StratifiedSpacesAndTameTopology, which is open and not in the merge order. This roadmap names it only in Scope, never as a supplier.
  - Connected components, definable path-connectedness and the uniform fibre bound stay here. A search of main and the open heads finds no other owner of them.
  - Ownership was checked against StratifiedSpacesAndTameTopology and ShimuraVarieties at their heads with `roadmaps show`, and against the rest by `roadmaps grep`.
- **Lean.** No Lean name changed. `Suggested.lean` is unchanged.
- **Nothing moved down.** No notion moved in from a later roadmap, and no supplier gap was added or removed. `design/plan.json` keeps its one gap, `neron-pairing-perfect-finite-residue`.

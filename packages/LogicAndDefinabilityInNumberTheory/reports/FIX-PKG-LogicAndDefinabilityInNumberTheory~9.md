# FIX-PKG-LogicAndDefinabilityInNumberTheory~9

## F01 (P2) — applied

Verified. ShimuraVarieties is line 105 of the merge order, before AbelianSchemesAndArithmeticModuliPartII (155) and this roadmap (326). At its open head it states §3.4b `OMinimalStructure` with the bridge `exists_oMinimalStructure_definable_iff`, §3.4c monotonicity, cell decomposition (I),(II) and uniform finiteness, §3.4d dimension and its laws, and §3.4e choice and curve selection. All of these hold for every o-minimal structure, and §3.4e covers every o-minimal expansion of ℝ. The gap's `needs` is therefore met by an earlier roadmap.

Old → new: Scope line 9 "developed here … gap" → ShimuraVarieties §§3.4b–3.4e own the general theory; lines 17, 24 and the ShimuraVarieties contract agree. §6.1 keeps `IsOMinimalExpansion` with how it differs from the bridge. §6.4 keeps only the C^p refinement, §6.5 only components, paths and triangulation; both are retitled. Gap deleted.

Details:
- **§6.1.** One clause says how the predicate differs from the bridge: the unary condition is stated as a finite frontier, and the graphs of + and · are added. The unary equivalence is a target with a proof route. The interface bullets are now precise: the reduct needs order, + and · to stay definable. Two Checks are added (ℚ⊂ℝ, the empty language). The finite-union form and the closure laws are cited from §3.4b.
- **§6.4.** Retitled; it keeps only the C^p refinement, items (a)–(c). Three new Checks: x^(1/3), its graph, and |x|. *Needs:* adds §§3.4c–3.4d and drops 6.3, which only the analytic case uses.
- **§6.5.** Retitled; it keeps items (a)–(d): components, definable path-connectedness, the uniform fibre bound and triangulation. Dimension is cited from §3.4d and choice from §3.4e. Five new Checks. *Needs:* adds §§3.4c–3.4e.
- **Anchors.** All seven internal links to §6.5 and the link to §6.4 now use the new anchors.
- **Consumers.** §§6.8 and 6.13 now need §3.4d for dimension. §6.11 is handled under F06.
- **Convention line 41.** The closure-remainder sentence now points to the frontier law of §3.4d.
- **Gap removal.** The gap is gone from the contract sentence (line 113), the *Needs:* of §§6.14, 6.15 and 6.16, the Layer 6 Dependencies and the `gaps` list of `design/plan.json`. The plan now has only `neron-pairing-perfect-finite-residue`, which still appears under the README's "Exact supplier contracts" (line 75).

## F02 (P2) — applied

Verified against `towards_the_andr_oort_conjecture_for_mixed_shimura_varieties_the_` lines 2161–2190 (Theorem 13.6 and its proof, pp.49–50), line 2064 (N(s), p.47), lines 2122–2124 (Theorem 13.3) and line 2182 (special points lie in U(ℚ)×V(ℚ)×Siegel). §7.1 defines (I-orbit) only for points of A_g.

Old → new: §7.7's undefined "abelian type … (I-orbit) for the pure part" → a fixed Shimura morphism ι to ∏(GSp_{2g},ℋ_g⁺) with finite central kernel, D(x)=max_i D(x_i), N(x)=ord(w). (I-orbit) is §7.1's for this g; (M-orbit) is Theorem 13.3; (M-lift) is split into coordinate bounds. Three Checks added.

Details:
- **Coordinates.** x̃ has coordinates x̃_U, x̃_V and Siegel coordinates x̃_{G,i}, from Gao Proposition 4.3 (p.15) and ι.
- **(M-lift).** x̃_U and x̃_V are rational with H≪N(x); each x̃_{G,i} has algebraic coordinates of degree ≤k_g with H(x̃_{G,i})≪D(x_i)^(B_g).
- **Proof sketch.** It now derives `#Gal·x ≫ H(x̃)^δ`, δ=min(1−ε,1/b_g)/max(1,B_g), using the field E′ of ι.
- **Checks.** S=A_g; the universal elliptic curve; the quaternionic curve, which is excluded.

## F03 (P3) — applied

Verified. In main's GlobalQuadraticForms, line 444 is "### 4.1 Transport along isomorphisms of number fields". The section map (lines 54–89) sends "4.4, sign prescription" to `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`.

`TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds` is at TauCeti/NumberTheory/NumberField/Global/Approximation/Vector.lean line 127 at the pin, and I confirmed it with `#check`.

Old → new:
- Line 19: "§§4.1–4.4 (vector weak approximation, …)" → "§§4.2–4.3 …, §4.4 through that roadmap's section and name map". Vector weak approximation is now the Tau Ceti declaration.
- Line 95: "§4.1" is dropped and §4.4 names its Tau Ceti target.
- "From Tau Ceti" now states the declaration.
- §4.20 now cites it in its route and its *Needs:*.

## F04 (P3) — applied

Verified on main: `Completed/Chebotarev` and `Completed/RealAlgebraicGeometry` exist, and `TauCetiRoadmap/` copies of them do not. The ResolutionOfSingularitiesCharacteristicZero heading is "### 6.2 SNC compactification". WeilConjectures at its head has "### 5.29 Curve RH from the surface bound".

Old → new:
- `blob/main/TauCetiRoadmap/{Chebotarev,RealAlgebraicGeometry}` → `blob/main/Completed/…` in lines 17, 1320 and 1394, plus the new §§6.2, 6.11 and Layer 6 links.
- `#62-snccompactification` → `#62-snc-compactification`.
- `#curve-rh-from-the-surface-bound` → `#529-curve-rh-from-the-surface-bound`.
- "§5.29" added in lines 11 and 129, and in the link text.

Pattern: every `blob/main` link was checked against main, and every link to an open roadmap against its head. All anchors resolve: Heights…Obstructions, MotivesAndAlgebraicCycles, NeronModels…, ShimuraVarieties and WeilConjectures.

## F05 (P3) — applied

Verified. `lake-manifest.json` pins mathlib `1b1ccf4b…` and TauCeti `2fd255d9…`.

Old → new: line 47 → "The APIs are those pinned by lake-manifest.json."

Pattern repairs:
- **References.** Four entries called the `6b7abb3c` permalinks "Pinned source"; they now read "Mathlib source at the linked commit". The permalinks themselves, and the manifest URLs, stay as the record of where each text was read.
- **Line 17.** It claimed that the Tau Ceti QE modules "do not establish projection closure". At the pin, TauCeti/Geometry/RealAlgebraic/CAD/Existence.lean line 102 proves `instance : HasSemialgebraicProjections ℝ` (Tarski–Seidenberg; confirmed with `#check`). The line now cites that instance and `TauCeti.isSemialgebraic_iff_definable_real`.

## F06 (P3) — applied differently

The missing *Needs:* are real. One premise is wrong, though: RealAlgebraicGeometry has no dimension theory. A grep of `Completed/RealAlgebraicGeometry/README.md` finds no semialgebraic dimension. The dimension §6.11 uses is Tau Ceti's `TauCeti.semialgebraicDim` (Dimension/Basic.lean line 76 at the pin). Its agreement with o-minimal dimension is ShimuraVarieties §3.4d (`dim_eq_semialgebraicDim`).

Old → new:
- **§6.2** *Needs:* add RealAlgebraicGeometry Layers 3 and 6, and Tau Ceti `TauCeti.isSemialgebraic_iff_definable_real`.
- **§6.6** *Needs:* add DifferentialGeometry "Boundary and corners".
- **§6.11.** "dimension comparison of RealAlgebraicGeometry" → `TauCeti.semialgebraicDim` with ShimuraVarieties §3.4d. The equivalence "positive-dimensional ⇔ not a subsingleton" now has its proof. *Needs:* Tau Ceti `IsSemialgebraic` and `semialgebraicDim`, §3.4d, and RealAlgebraicGeometry Layers 3 and 6. It no longer lists 6.5, which it does not use.
- **Supplier contract line 117** is corrected to match.
- **Layer 6 Dependencies** add all of these.

## F07 (P3) — applied

Old → new: §4.11 "§7, witness-search argument p.264; §8, Definition 8.1 and Theorem 8.1, p.264" → "§8, Definition 8.1 and Theorem 8.1 with the witness-search direction of its proof, p.264". This now agrees with the README's own locators at lines 1001 and 1057. Davis is settled uncertified, so this repairs the inconsistency without a reading of the page.

## Checks

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean`, run from the content checkout, exits 0 in 6 s. The output is exactly twelve "declaration uses `sorry`" warnings (lines 40, 50, 66, 73, 89, 95, 101, 109, 127, 135, 169, 185) and nothing else. `Suggested.lean` is unchanged this round.
- **Signatures.** I put `#check @name` for all 18 declarations in one scratch file, elaborated it once, and compared each type with its README statement. Nothing changed and no binder was lost.
- **Library names.** The same file checked every library name the edits introduce, with exit 0:
  - `TauCeti.IsSemialgebraic`
  - `TauCeti.HasSemialgebraicProjections`, plus `inferInstance : HasSemialgebraicProjections ℝ`
  - `TauCeti.semialgebraicDim`
  - `TauCeti.NumberField.exists_one_tmul_mem_of_mem_nhds`
  - `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`
  - `Algebra.GrothendieckAddGroup.instCommRing`

  `TauCeti.isSemialgebraic_iff_definable_real` has no built object file, so I checked it in the source instead (RingLanguage.lean line 135, `namespace TauCeti`). I did not build that module.
- **Dependency check** (command as prescribed): `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **`roadmaps resolve`.** No cross-roadmap citation or Lean name is found nowhere. The `Diophantine.mrdp` lead is this roadmap's own declaration.
- **Links.** All internal anchors resolve. Every `blob/main` link resolves on main or at the head of its open roadmap.

## Gate failure: tex=8

The `tex` gate found eight TeX braces (`_{`, `^{`) outside code spans. All were in the new §7.7 text: five in its setup paragraph, one in (M-lift), and two in the quaternionic Shimura curve Check. I moved each one into a code span. The mathematics is unchanged:

- `ι : (G, X_G⁺) → ∏_{i=1}^r (GSp_{2g}, ℋ_g⁺)` and `G → ∏ GSp_{2g}` (setup paragraph).
- `x̃_{G,1}, …, x̃_{G,r} ∈ ℋ_g` (setup paragraph).
- `x̃_{G,i}` (M-lift).
- `G = Res_{F/ℚ} B^×` and `X_*(Res_{F/ℚ} 𝔾_m) = ℤ²` (Check).

No heading changed, so every anchor still holds. The `Γ\X⁺` in the gate's excerpt is only where the flagged paragraph starts. A backslash before a letter is not a TeX macro the gate lists, and `Γ\X⁺` stays.

After the edit I ran the gate's own README scanners on the file:

- `tex` 0, `latex` 0, `prnum` 0, `residue` 0, `private-paths` 0, `blob` 0.
- Every edited line has an even number of backticks (6, 8 and 4).
- The dependency check, rerun, prints `depcheck: 206 roadmaps, 1904 edges, 0 problem(s)`.

`Suggested.lean` did not change, so its elaboration above still stands.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §6.1 frontier ⇔ finite union | (0,1); [0,1); ℤ; ℚ; ∅; finite F | {0,1}; {0,1}={0}∪(0,1); ℤ infinite; ℝ; ∅; F | holds both ways |
| §6.1 bridge clause | empty language | unary definable sets are finite or cofinite (finite boundary); the order is not definable | predicate false, as the Check says |
| §6.4(a),(c) C^p | x^(1/3); \|x\| | derivative x^(−2/3)/3 unbounded at 0, so cut at 0; \|x\| is C^∞ on (−∞,0),(0,∞) | a continuous decomposition is not C¹: Check |
| §6.5(a),(b) | hyperbola xy=1 | 2 components, no path from (1,1) to (−1,−1) | holds |
| §6.5(c) | \|x\|<1, x≠t; sin(tx)>0 at t=2πk | 2 or 1 components, N=2; k components, unbounded | negative control: not o-minimal |
| §6.5(d) | (0,1); (0,1] | open simplex of {0,1}; open simplex plus vertex {1} | not closed simplices |
| §6.11 positive dim ⇔ ¬subsingleton | {0}; (0,1); dim-0 semialgebraic set | dim 0; connected with 2 points is infinite; finitely many point cells | holds |
| §7.7 δ | N,D ≥ 1 | H≪max(N,D^B)≤(ND)^m, #Gal≫(ND)^a, so δ=a/m | holds |
| §7.7 S=A_g | r=1, W=1 | N=1, (M-orbit) with C_ε=1 | holds |
| §7.7 universal elliptic curve | 2-torsion over τ=i, V-coordinate (1/2,0) | N=2, H=2, D=4 | (M-lift) consistent |
| §7.7 quaternionic curve | F real quadratic | w=(−1,0) is not swap-invariant; a finite-kernel map is injective on cocharacters | no ι: excluded |
| Galois index | x_i vs [π](x) | #Gal_ℚ x_i ≤ [E′:ℚ]·#Gal_{E′}[π](x) | holds |

## Notes for the maintainer

- **Ownership against open roadmaps.** I checked the open roadmaps closest by vocabulary.
  - StratifiedSpacesAndTameTopology (open, not in the merge order) also claims the triangulation theorem for o-minimal expansions (its §4.1) and C^p cells (its Layer 7). This roadmap is earlier in the merge order and keeps both. That roadmap should cite §§6.4–6.5 here or narrow its statements.
  - AbelianSchemesAndArithmeticModuliPartII B2.6 names only ShimuraVarieties §3.5a in its *Needs:*, but uses general o-minimal theory. It should cite §§3.4b–3.4e. That is its own edit.
- **Renamed headings.** Two section anchors change: §6.4 is now "C^p cell decomposition" and §6.5 is now "Connected components, definable paths and triangulation". The section numbers do not change. No roadmap on main or at an open head cites these sections.
- **Gap withdrawn.** `general-ominimal-block-foundations` is removed from both the README and `design/plan.json`. If the plan may only gain gaps, a maintainer withdraws it.
- **Nothing moved down.** No notion moved in from a later roadmap.
- **Sources.** `sources.toml` gains locators on the Gao entry (Proposition 4.3; §13.1, Remark 13.1). No source is missing and no `needs-references.toml` was written.

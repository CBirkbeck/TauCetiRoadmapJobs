# Repair of ZagierConjecturePolylogarithms (package, round 6)

This round resolves the two findings of `REV-PKG-ZagierConjecturePolylogarithms~5`. Both are right. I recomputed every witness and repaired each with an owned target.

- **F01.** A new §3.14 specializes `L₃` and `L₄` along every discrete valuation with infinite residue field, and adds point evaluation. §5.7's route now lists all five obligations, (a)–(e).
- **F02.** §3.9 now defines the Hodge correlator variations. §3.13 now owns the realization in families `r_X` of the combinatorial coalgebra of `ℂ(X)`. The Conventions, §§5.1, 5.4, 5.7 and 6.3 use it.

Files changed:

- `packages/ZagierConjecturePolylogarithms/README.md`
- `packages/ZagierConjecturePolylogarithms/Suggested.lean` (module docstring only)
- `packages/ZagierConjecturePolylogarithms/sources.toml` (locators and `cited_for` extended; no new source)

`metadata.toml` and `design/plan.json` are unchanged, and no supplier gap was needed.

## F01 (P2) — applied

**What changed.** New §3.14 `sp_v: L_n(F) → L_n(k)`, with:

- relation preservation;
- full-cobracket compatibility for every uniformizer;
- extensions of valued fields;
- point evaluation on regular classes.

In §5.7, (iii) now cites §3.14. Old route (a)–(c), ending "content is (a),(b)", becomes (a)–(e). The new steps are (c) `ℓ_p = sp_{v_p}(ℓ)` on `𝒞/ℤ`, (d) regularity/extension, and (e) verification. Two Checks were added (moment curve, Gauss valuation).

**Evidence.**

- *Moment curve.* I recomputed it exactly (Python with `Fraction`, `-I`, scratch). All 70 minors are nonzero and `ρ = (4, 5/2, 2, 4)`. Of the 40320 permuted terms of `Alt₈`, 720 have a coincidence among the `ρᵢ`. 144 of them have `ρ₁ = ρ₄`, which is the denominator in CGR line 448/450. Adjacent coincidences: 0.
- *Why adjacent `ρ`s never coincide.* By the Plücker relation, `ρᵢ = ρᵢ₊₁` forces `|i+1,i+2,7,8|·|i+1,i+2,i,i+3| = 0`, which never holds on `𝒞`.
- *The undefined specialization.* §1.2 defines `Sp` only for `K(t) → K`. The relation module (§1.3) is closed only under those maps, so no section supplied a specialization at the Gauss valuation `ℚ(t) → 𝔽₂(t)`.

**Same pattern elsewhere, also repaired.**

- §5.3 used B₃ specialization along divisors of `ℂ(X)` with no target. It now cites §3.14 (via §1.5) and K3BlochGroups §4.21.
- §5.9: the `D₃₁` residues of `h` now cite §3.14.
- §5.8 (point evaluation at `F`-points) now cites §§3.14 and 5.7(d)–(e).

**Supplier and status.**

- The weight-two input is K3BlochGroups §4.21 `preBloch_rationalSpecialization`. It is now in that roadmap's supplier contract, and I checked it at that roadmap's head.
- The open steps of the existence path are now (a), (b) and (d).

## F02 (P2) — applied

**What changed.**

- §3.9: `Cor^Hod` was the "Hodge realization of §3.8". It is now the fibre of the Hodge correlator variation over `Conf_n` (G08 Thm 1.12, Thms 7.8–7.9, Thm 9.1), compared with §3.8 at algebraic points.
- §3.13: new "Realization in families" `r_X: L(ℂ(X)) → L^HT(η_X)`, with (1) admissible opens and germs, (2) pullback, (3) relations and collision limits, (4) the comparison at `F`-points. The route was rewritten through it.
- The Conventions no longer limit Hodge realizations to number fields.

**Evidence.**

- §3.13 began "For a number field `F`". `S₄(t)` has coefficient field `ℂ(t)`, which has transcendence degree 1 and is no number field.
- GR line 3554–3556 itself states the needed map `L_•(F) → L^HT_•(η_X)`, with `F = ℂ(X)`, only for the conjectural motivic coalgebra.
- I recomputed the angular derivative at `t = i`: `(2/5)·i·(5/16)·(−3ζ(3)/32) = −3iζ(3)/256 ≈ −0.0140866i`.

**Uses updated.** §§5.1 and 5.4 (`R∘r_Y` on strata; Needs gain §3.13), the §5.7 period-uniqueness Check, and the §6.3 route (fibre at `σⱼ(z)` through §3.13(4)).

**New supplier.** The collision limit in §3.13(3) is the limit MHS of an admissible variation. MixedHodgeModulesAndIrregularHodgeTheory owns it (§§3.2–3.3); it is an open pull request at line 261 of the merge order, before this roadmap at line 323. It is cited, not restated, and has its own supplier contract.

## Checks run

- **Elaboration.** `lake env lean` on the absolute path of `packages/ZagierConjecturePolylogarithms/Suggested.lean`, run from the content checkout, exited 0. The only output was two `declaration uses sorry` warnings, at lines 124 and 133. There is no `TauCeti.*` import, so nothing needed building.
- **`#check` scratch.** I put a copy of the file plus `#check @name` for all ten declarations in one scratch file and elaborated it once (exit 0). The types are unchanged:
  - `[Field F]` on the field-level definitions;
  - `[NumberField F]` on `periodMatrixFour`, `zagierDeterminantFour` and both theorems;
  - `hc : ∀ j, IsCycle4 (c j)` on `zagier_four_everyFamily`.

  They agree with README §6.4. Only the module docstring changed: its realization bullet now also names the family realization, and says the pins have no variations of mixed Hodge structures. I checked the latter at the pinned Tau Ceti, where "variation" occurs only in docstrings of `Geometry/Hodge/PeriodDomain.lean` and `Mixed/DeligneSplitting.lean`.
- **Dependency check.** No UPWARD, CYCLE or moved line:

  ```text
  depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
  ```

  The new edge is to MixedHodgeModulesAndIrregularHodgeTheory.
- **`roadmaps resolve`.** No cross-roadmap citation and no Lean name was found missing. The tool did not check names outside TauCetiRoadmap.
- **House style.** The added lines contain no process words, no LaTeX delimiters and no paths.
- **Gate failures.** None were listed for this round.
- **Sources.** No new source. The new locators were read in the cached texts:
  - G08: line 796 (Thm 1.12, p. 19), line 3399 (Thms 7.8–7.9, pp. 77–78) and line 3781 (Thm 9.1, p. 86);
  - GR: line 465 (footnote 4, p. 11), lines 3554–3560 ((189)–(190), p. 77);
  - CGR: lines 440–465.

  `sources.toml` locators and `cited_for` were extended (GR gains 3.14; G08 gains 3.13). No `needs-references.toml` was written.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values computed (both sides) | Result / change |
| --- | --- | --- | --- |
| §3.14 `sp_v` π-independence | Gauss 2-adic on `ℚ(t)`, `π = 2` and `π = 2(1+t)` | `D₃₁(2,t) ↦ S₄(t)` for both; `D₃₁(1/2,t/2) ↦ 3S₄(1/t)` for both; `S₄(2t) ↦ 0`; `sp_π(2) = 0` against `−u(1+t) ≠ 0` | symbols independent of π, `U` not; Check |
| §3.14(2) cobracket | `D₃₁(2,t)`, both uniformizers | π=2: `S₃(t)⊗u(t)` + 0; π=2(1+t): `S₃(t)⊗u(t) + S₃(t)⊗u(1+t) − S₃(t)⊗u(1+t)`; both equal `δS₄(t) ≠ 0` (`δ₂[t]₂ = (1+t)∧t ≠ 0`); the sign `−S₄` gives the negative | holds; Check |
| §3.14(3) ramification | `ℚ(t) ⊂ ℚ(√t)`, e = 2 | `(a,b) = (1,0) ↦ (2,0)`, same case, value `S₄(v₀)`; `a = b` ratio factor `w̄^{a−b} = 1` | holds for every e |
| §3.14(4) point evaluation | origin of `𝔸²_ℚ` | `S₄((s+2t)/t)`: `s` then `t` gives `S₄(2)`, `t` then `s` gives `0` (valuation −1); `S₄(2+s+t)`: `S₄(2)` both; `S₄(2) ≠ 0` (cobracket pairs to `7ζ(3)/8`) | only regular classes; Check |
| §3.14 hypothesis "k infinite" | 3-adic on `ℚ`, `k = 𝔽₃` | five-term at `(−1,4)` reduces to `2[−1] ≠ 0` in `P(𝔽₃)⊗ℚ` | hypothesis needed; Check |
| §3.14(4) intermediate fields | chain in `𝒞` through `𝒞_p` | residue fields `𝔽_p(9 vars)` and others: infinite (a finite fraction field forces dimension 0) | consistent |
| §3.14 degenerate | `d = 0`; `x = y`; `x = 1` | `ev` at generic point = id; `D₃₁(x,x)`, `a=b<0` ↦ `3S₄(1)`; `S₄(1) ↦ S₄(1)` | consistent with table |
| §5.7 `𝒞` fibres nonempty | `𝔽₂(s)`, parameters `0,1,s,s+1,s²,s²+1,s²+s,s²+s+1` | 8 distinct, so all Vandermonde minors ≠ 0 | holds |
| §5.7(c) `δ_{G₄}` arguments | minors, projected ratios, `T` | ratios of 4×4 Plücker minors, all units on `𝒞` | reduction termwise |
| §5.7(d) regularity | moment curve, `t = (2,3,4,5,6,8/5,0,1)` | 70/70 minors ≠ 0; `ρ = (4,5/2,2,4)`; 720/40320 coincidences, 144 with `ρ₁ = ρ₄`, 288 with `ρ₁ = ρ₃`, 288 with `ρ₂ = ρ₄`, 0 adjacent | candidate singular at a generic point; Check |
| §5.7(iii) mixed characteristic | Gauss `ℚ(t) → 𝔽₂(t)` | char 0 vs 2, so no embedding and (ii) is vacuous; `ℓ₂ = sp(ℓ)` | needs (c); Check |
| §5.7 period uniqueness | 9 faces | `Σ_{i=0}^{8}(−1)^i = 5 − 4 = 1`, so `c = 0` | unchanged |
| §3.13 `r_X` on `S₄(t)` | `X = ℙ¹∖{0,1,∞}`, `t = i`, `∂θ` | `dR = (2/5)i(5/16)(−3ζ(3)/32) = −3iζ(3)/256 ≈ −0.0140866i`; `R([t]₃⊗t) = (2/5)(5/6)(−9ζ(3)/256)·i`, the same | holds; Check |
| §3.13 domain | `ℚ(t)`, `ℂ(t)` | trdeg 1 against 0 for number fields | motivic map no input; Check |
| §3.13(3) collision | `D₃₁(x, x+t)`, `t → 0` | `a = b = 0`, so `D₃₁(x,x)`; 4 distinct finite points become 3 | limit, not restriction; Check |
| §3.13 route, constants | `Ext¹_{MT(ℚ)}(ℚ(0),ℚ(m)) = K_{2m−1}(ℚ)⊗ℚ` | m=2: `K₃(ℚ) = ℤ/48`, so 0; m=3: rank `r₁ = 1`; m=4: rank `r₂ = 0` | weights 2 and 4 vanish; weight 3 fixed by `S₃(1)` |
| §3.13 degenerate | `X = Spec ℂ`; `y ≡ 1` | `r_pt` = pointwise Hodge realization; `S₄(1)` ↦ constant pulled back from `Conf₂` | consistent |
| §3.9 `Cor^Hod` | `(0,1,y)`, y algebraic or transcendental | the motivic correlator is defined only for algebraic y; the variation is defined for every y; weight one gives `log|z₀−z₁|` | comparison now for all complex x |
| §6.3 via §3.13(4) | `[i]` over `ℚ(i)` | `p = (2/5)L₄*(i) = β(4)/8 ≈ 0.1236181` | unchanged value |
| §5.4 constant | `t∧u` | boundary `πi log|u| δ₀` (the `2πi` without the factor 1/2) | unchanged; `R∘r_Y` |

## Ownership and overlap

- `roadmaps grep` over main and all open heads:
  - "Hodge correlator": no match outside this package. This roadmap owns the Hodge correlator variations and the family realization.
  - Goncharov–Rudenko double symbols: no match. This roadmap owns the specialization of `L₃`/`L₄`. Polylogarithms §4.1 owns the analogous statement for its inductive groups, a different presentation, so this is no duplication.
  - "variation of mixed Hodge": found in MixedHodgeModulesAndIrregularHodgeTheory §§3.1–3.3 and MappingClassGroupsAndCanonicalRepresentations. The first is cited for limits; see the maintainer notes.
- The overlaps ledger lists no conflicting pull request and no dropped id.
- I added §3.14 at the end of Layer 3. No section was renumbered and no Lean name changed. No id other roadmaps cite moved.

## For the maintainer

- **Existence path.** It now rests openly on §5.7 (a), (b) and (d):
  - the `H²Γ` class;
  - the nine-term `H¹Γ` defects;
  - regularity of `ℓ` at every point of `𝒞` over `ℤ`, or an extension through the relations of `G₄`.

  The CGR candidate's displayed representative fails (d) at the moment-curve configuration. Every-family rationality does not depend on any of these.
- **New owned targets.** §3.14 (specialization along discrete valuations) and the family realization in §3.13 are research-level as stated. Their routes extend K3BlochGroups §4.21 and G08 Thm 1.12, and GR does not prove either.
- **New supplier edge, possible overlap.** The edge is MixedHodgeModulesAndIrregularHodgeTheory §§3.2–3.3. That roadmap also owns admissible variations of mixed Hodge structure. §3.6 here, which was not changed this round, defines good Hodge–Tate variations with G08's admissibility conditions itself. A later revision could cite that owner for the admissibility part.

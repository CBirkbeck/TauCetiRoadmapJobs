# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 5a1f55a)

**Verdict:** needs changes

This is an incremental re-review of the 2 lines changed since 975ac17: one paragraph of the README, in the ClassicalAdicEtaleCohomology supplier contract. That change repairs the previous R02. The previous R01 is still open, and it is carried forward below because PurityForFlatCohomology has not moved. No new problem was found.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

This is the previous review's R01, carried forward. No repair report marks it "not actionable in this package". The only such mark, F01 of the package-stage repair report FIX-PKG~2, concerns the `ILLUSIE-2003` trait gap.

**Location.** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements." Also `README.md:1648`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim.** This roadmap claims to be the only owner of four statements:
- §7.1, affine Lefschetz on principal punctured opens;
- §6.11, the normalised dualizing complex;
- §6.12, local duality;
- §7.3, local Lefschetz.

**Witness.** PurityForFlatCohomology (#1840) is still at d3f15fd9. In its `TauCetiRoadmap/PurityForFlatCohomology/README.md`:
- §1.4 (`:1107`) states (a) = our §7.1, (b) = our §6.11 and (c) = our §6.12.
- §1.5 (`:1160`) states our §7.3.
- `:206–207` and `:3471–3472` say that this roadmap imports them.
- The *Needs* line at `:1201` cites its own §1.5.

**Why this roadmap is the owner.** PurityForFlatCohomology §1.4's route only cites "Gabber's theorems" at their locators, and nothing on its *Needs* line proves them. Here they follow from §5.7 and §§6.3, 6.6 and 6.9, which have routes. PurityForFlatCohomology is earlier in the merge order (line 220, against line 390 here). If it owned these statements, it would depend implicitly on this roadmap's Layers 0–3.

**Repair** (in PurityForFlatCohomology; this folder is right once that lands):
- Delete §§1.4–1.5 there, together with the import bullets at `:206–207` and `:3471–3472`.
- Cite EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12 and 7.3 in their place.
- At `:1195`, replace "(§1.5:" with "(EtaleDualityAndPerverseSheavesPartII §7.3:".
- At `:1201`, replace "§§0.2, 1.1, 1.5" with "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

**Test, re-run on this review's merge order.** I applied the `:1201` edit to a scratch copy of the d3f15fd9 README and ran the dependency check (`--name PurityForFlatCohomology --pr 1840 --movable`). It printed `moved: PurityForFlatCohomology moved in the merge order from #220 to #390, right after its last supplier EtaleDualityAndPerverseSheavesPartII` and `depcheck: 234 roadmaps, 2264 edges, 0 problem(s)`. A `moved:` line is not a defect.

## Previous findings

- R01 — not repaired: `README.md:23` still says PurityForFlatCohomology "owns none of these statements". At d3f15fd9 that roadmap still states §1.4 (`:1107`) and §1.5 (`:1160`), and cites its own §1.5 at `:1201`.
- R02 — repaired: `README.md:142` now says "Section 5.4 supplies the oriented étale product X_ét ←×_(S_ét) Y_ét of small étale topoi for scheme maps X → S ← Y". The backticked `OrientedEtaleProduct` is gone, and the prose matches the supplier (below).

## Verified sound

### Gate, dependency check, build and diff (run on this head)

- **Gate.** `tauceti-roadmap gate … --base origin/main` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's `gate.md` adds `build=0`.
- **Dependency check** (`--movable`), output in full: `depcheck: 234 roadmaps, 2267 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean` on `Suggested.lean` exited 0 in 15 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 332.
- **Diff.**
  - `git diff --stat 975ac17 HEAD` touches only `README.md` (1 insertion, 1 deletion). `Suggested.lean`, `metadata.toml` and `lake-manifest.json` are unchanged, so the pins are those of the previous review.
  - The diff outside the folder against `origin/main` lists no path.
  - The folder holds only README.md, Suggested.lean and metadata.toml.

### The changed passage (R02 repair) against its supplier

ClassicalAdicEtaleCohomology (#875) is still at fc1c03a. Each clause of `README.md:142` matches its §5.4 (`README.md:3134–3141`):
- **The object.** `:3136` defines "the oriented étale product `X_ét ←×_{S_ét} Y_ét` as the oriented product of their small étale topoi" for `X→S←Y`.
- **Universal property.** `:3136` describes maps from a topos `T` as two maps and a natural transformation in the specialization orientation.
- **Site.** `:3136` requires "the Cartesian refinements of the middle base neighborhood".
- **Projections and two-cell.** `:3138` gives "the two projections and the specialization, with their universal compatibility".
- **Scheme points and shreds.** Points are triples (`x,y`,sp) (`:3136`); `:3138` gives restriction at a fixed specialization, and `:3141` shows the generic-to-closed shred.
- **Coherent qcqs case.** `:3138` says that for qcqs schemes the site is coherent.

The README's own notation is `X ←×_S Y` and `Y_• ←×_(S_•) X_•` (`:672`, `:734`), so `X_ét ←×_(S_ét) Y_ét` is consistent with it. The string `OrientedEtaleProduct` now appears nowhere in the folder or in the supplier.

Five passages cite the same supplier section, and the change leaves each consistent:
- Scope `:15` ("the general-base oriented product of small étale topoi of schemes, its site, projections and scheme-point specialization formula").
- §3.1 `:672`, `:692` and `:694`.
- Layer 3 Dependencies `:814`.

The orientation agrees. §3.1 (`:692`) has points (x, y, g(y) ⇝ f(x)), and the supplier has "sp a specialization arrow from the image of `y` to the image of `x`" (`:3136`).

### Seeded sample falling near the change

§3.6 relies on the oriented products of §§3.1–3.5, which use the supplier object. I checked it against two texts:
- **ILO14 lines 9093–9107** (v1 XII Théorème 2.2.4, printed p. 192): noetherian diagram, torsion complex bounded below, base-change map an isomorphism.
- **ILO-final-XII lines 290–333** (XIIA Théorème 2.2.5 and Remarque 2.2.6.1, pp. 243–244):
  - h-hypercovering, with coherence on the map whose direct image is taken (named g there, f in the README, as the README says);
  - extension to any torsion ring, and to torsion cohomology;
  - the counterexample without coherence at lines 300–309.

The README's statement, both cases and its locators match. The other fourteen seeded targets (0.7, 1.4, 1.6, 1.7, 2.3, 6.1, 6.2, 6.5, 6.6, 6.7, 6.9, 8.2, 8.3, 8.6) lie in untouched text that earlier reviews of this pull request passed. §§1.4, 2.3 and 8.6 are in the previous report's sample table.

### Adversarial table

New rows, computed in this review, for the changed statement and the sample target near it:

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| `README.md:142`, CAEC §5.4 oriented étale product (changed) | X = Y = S a strict trait; X = Y = S = Spec of a separably closed field; stalk at (s, η) for X = S, F = Λ | Trait: points (s,s), (η,η), (s,η), 3 against 2 for the ordinary S ×_S S = S, so the plausible wrong model (fibre product of topoi) is excluded, as CAEC `:3138` and README `:704` say. Separably closed field: 1 point on both sides (CAEC Check, README §3.1 punctual Check). Stalk: CAEC RΓ(X_(s) ×_(S_(s)) S_(η̄), Λ) = RΓ(η̄, Λ) = Λ in degree 0. README `:700` gives the same, RΓ(X_(x) ×_(S_(f(x))) η̄, Λ) = Λ. Reversed pair (η, s) is absent on both sides. | consistent; prose matches supplier |
| §3.6 hyper-base-change (sample) | constant hypercover; S = Spec k[t], X = Spec k(t), K = ℤ/n; strict trait, j : η → S, Λ of invertible order; Bl₀ 𝔸²_ℂ, Λ = ℤ/3; source counterexample (Dedekind S, X = s₀, Y = ⊔_(i≥1) s_i) | Constant: identity on both sides. k(t): generic geometric H⁰ = ℤ/n on both sides. Trait: closed stalk of Rj_*Λ has H⁰ = Λ, H¹ = Hom(ℤ_ℓ(1), Λ) = Λ(−1); j_* gives H¹ = 0. Blow-up: E = ℙ¹, H²(E) = Λ(−1) → H²(E×E) = Λ(−1)², h ↦ h₂ − h₁ ≠ 0, so the totalization has H² = 0, matching H²(Λ) = 0 on the left; the constant simplicial E would give Λ(−1) ≠ 0. Counterexample: Y → S is not quasi-compact, so it is excluded by noetherianity in the first case and by coherence in the second. The oriented product is empty (no s_i ⇝ s₀), right side 0, while f^*g_*ℤ/n ≠ 0. | holds; both hypotheses needed |

Rows carried forward unchanged from the previous report (PRREVIEW~19, at 975ac17). The diff leaves all these statements untouched, and the values are those computed there:

| Statement | Values (carried from PRREVIEW~19) | Result |
| --- | --- | --- |
| §0.4 criterion, prime-to-ℓ | k = 𝔽_p(t), k(t^(1/p))/k: ℓ = p not covering on both sides; ℓ ≠ p covering on both sides | holds |
| §0.4 negative | 𝔾_m ⊂ 𝔸¹: valuation centred at 0 does not lift | holds |
| §0.5 a-isomorphism | k⟦t⟧ against k, a = 1: gr¹₁ = k against 0 | not 1-close, as the Check says |
| §1.4 / `MixedCohenGabberPresentation` | identity on ℤ_p⟦x⟧, degree 1; V = W[π]/(π^ℓ − p) degree ℓ; t ↦ x^p not étale at the p-fibre | holds |
| §2.3 / §0.3 form (1) | 𝔽₃[t]_(t), x³+x²+2x+t, ℓ = 2: closed fibre 𝔽₃ × 𝔽₉, no odd-degree lift | consistent |
| §3.2 tube base change | strict trait, X = s, Y = η: Λ ⊕ Λ(−1)[−1] on both sides | equal |
| §3.3 B and h-covers | K ⊗_k K not noetherian; D(t), D(t−1) cover 𝔸¹ | holds |
| §3.5 descent | Čech nerve of Y ⊔ Y → Y: equalizer = diagonal; ℚ/ℤ identity | holds |
| §4.2 finiteness | snc ranks (1), (1,1), (1,2,1); Artin–Schreier H¹(𝔸¹, ℤ/p) infinite | bounded; n invertible needed |
| §5.2 (1) | Nagata's non-universally-catenary domain: no δ; trait δ = (1, 0) | holds |
| §5.8 / `cohomologicalDimension_le_of_strictlyLocal` | k⟦t⟧: H¹ ≠ 0 at 2d − 1 = 1; punctured k⟦x,y⟧: H³ ≠ 0, 3 < 4; d = 0 excluded by `hd` | holds, sharp |
| §6.4 top class | trait H²_x(Λ(1)) = Λ, H³_x = 0; surface H⁴_x(Λ(2)) = Λ | holds |
| §6.10 shifts | Λ = ℤ/6: n₂ = (−2, 0), n₃ = (−3, −1), ⌊−n/2⌋ = (1, 0) | δ recovered |
| §6.11 (R01) | d = 0, 1, 2: Λ, Λ(1)[2], Λ(2)[4]; n = 6 splits | holds |
| §6.12 (R01) | strict trait, F = Λ, K = Λ(1)[2]: H²_x(Λ) = Λ(−1) = Hom(Λ(1), Λ), other degrees 0 = 0 | equal |
| §7.1 (R01) | d = 1, f uniformizer: H^(>1)(η) = 0; f = 0 empty | holds |
| §7.3 (R01) | k⟦x,y⟧, f = x: i = 0, 1 bijective 0 → 0; i = 2: 0 → ℤ/ℓ(−1) injective, not onto; f = 0 identity | holds, range sharp |
| §8.6 supports | 𝔽_p, ϖ = 0, G = ℤ/ℓ: H⁰ = H¹ = ℤ/ℓ on both sides, including ℓ = p | holds |
| `cohenGabber_equalCharacteristic` | cusp at p = 2, 3: ranks 3 and 2 with nonzero partials; d = 0: MvPowerSeries (Fin 0) k = k | holds |
| `cohenGabber_equivariant` | μ₂ on k⟦x⟧: t = x², degree 2; S₃: degree 6; char 2 involution excluded by `horder` | holds |
| `cohenGabber_mixedCharacteristic` | ℤ_p⟦x⟧, d = 2; Q₈ is a 2-group; S₃ fails `IsPGroup 2` | holds |
| `partialAlgebraization_equalCharacteristic` | k⟦x,y⟧/(xy): 0 + 1 = 1; a field excluded by `hpos` | holds |
| `partialAlgebraization_mixedCharacteristic` | ℤ_p⟦x⟧ with (x − p): 1 + 1 = 2; ramified V-structure absent (2v₃(b₀) = 1) | holds |
| `affineLefschetz_strictlyLocal` | strict trait n = 2: H¹ ≠ 0 at q = d; non-noetherian V of rank 1 excluded by `IsGRing` | holds |
| `cohomologicalDimension_fractionRing_eq` | ℤ_p: 2 = 1 + 1; W(k̄)⟦x⟧: 2 = 2 + 0; henselized ℝ[x,y]/(x²+y²), ℓ = 2: 1 against ∞, excluded by `hreal`; 𝔽_p⟦t⟧, ℓ = p excluded by `IsUnit` | holds |

### Headlines, padding and binders

`Suggested.lean` is unchanged since 975ac17, and so are the pins. The previous report's results therefore stand:
- the eight headlines statable at the pins are stated, and the docstring names the rest with the carrier each lacks;
- the one-tactic probe (`first | rfl | simp | infer_instance | trivial`) leaves all 8 theorems open, so there is no padding;
- the `#check @` run on all 11 declarations shows no lost binder.

This review's build confirms the file still elaborates as before.

### Citations resolved in this review

- **ClassicalAdicEtaleCohomology** (#875 at fc1c03a): §5.4 at `README.md:3134–3141`, for the R02 repair. §5.3 (`:3055`) is still present, for §5.9.
- **PurityForFlatCohomology** (#1840 at d3f15fd9), for R01:
  - §1.4 `:1107` and §1.5 `:1160`;
  - import bullets `:206–207` and `:3471–3472`;
  - the §1.6 route `:1195` and its *Needs* at `:1201`.
- **EtaleCohomologyFoundations on main (4452ffa).** All six names `scratch/citations.md` flags as absent from the pins are present in that roadmap's README and `Suggested.lean`: `VanishingCycles.etaleTateTwists`, `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.lciCycleClass`, `ClassicalAlgebraic.smoothBoundaryPurity`, `VanishingCycles.etaleExceptionalInverseImage` and `VanishingCycles.smoothPurity`. They are supplier roadmap names, not library declarations.
- **PerfectoidQuotientsPartII** (the seventh lead): line 219 of the merge order, earlier than this roadmap (line 390), as the previous report found.
- **Library declarations.** The diff cites none, and the pins are unchanged, so the previous report's 72 `#check`s (0 errors) stand.
- **`scratch/overlaps.md`** (index of 2026-11-10T02:38:19Z): no other pull request changes this roadmap, and no cited id is dropped or defined only by a revision. Among the closest roadmaps, PurityForFlatCohomology is R01.

### Declared gaps

The diff touches none of the five gap contracts (`:82`, `:86`, `:98`, `:116`, `:132`). The previous report found them equal to `design/plan.json`, precise and minimal.

## Not verifiable

- **Ill03, Epp73, Ser65.** They are settled as uncertified and are cited by locator; this diff does not touch them.
- **The published ILO XII** (Exposé XII of the 2014 Astérisque volume) is in the cache only as the XIIA chapter (ILO-final-XII). The v1 misprint below does not occur there, because the published statement defines Y_• only through base change.

## Source issues

- **Misprint** in ILO14 at XII Théorème 2.2.4, p. 192 (arXiv v1; ILO14 line 9099): the source defines the base-changed hypercover of Y as X ×_S S_•; it should be Y ×_S S_•, as the following εY uses; affects nothing; corrected in print at ILO-final-XII Théorème 2.2.5, p. 243.

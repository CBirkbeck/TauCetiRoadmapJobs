# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 5a1f55a)

**Verdict:** needs changes

This is a full review of the same head the previous review read (5a1f55a); the folder has not changed. There are four findings:

- **R01 (P2)** is the previous R01. PurityForFlatCohomology has not moved, so local Lefschetz and local duality still have two owners.
- **R02 (P2)** is new. Tau Ceti at the pin now has an integral perfectoid predicate, so the tilting headline of §8.5 is statable but absent.
- **R03 and R04 (P3)** are a line locator and the pull-request description.

## R01 (P2) — Local Lefschetz and local duality still have two owners

**Location.**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements."
- `README.md:1648` says the same.

**Claim.** This roadmap claims to be the sole owner of four statements: §7.1 (affine Lefschetz on principal punctured opens), §6.11 (the normalised dualizing complex), §6.12 (local duality) and §7.3 (local Lefschetz).

**Witness.** PurityForFlatCohomology is still at d3f15fd. In `TauCetiRoadmap/PurityForFlatCohomology/README.md`:
- §1.4 (`:1107`) states this roadmap's §§7.1, 6.11 and 6.12.
- §1.5 (`:1160`) states §7.3.
- `:206–207` and `:3471–3472` say that this roadmap is "to import" them.
- `:1201` cites its own §1.5.

So each roadmap hands the same statements to the other.

**Why the owner is this roadmap.** PurityForFlatCohomology §1.4 calls its clauses "Gabber's theorems at the locators above", and its *Needs* line has nothing that proves them. Here they follow from §5.7 and §§6.3, 6.6 and 6.9, which have routes. No repair report marks this finding "not actionable".

**Repair** (in PurityForFlatCohomology; this folder is right once that lands):
1. Delete its §§1.4–1.5, together with the import bullets at `:206–207` and `:3471–3472`.
2. Cite EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12 and 7.3 in their place.
3. At `:1195`, replace "(§1.5:" with "(EtaleDualityAndPerverseSheavesPartII §7.3:".
4. At `:1201`, replace "§§0.2, 1.1, 1.5" with "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

**Test** (re-run on today's merge order). I applied the `:1201` edit to a scratch copy of the d3f15fd README and ran the dependency check (`--name PurityForFlatCohomology --pr 1840 --movable`). It printed:
- `moved: PurityForFlatCohomology moved in the merge order from #220 to #390, right after its last supplier EtaleDualityAndPerverseSheavesPartII`
- `depcheck: 233 roadmaps, 2260 edges, 0 problem(s)`

## R02 (P2) — The tilting headline of §8.5 is statable at the pins but absent

**Location.**
- `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/Suggested.lean:53–55`: "Algebraic tilting of matched-open idempotents, étale cohomology and support complexes needs henselian perfectoid pairs, sharp quotients, matched opens and their derived étale sections. PreTilt alone supplies none of those hypotheses."
- Also `README.md:57`: "Perfectoidness and a sharp-quotient theorem are separate inputs".

**Claim.** The algebraic tilting of étale cohomology (§8.5) is a headline (`README.md:3`), and the docstring says it is not statable at the pins.

**Witness.** The pinned Tau Ceti (2fd255d) has `TauCeti.Perfectoid.IsIntegralPerfectoid`, in `TauCeti/RingTheory/Perfectoid/Integral.lean:76`. Mathlib has `HenselianRing`, `Perfection.coeff` (`Mathlib/RingTheory/Perfection.lean:206`), `PreTilt.untilt` (`Mathlib/RingTheory/Perfectoid/Untilt.lean:49`) and `Sheaf.H`. The block below, built only from these, elaborates.

**What the block expresses.**
- `Perfection (A ⧸ Ideal.span {ϖ}) p` is §8.1's `A^♭ = lim_(a ↦ a^p) A/ϖA`.
- Matched opens are expressed through `PrimeSpectrum.comap` of `Ideal.Quotient.mk` and `Perfection.coeff _ p 0`. These are native maps, so matched opens need no new carrier.
- The per-degree form loses only functoriality. Over ℤ every complex is quasi-isomorphic to the sum of its shifted cohomology. So "RΓ_ét(U, G) ≅ RΓ_ét(U^♭, G)" in D(Ab) is equivalent to an isomorphism of `H^q` in every degree.

**Repair.**
- Add the following under `/-! ## Layer 8: Tilting étale cohomology of henselian perfectoid pairs -/`, with `public import TauCeti.RingTheory.Perfectoid.Integral`:

```lean
theorem etaleCohomology_tilt (p : ℕ) [Fact p.Prime] (A : Type u) [CommRing A]
    (ϖ : A) (hϖ : ϖ ^ p ∣ (p : A)) [HenselianRing A (Ideal.span {ϖ})]
    (hbdd : ∃ N : ℕ, ∀ (a : A) (n : ℕ), ϖ ^ n * a = 0 → ϖ ^ N * a = 0)
    [TauCeti.Perfectoid.IsIntegralPerfectoid p (AdicCompletion (Ideal.span {ϖ}) A)]
    [CharP (A ⧸ Ideal.span {ϖ}) p]
    (U : (Spec (CommRingCat.of A)).Opens)
    (V : (Spec (CommRingCat.of (Perfection (A ⧸ Ideal.span {ϖ}) p))).Opens)
    (hU : ∀ x : PrimeSpectrum A, ϖ ∉ x.asIdeal → x ∈ U)
    (hV : ∀ y : PrimeSpectrum (Perfection (A ⧸ Ideal.span {ϖ}) p),
      (∀ z, PrimeSpectrum.comap (Perfection.coeff (A ⧸ Ideal.span {ϖ}) p 0) z ≠ y) → y ∈ V)
    (hUV : ∀ z : PrimeSpectrum (A ⧸ Ideal.span {ϖ}),
      PrimeSpectrum.comap (Ideal.Quotient.mk _) z ∈ U ↔
        PrimeSpectrum.comap (Perfection.coeff (A ⧸ Ideal.span {ϖ}) p 0) z ∈ V)
    (G : Type u) [AddCommGroup G] (hG : IsAddTorsion G) (q : ℕ) :
    Nonempty
      ((((constantSheaf U.toScheme.smallEtaleTopology AddCommGrpCat.{u}).obj
          (AddCommGrpCat.of G)).H q) ≃+
        (((constantSheaf V.toScheme.smallEtaleTopology AddCommGrpCat.{u}).obj
          (AddCommGrpCat.of G)).H q)) := by
  sorry
```

- In the README:
  - name `etaleCohomology_tilt` in §8.5;
  - cite `TauCeti.Perfectoid.IsIntegralPerfectoid` under "From Tau Ceti", and `Perfection.coeff` under "From Mathlib";
  - update `README.md:57`, `:74` ("exactly two Tau Ceti modules") and `:158` ("eight headline signatures").
- In the docstring, keep as not statable only what still lacks a carrier:
  - the support complexes of §8.6, which need a support functor;
  - the functoriality of the comparison, which needs a constructed map.

**Test.**
- The block elaborates at the pins (`lake env lean` on a scratch file) with only the `sorry` warning. It needed `lake build TauCeti.RingTheory.Perfectoid.Integral` first; the worktree was unchanged.
- It is not vacuous. For A = 𝔽_p, ϖ = 0 every hypothesis holds: (𝔽_p, 0) is henselian, N = 1 bounds the torsion, and the completion is 𝔽_p, which is perfect. The two whole spectra are matched, and both sides are ℤ/ℓ in degrees 0 and 1 and zero above, including ℓ = p.
- The previous review relied on "No perfectoid-ring predicate exists in the pinned Mathlib … or in Tau Ceti" (PRREVIEW~19). That is false at this pin: the Tau Ceti commit adding the predicate (9ae7557, 2026-11-02) is an ancestor of the pin 2fd255d (2026-11-04).

## R03 (P3) — §2.1 line locator points into Théorème 1.1

**Location.** `README.md:580`: "ILO14, Exposé IX, Théorème 1.2, p. 131 (printed); ILO14 line 5896".

**Witness.** ILO14 line 5896 is clause (i) of Théorème 1.1 ("Xi soit régulier et connexe"). Théorème 1.2 begins at ILO14 line 5901.

**Repair.** Replace "ILO14 line 5896" with "ILO14 line 5901". The theorem number and page are correct.

## R04 (P3) — The pull-request description's dependency paragraph omits two cited suppliers

**Location.** In the pull-request description, the "Dependencies" paragraph, which is author text outside the generated blocks:
- "In open pull requests of ours: #1227 (StableHomotopyKTheory), … #1040 (EtaleDualityAndPerverseSheaves)."
- "everything else named in the README is a consumer, not a prerequisite."

**Witness.** The README cites, as suppliers:
- ArcTopologyAndDescent §§1.3, 3.6, 8.6–8.9, 11.1–11.2, 11.5, 12.6 (`README.md:21`, `:136–138`), which is #1755;
- AdicCoefficientsAndComparisonsPartII §§PA.0–PA.5 (`:13`, `:100–102`), which is #1796;
- PerfectoidQuotientsPartII §§Q5.1–Q6.7 (`:152–154`), which is neither on main nor in a pull request.

The first two are missing from the list; the third is a prerequisite.

**Repair.**
- Add "#1755 (ArcTopologyAndDescent), #1796 (AdicCoefficientsAndComparisonsPartII)" to the list. The generated depends-on block already has both.
- Replace the last sentence with one that names PerfectoidQuotientsPartII as a supplier not yet in a pull request: merge-order line 219, before this roadmap's line 390.

## Previous findings

- **R01 (PRREVIEW~20) — not repaired.** `README.md:23` still says PurityForFlatCohomology "owns none of these statements". At d3f15fd that roadmap still states §1.4 (`:1107`) and §1.5 (`:1160`), and cites its own §1.5 at `:1201`. It is carried forward as R01.

## Verified sound

### Gate, dependency check, build and diff (run on this head)

- **Gate.** `tauceti-roadmap gate … --base origin/main` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exited 0. The worker's `gate.md` adds `build=0`.
- **Dependency check** (`--movable`, `--pr 1743`), output in full: `depcheck: 233 roadmaps, 2259 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Build.** `lake env lean` on `Suggested.lean` exited 0 in 16 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 332.
- **Diff.**
  - The diff outside the folder against `origin/main` is empty.
  - The folder holds only README.md, Suggested.lean and metadata.toml.
  - The head equals the one PRREVIEW~20 read, so `scratch/changes.md` is empty.

### Seeded sample: the 15 targets against their sources

| Target | Locator read | Theorem, page and hypotheses | Verdict |
| --- | --- | --- | --- |
| 2.1 | DJ97 lines 71–85, 100–116, 139–162; ILO-final-IX lines 35–62; ILO14 lines 5901–5934 | DJ97 Thm 2.4 (iv)–(vi) with Rem 2.5, pp. 602–603. Published IX 1.2, p. 161, has "géométriquement irréductible" and conditions (2.1.1) and (2.1.5), and its conclusions (i)–(vi) match the README clause by clause. | Supported. ILO14 line is R03; v1 slip is in Source issues. |
| 2.3 | ILO14 lines 5893–5898; ILO-final-IX lines 27–32 | IX 1.1, p. 131: noetherian quasi-excellent X, Z rare, ℓ invertible, alt_ℓ′-covering family, regular connected (published: "intègre", equivalent for noetherian regular) with snc preimage. | Matches. |
| 2.4 | ILO-final-XIII lines 99–108; ILO14 lines 10471–10474; ILO-final-II line 301 | XIII 2.2.2, p. 263: h-hypercover on finite-type X-schemes, X_i regular, U-part snc complement or empty, h as XIIA 2.1.3. XV 3.1.2: X_q may be taken affine. | Matches; the prime-to-ℓ refinement is this roadmap's own target, with its route via §§2.3, 0.3. |
| 3.2 | ILO14 lines 8381–8391 | XI 2.4 and Lemme 2.5, pp. 178–179: X, Y, S coherent, f, g coherent, any ring Λ, F ∈ D⁺(Y, Λ). | Matches. |
| 3.3 | ILO-final-XII lines 218–277 | XIIA 2.1.1–2.1.5 and 2.2.1–2.2.2, pp. 241–243: five generators (iv) proper and (v) étale, matching objects in the category of diagrams. The README swaps X and Y, as v1 (ILO14 lines 9020–9061) does, and says so. | Matches. |
| 3.5 | ILO-final-XII lines 279–282, 324–333, 349; ILO14 lines 9065–9082 | XIIA 2.2.3 with ℤ/n; Rem 2.2.6.1 for any torsion ring, and torsion cohomology with coherent morphisms; v1 XII 2.2.1(i) for noetherian diagrams with bounded-below torsion complexes. | Matches. |
| 3.6 | ILO14 lines 9093–9107; ILO-final-XII lines 290–322 | v1 XII 2.2.4(i) (noetherian); published 2.2.5, pp. 243–244 (g coherent, ℤ/n), with the counterexample at lines 300–309. | Matches (v1 misprint in Source issues). |
| 5.1 | ILO14 lines 9869–9877, 9979–9994, 10010, 10182 | XIV 2.1.1–2.1.2: codimension is the dimension of the closure of the image of x̄ in X(ȳ). 2.1.8: δ(y) = δ(x) − 1. Rem 2.2.3; Cor 2.4.5 (local universally catenary); pp. 209–216. | Matches. |
| 5.2 | ILO14 lines 9997–10003, 10046, 10057, 10085, 9993–9994 | XIV 2.2.1, 2.2.2, 2.2.6, 2.3.1, 2.3.3, pp. 212–214, and the étale ℤ-torsor remark. | Matches. |
| 5.3 | ILO14 lines 10216–10231 | XIV Lemme 2.5.3, pp. 216–217: f qcqs, g regular between noetherian schemes, n invertible on S, F a ℤ/n-sheaf. | Exact. |
| 5.6 | ILO14 lines 10333–10353, 10400–10418 | XV 1.1.2, p. 219: quasi-excellent X, f affine of finite type, F constructible. Cor 1.2.2; Déf 2.1.4, 2.1.5 and Prop 2.1.7, pp. 220–221. | Matches. The README's note on 2.1.4(iii) is right (Source issues). |
| 5.7 | ILO14 lines 10362–10375, 396–399 | XV Cor 1.2.4, p. 220. 1.2.5 uses quasi-excellence only for regularity of X̂ → X. Exposé 0 Cor 8, p. 5. | Matches. |
| 6.4 | ILO14 lines 12855–12877 | XVII 3.1.1, p. 268: normal strictly henselian excellent local ℤ[1/n]-scheme. 3.1.2: noetherian excellent, finite-map compatibility. Rem 3.1.3. | Matches. |
| 8.2 | CS24 lines 502–516 | (2.1.7.2), p. 13: perfectoid, ϖ-adically complete, ϖ^p ∣ p. | Matches. |
| 8.3 | CS24 lines 827–851 | Thm 2.2.7 and first part of proof, pp. 21–22. The README replaces BČ22's completion step with ArcTopologyAndDescent §8.9 in degree 0 with ℤ/2, plus `PrimeSpectrum.isIdempotentElemEquivClopens`. | Matches. |

Beyond the sample I also read, at their locators:
- §0.3 against ILO14 lines 1414–1423 and ILO-final-II lines 301–377;
- §0.4 against ILO-final-II lines 485–527;
- §§1.1–1.2 against ILO14 lines 2276–2284 and 2419–2422;
- §1.3 against ILO14 line 2524;
- §1.4 against ILO14 lines 2677–2681 and 2729–2740, including Saitô's example at lines 2748–2757;
- §§1.5–1.7 against ILO14 lines 2884–2892 and 2957–2982;
- §5.8 against ILO14 lines 16193–16217;
- §5.9 against SGA4 lines 1219–1245 and 1330–1375.

### Adversarial table

Rows for the sampled targets, the headlines and the targets the findings touch. Every value was computed in this review.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| 2.1 de Jong alteration | (a) f smooth projective curve, Z = disjoint sections. (b) X_η = ℙ¹_L over K, L/K separable of degree 2. | (a) G = 1, a = b = id, D = Z. (b) Geometrically connected fibres make K(Y′) algebraically closed in K(X′), hence K = K(Y′)^G algebraically closed in K(X′)^G = L(t), contradicting L ⊋ K algebraic. | Holds; geometric irreducibility needed (published), as the README states |
| 2.3 prime-to-ℓ uniformization (Check) | R = 𝔽₃[t]_(t), x³ + x² + 2x + t, ℓ = 2 | At t = 0: x(x² + x + 2), discriminant 1 − 8 ≡ 2, a non-square mod 3, so the fibre is 𝔽₃ × 𝔽₉. Generic degree 3 (linear in t, irreducible). Without the rational point, the only closed point has degree 2. The fixed field of a 2-Sylow of the henselian field omits the unramified quadratic extension, so that test lifts only through the deleted point. | alt-cover, not alt_2′; consistent |
| 2.4 scheme h-hypercover | Bl₀𝔸²_ℂ; augmentation Spec k → Spec k[ε]; X = ∅ | E × E ⊂ T ×_X T has dimension 2, so the diagonal is not surjective and the constant T fails; Čech nerve passes. Reduction gives degree 1. ∅ → ∅. | Holds |
| 3.2 tube base change | strict trait S, X = s, Y = η, F = Λ; S = point | Left (Rj_*Λ)_s = Λ ⊕ Λ(−1)[−1]; right RΓ(η, Λ) = Λ ⊕ Λ(−1)[−1]. Point: both RΓ(Y, F). | Equal |
| 3.3 h-oriented topology | Bl₀𝔸² as type (iv); D(t), D(t − 1) on 𝔸¹; K = k(t₁, t₂, …) | (S′ → S′ ← S′) has Y ×_S S′ = S′ ✓. (t, t − 1) = (1). Ideals (tᵢ ⊗ 1 − 1 ⊗ tᵢ)_{i ≤ m} strictly increase. | Holds |
| 3.5 descent | constant hypercover; Čech nerve of Y ⊔ Y → Y; ℚ/ℤ on a point | K → K. Equaliser of M² ⇉ M⁴ is the diagonal M. ℚ/ℤ → ℚ/ℤ, with no exponent. | Holds |
| 3.6 hyper-base-change | strict trait, constant hypercover; Bl₀𝔸²_ℂ, Λ = ℤ/3 | Closed stalk H⁰ = Λ, H¹ = Λ(−1) on both sides. Constant blow-up gives H² = Λ(−1) ≠ 0 = left side. Čech: h ↦ h₂ − h₁ ≠ 0, so H² = 0. | Holds; matching condition needed |
| 5.1 dimension functions | 𝔸¹_R, closed point (πt − 1); line ∪ plane; strict trait | dim closure: 2 at η, 0 at x, difference 2 ≠ 1; −dim O gives 0, −1 ✓. At the meeting point −dim O = −2 but δ must be −1. Trait: (1, 0). | Checks hold |
| 5.2 existence | Nagata's catenary non-universally-catenary domain; normal qe | No Zariski-local δ, by (1). −dim O is a δ, by 2.3.3. | Consistent |
| 5.3 regular base change | k[t]_(t), z² = 1 + t; strict A, U ⊆ Spec A | Over A no section (1 + t not a square in k(t)); over k⟦t⟧, √(1 + t) exists. Strict: H^q(U) = H^q(U ×_A Â) at closed stalks. | Holds; henselianity needed for global form |
| 5.6 branch comparison | t ↦ u^ℓ; t ↦ vu; x ↦ v, y ↦ u | [t] ↦ ℓ[u] = 0, so H¹ map 0 although branch counts agree. [t] ↦ [u] + [v] = [u]. On H², [x]∪[y] ↦ −[u]∪[v]: 1 mod 2, 2 mod 3. | Cotangent condition needed; iso need not preserve order |
| 5.7 / `affineLefschetz_strictlyLocal` | strict trait, U = η; d = 0; punctured k⟦x,y⟧; non-noetherian V with value group ℤ + ℤ√2 | H¹(η) = ℤ/n(−1) ≠ 0 at q = d = 1. d = 0: H^{>0} = 0. H³(U) = ℤ/ℓ(−2) with 3 > 2, so affineness needed. H²(K, ℤ/ℓ) = ∧²(ℤ/ℓ)² ≠ 0 > d = 1, excluded by noetherianity in `IsGRing`. | Holds, sharp |
| 5.8 / `cohomologicalDimension_le_of_strictlyLocal` | k⟦t⟧; punctured k⟦x,y⟧; d = 0 | H¹(η) ≠ 0 at q = 1 < 2. H³ ≠ 0 at 3 < 4. Spec k: H⁰ ≠ 0 at q = 0 = 2d, excluded by `hd`. | Holds; `hd` needed |
| 5.9 / `cohomologicalDimension_fractionRing_eq` | ℤ_p; W(k̄)⟦x⟧; ℝ[x,y]/(x² + y²)^h with ℓ = 2, 3; 𝔽_p⟦t⟧, ℓ = p | 2 = 1 + 1; 2 = 2 + 0. ℓ = 2: 1 vs 1 + ∞, excluded by `hreal`. ℓ = 3: 1 = 1 + 0. ℓ = p excluded by `IsUnit`. `#check` shows `cohomologicalDimensionAt.{u_1, u_1}` on both sides. | Holds |
| 6.4 top class | d = 0, 1, 2 | Λ in degree 0; H²_x(Λ(1)) = Λ (Kummer); H⁴_x(Λ(2)) = Λ. | Holds |
| 6.11 (R01) | d = 0, 1, 2; n = 6 | Λ, Λ(1)[2], Λ(2)[4]; μ₆[2] = μ₂[2] ⊕ μ₃[2]. | Holds |
| 6.12 (R01) | strict trait, F = Λ, K = Λ(1)[2] | H²_x(Λ) = Λ(−1) = Hom(Λ(1), Λ); every other degree 0 = 0. | Equal |
| 7.1 (R01) | d = 1, f uniformizer; f = 0 | H^{>1}(η) = 0; empty open. | Holds |
| 7.3 (R01) | k⟦x,y⟧, f = x; DVR, f = π | i = 0: 0 → 0; i = 1: 0 → 0; i = 2: 0 → ℤ/ℓ(−1), not onto. DVR i = 0 = d − 1: 0 → ℤ/ℓ, injective, not onto. | Holds, range sharp |
| 8.2 | 𝔽_p, ϖ = 0; perfect A | Both localisations 0, limit a singleton (not p elements); identity. | Holds |
| 8.3 | ℤ_(7)[t]/(t² − 2), ϖ = 7; 𝒪_C × 𝒪_C | 3² = 9 ≡ 2 mod 7, so A/7 = 𝔽₇ × 𝔽₇ has 4 idempotents while the domain A has 2: not henselian, completion has 4. Product: 4 on each side, (1,0)(0,1) = 0. | Holds; henselianity needed |
| 8.5 (R02) | 𝔽_p, ϖ = 0, G = ℤ/ℓ; 𝒪_C × 𝒪_C, U = Spec C ⊔ Spec C | Perfection 𝔽_p ≅ 𝔽_p; H⁰ = H¹ = ℤ/ℓ on both sides, H^{≥2} = 0, including ℓ = p (Artin–Schreier). G² in degree 0 on both sides, 0 above. | Statable form elaborates; nonvacuous |
| `cohenGabber_equalCharacteristic` | cusp at p = 2, 3; d = 0 | p = 2, t ↦ y: X³ − t², derivative X² ≠ 0, degree 3 separable. p = 3, t ↦ x: derivative 2y ≠ 0, degree 2. d = 0: `MvPowerSeries (Fin 0) k = k`, A = k. | Holds |
| `cohenGabber_equivariant` | μ₂ on k⟦x⟧; S₃ on k⟦x₁,x₂,x₃⟧; char 2, x ↦ x/(1 + x); non-equidimensional k⟦x,y,z⟧/(xy, xz) | t = x², degree 2. Degree 6. σ²(x) = x/(1 + 2x) = x, Nat.card 2 not a unit, excluded. Line component is torsion over k⟦t₁,t₂⟧ and dies in the generic fibre. | Holds |
| `cohenGabber_mixedCharacteristic` | ℤ_p⟦x⟧, H = 1; V = W[π]/(π^ℓ − p) with μ_ℓ; Saitô's B = W′⟦x,z⟧/(xz − π); t ↦ x^p | Degree 1. [Frac B : Frac A] = ℓ, invariant degree 1. Primes over (π): (π, z) has x a unit, étale ✓. p x^{p−1} vanishes on the p-fibre, so it fails `etaleAtPFibre`. | Holds; field discriminates |
| `partialAlgebraization_equalCharacteristic` | k⟦x,y⟧/(xy) with (x), (y); a field | B = k, 0 + 1 = 1, C = k[x,y]/(xy). `hpos` false for a field. | Holds |
| `partialAlgebraization_mixedCharacteristic` | ℤ_p⟦x⟧, (x − p); W(𝔽̄₃)[π]/(π² − 3), C₂ | B = ℤ_p, 1 + 1 = 2. b₀² = 3 forces 2v₃(b₀) = 1, so no V-structure on A′ = W⟦x⟧. | Holds |
| R03 §2.1 locator | ILO14 lines 5893–5903 | Line 5896 = 1.1(i); 1.2 begins at 5901. | Wrong line |

### Headlines, padding and binders

- **Headlines in the README.**
  - Stated in Lean: Cohen–Gabber (§§1.1, 1.2, 1.4), partial algebraization (§§1.6–1.7), local affine Lefschetz (§5.7), the cd bound (§5.8), the fraction-field formula (§5.9).
  - Named in the docstring as not statable: uniformization (§§2.2–2.3), oriented descent (§§3.5–3.6), finiteness (§4.2), dimension functions (§5.2), affine Lefschetz over schemes (§5.6), top classes (§6.4), t-structures (§6.5), dualizing complexes and local duality (§§6.6–6.12), local Lefschetz (§7.3).
  - The tilting headlines (§§8.3–8.6) are also named as not statable, but §8.5 is statable at the pin (R02).
  - I checked the carriers each "not statable" entry claims are missing. The pinned Mathlib and Tau Ceti have no quasi-excellent schemes, constructible étale sheaves, alteration sites or étale support functors.
- **Padding.** I replaced every `sorry` by `first | rfl | simp | infer_instance | trivial | decide` in a scratch copy. All 8 theorems stay open: seven fail every tactic, and `cohenGabber_equivariant` is left with unsolved goals after `simp`. No padding.
- **Binders.** I ran `#check @` on all 11 declarations in one scratch file. Each elaborated type carries every hypothesis of its README statement (for instance `hequi`, `horder`, `hd`, `htors`, `hreal`), and the structures keep their stated parameters. Nothing changed against `scratch/signatures.md`.

### Library declarations opened at the pins

- **The batch `#check`.** I `#check`ed all 76 Mathlib and Tau Ceti declarations the README backticks, at Mathlib 1b1ccf4 and Tau Ceti 2fd255d. 76 elaborate. The one error is the bare shorthand `Sheaf.H`, which the supplier table spells `CategoryTheory.Sheaf.H` (`README.md:58`).
- **Signatures compared with the README's descriptions:**
  - `TauCeti.Excellence.IsGRing.regularAlgebraMap_adicCompletion` (completion of every localisation regular);
  - `TauCeti.AdicCompletion.ringKrullDim_eq` (noetherian local);
  - `TauCeti.cohomologicalDimensionAt_le_of_isClosed`;
  - `TauCeti.cohomologicalDimensionAt_eq_of_isOpen_of_ne_top` (needs cd ≠ ⊤);
  - `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq`;
  - `TauCeti.IsProP.cohomologicalDimensionAt_le_iff_subsingleton_cohomFp` (Hⁿ⁺¹ with 𝔽_p);
  - `TauCeti.galoisSubgroup` (needs `FiniteDimensional`);
  - `Module.Baer.zmod_self` (`NeZero n`);
  - `IsAdicComplete.henselianRing`.
- **Universes.** With `pp.universes`, every Tau Ceti cd lemma above instantiates `cohomologicalDimensionAt.{u_1, u_1}`, that is v = u, as `README.md:72` says.
- **The definition.** `cohomologicalDimensionAt`, in `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146`, is the least n with vanishing for discrete p-primary torsion modules in `Type (max u v)`.

### Cross-roadmap citations resolved

**At their open heads**, every cited section heading exists:
- ArcTopologyAndDescent (#1755, dfd2dd1): §§1.3, 3.6, 8.6–8.9, 11.1, 11.2, 11.5, 12.6.
- ClassicalAdicEtaleCohomology (#875, fc1c03a): §§5.3, 5.4.
- LefschetzPencilsAndVanishingCycles (#873, 306b5f0): §§0.2–0.5, 0.10, 6.2.
- EtaleDualityAndPerverseSheaves (#1040, 23180d4): §§0.1, 0.2, 1.1, 2.1, 2.2, 2.4, 2.11.
- DeformationAndDerivedPatchingAlgebra (#1034): §1.10.
- AlgebraicModuliForArithmeticGeometry (#853): §§6.0–6.1.
- NoncommutativeAndEquivariantIwasawa (#1307): §0.11.
- PerfectoidQuotients (#1042): §§0.4–0.6.
- AdicCoefficientsAndComparisonsPartII (#1796, d6d93fd): §§PA.0.2–0.8, 0.11, 1.2–1.4, 4.1–4.8, 5.1–5.4.

**On main (4ee3e19):**
- SchemeAndStackFoundations: §§0.7, 0.9, 0.12–0.16, 0.20–0.22, 2.11, 2.12, 2.15, 2.16, 4.16–4.20; `excellent_examples` at `:1421`.
- EtaleCohomologyFoundations: §§F.0.1, F.0.3, F.1, F.2.1, F.2.2, F.2.4, F.3, F.5, F.6, F.8, 0.7, 0.9, 0.10. The six names `scratch/citations.md` flags are that roadmap's targets at README `:1181`, `:443`, `:1135`, `:1147`, `:233` and `:1202`.
- EnhancedDerivedSheaves: §§0.1–0.4, E2, E2.6, E2.8.
- AdicEtaleGeometry: §§A1.14–A1.15.
- PerfectoidSpaces: §P1.24.

**PerfectoidQuotientsPartII.** It is a board package, at merge-order line 219, earlier than this roadmap's line 390 and in the brief's supplier list. Its §§Q5.1–Q5.3 and Q6.2–Q6.7 exist.

### Ownership and overlaps

- **Search.** I searched main and the 452 open heads for the defining objects: Cohen–Gabber, partial algebraization, local uniformization, dimension functions, oriented descent, affine Lefschetz, potential dualizing complexes and Gabber finiteness. The only second owner is PurityForFlatCohomology (R01). AdicCoefficientsAndComparisonsPartII §§PA.6.7–6.9 owns Gabber's global ℓ′-alteration theorems over fields and one-dimensional bases, not local uniformization over arbitrary quasi-excellent schemes.
- **A note for AdicCoefficientsAndComparisonsPartII, not a finding here.** Its README `:1756` names this roadmap's "Layers EQ.0, EQ.2 and EQ.6", which do not exist; Layers 0, 2 and 6 are meant.
- **`scratch/overlaps.md`.** No other pull request changes this roadmap, and no cited id is dropped or defined only by a revision.

### Declared gaps

The five slugs and `needs` sentences in `design/plan.json` are identical to the README contracts at `:82`, `:86`, `:98`, `:116` and `:132`. Each is minimal against its supplier:
- SchemeAndStackFoundations §0.14 on main has finite-étale invariance and smooth Elkik lifting, but not the finite-algebra algebraization.
- §0.21 has `excellent_examples`, but not henselization permanence.
- EtaleCohomologyFoundations §F.3 has generic base change only over fields and excellent traits.
- DeformationAndDerivedPatchingAlgebra §1.10 and LefschetzPencilsAndVanishingCycles §6.2 do not state the requested results.

## Not verifiable

- **Ill03, Epp73, Ser65.** They are settled as uncertified and are cited by locator.
- **Published Exposés XV and XVII of ILO.** They are not in the cache. The XV 2.1.4(iii) slip below is checked only in arXiv v1.

## Source issues

- **Misprint** in ILO14 at XII Théorème 2.2.4, p. 192 (ILO14 line 9099): the source defines the base-changed hypercover of Y as X ×_S S_•; it should be Y ×_S S_•, as ε_Y requires; affects nothing; corrected in print at ILO-final-XII Théorème 2.2.5, p. 243.
- **Misprint** in ILO14 at XIV Corollaire 2.5.2, p. 216 (ILO14 line 10201): the induced function adds the transcendence degree of k(f(y)) over k(y); it should be that of k(y) over k(f(y)), as Proposition 2.5.1 and the proof give; affects nothing.
- **Error** in ILO14 at Exposé 0, Corollaire 8, p. 5 (ILO14 line 400): the source deduces cd_ℓ(K) = d + cd_ℓ(k) for every integral X; it should assume ℓ ≠ 2 or k not orderable, since the henselised ℝ[x,y]/(x² + y²) gives 1 ≠ ∞ (SGA 4 X 2.3); affects a stated result.
- **Misprint** in ILO14 at XV Définition 2.1.4(iii), p. 220 (ILO14 line 10407): the free family of g*fᵢ is taken in m/m² for m the maximal ideal of Z′(z′); it should be that of X′(z′), since g*fᵢ vanish on Z′; affects nothing.
- **Error** in ILO14 at IX Théorème 1.2, p. 131 (ILO14 line 5903): the source assumes X_η smooth and irreducible; it should assume geometrically irreducible, without which the birational quotient in (iii) fails for ℙ¹_L over K; affects a stated result; corrected in print at ILO-final-IX Théorème 1.2, p. 161.
- **Gap** in ILO-final-II at Théorème 3.2.1, pp. 28–30 (ILO-final-II lines 301, 371–374): the published statement drops quasi-excellence but leaves the non-universally-Japanese case to the reader; it should keep the hypothesis, as v1 does, or give the limit argument; affects nothing.

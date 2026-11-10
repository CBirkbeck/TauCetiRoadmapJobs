# Review of EtaleDualityAndPerverseSheavesPartII (pull request #1743 at 975ac17)

**Verdict:** needs changes

This is a full review of the head the previous review also read (975ac17); the folder has not changed. Two findings: R01 is the previous review's R01, still unrepaired because PurityForFlatCohomology has not moved; R02 is new, a supplier Lean name that no longer exists at its supplier's head.

## R01 (P2) — Local Lefschetz and local duality on regular local rings still have two owners

Carried forward from the previous review (its R01). No repair report marks it as not actionable.

**Location.** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:23`: "PurityForFlatCohomology takes the local Lefschetz theorem from §7.3 for the hypersurface step of its bound of the étale depth by the virtual dimension, and owns none of these statements." Also `README.md:1648`: "PurityForFlatCohomology §1.6 consumes local Lefschetz (§7.3)".

**Claim.** This roadmap is the only owner of §7.1 (affine Lefschetz on principal punctured opens), §6.11 (the normalised dualizing complex), §6.12 (local duality) and §7.3 (local Lefschetz).

**Witness.** PurityForFlatCohomology (#1840) is still at d3f15fd9. In its `TauCetiRoadmap/PurityForFlatCohomology/README.md`, §1.4 (`:1107`) states (a) = our §7.1, (b) = our §6.11 and (c) = our §6.12, and §1.5 (`:1160`) states our §7.3. Its `:206–207` and `:3471–3472` name this roadmap as importer, and its `:1201` *Needs* cites its own §1.5.

**Why this roadmap should be the owner.** PurityForFlatCohomology's §1.4 route (`:1125–1133`) calls (a) and the dualizing property of Ω "Gabber's theorems at the locators above". Its *Needs* (`:1134–1136`) lists nothing that proves them. Here they follow from §5.7 and §§6.3, 6.6 and 6.9, which have routes.

**Repair** (in PurityForFlatCohomology; this folder is right once that lands):
- Delete §§1.4–1.5 there, and the importer bullets at `:206–207` and `:3471–3472`.
- Cite EtaleDualityAndPerverseSheavesPartII §§7.1, 6.11, 6.12 and 7.3 in their place.
- At `:1195` replace "(§1.5:" by "(EtaleDualityAndPerverseSheavesPartII §7.3:".
- At `:1201` replace "§§0.2, 1.1, 1.5" by "§§0.2, 1.1; EtaleDualityAndPerverseSheavesPartII §7.3".

**Test.** At d3f15fd9 with the `:1201` edit, the previous review ran the dependency check with `--movable`. It printed `moved: PurityForFlatCohomology … right after its last supplier EtaleDualityAndPerverseSheavesPartII` and 0 problems; a `moved:` line is not a defect. That head has not moved, so the test stands. The merge order has PurityForFlatCohomology at line 220 and this roadmap at line 390.

## R02 (P3) — `OrientedEtaleProduct` is cited from ClassicalAdicEtaleCohomology §5.4, which no longer has that name

**Location.** `TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII/README.md:142`: "Section 5.4 supplies `OrientedEtaleProduct` for scheme maps X → S ← Y, its projections and specialization two-cell, the site including Cartesian refinements of the middle neighborhood, and its universal property."

**Claim.** A backticked supplier declaration must exist where it is cited.

**Witness.** In ClassicalAdicEtaleCohomology (#875 at fc1c03a), §5.4 (`README.md:3133`) describes the object in prose at `:3135` ("define the oriented étale product `X_ét ←×_{S_ét} Y_ét`"). The string `OrientedEtaleProduct` appears in neither its README nor its `Suggested.lean`. Its own review (board report ClassicalAdicEtaleCohomology~3) records that the name was removed.

**Repair.** At `README.md:142` replace "supplies `OrientedEtaleProduct` for scheme maps X → S ← Y" by "supplies the oriented étale product X_ét ←×_(S_ét) Y_ét for scheme maps X → S ← Y", without backticks. Nothing else changes: §§3.1 and 3.3 and the Scope paragraph (`:15`) already refer to the object in prose.

**Test.** After the edit, every backticked name in the README has been resolved. Each one is either this roadmap's own (declared in `Suggested.lean`; the gate reports `readme-ids-missing=0`), a pinned declaration (72 `#check`s, 0 errors, below), or a name found in the cited supplier section (list below). The object described is the one at ClassicalAdicEtaleCohomology `README.md:3135`.

## Previous findings

- **R01 — not repaired.** `README.md:23` still says PurityForFlatCohomology "owns none of these statements". At d3f15fd9 that roadmap still states §1.4 (`:1107`) and §1.5 (`:1160`) and cites its own §1.5 at `:1201`.
- **No other findings were open.** The previous review's R02 (the §8.3 completion step) had already been repaired at this head, and the text is unchanged.

## Verified sound

### Gate, dependency check, build and diff (run on this head)

- **Gate.** `tauceti-roadmap gate … --base origin/main` printed `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's `gate.md` adds `build=0`.
- **Dependency check** (`--movable`), output in full: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EtaleDualityAndPerverseSheavesPartII'` lists no path.
- **Build.** `lake env lean` on `Suggested.lean` exited 0 in 8.4 s. The only warnings are eight "declaration uses `sorry`", at lines 77, 100, 193, 237, 274, 294, 309 and 332.
- **Folder contents.** README.md, Suggested.lean and metadata.toml (`topic = "math.AG"`); nothing stray.

### Seeded sample: 15 targets checked against the cached texts

| Target | Locator checked | Result |
| --- | --- | --- |
| 0.4 valuative criterion | ILO-final-II line 485 (Thm 4.2.1, p. 33), lines 522–527 (Rem 4.2.2, p. 34); ILO14 line 1571 | Noetherian X; maximally dominant Spec V → X with V's fraction field algebraically closed. For prime ℓ: pro-ℓ absolute Galois group, perfect only if ℓ ≠ char K. Matches the README. ILO14 v1 has two slips, corrected in print; see Source issues. |
| 0.5 approximation | ILO14 lines 1887–1894 (Déf III 4.2, p. 39), 1958–1970 (Thm 5.1, Déf 5.2, p. 41), 2030–2036 (Cor 5.4, pp. 42–43) | A excellent henselian noetherian local; (n+1−c)-isomorphism for (n+1)-close u. Cor 5.4: (i) a ≥ 1 gives the same dimension; (ii) a ≥ 2 transfers regularity, an iff by the symmetry the README lists; (iii) holds. Matches. |
| 1.4 mixed Cohen–Gabber | ILO14 lines 2676–2681 (Thm IV 4.2.2, p. 58), 2729–2740 (Thm 4.3.1, pp. 59–60) | d ≥ 2, normal, char 0 generic point, ℓ ≠ p; Y normal local with an ℓ-group H, Y/H of degree prime to ℓ; V carries a compatible H-action; Y → V⟦t⟧ local, finite, étale over a p-dense open, H trivial on the t_i. Matches the README and `MixedCohenGabberPresentation`. |
| 2.3 prime-to-ℓ uniformization | ILO14 lines 5893–5898 (Thm IX 1.1, p. 131) | Noetherian quasi-excellent X, rare Z, ℓ invertible; a finite alt_ℓ′-covering family with regular connected X_i and snc preimages. Matches. |
| 3.2 tube base change | ILO14 lines 8381–8391 (Thm XI 2.4, Lemma 2.5, pp. 178–179) | X, Y, S and f, g coherent; any ring Λ; F ∈ D⁺(Y, Λ); f^*Rg_*F → Rp_1*p_2^*F is an isomorphism. Matches. |
| 3.3 h-oriented topology | ILO-final-XII lines 218–277 (XIIA §§2.1.1–2.2.2, pp. 241–243); ILO14 lines 9034–9061 | Diagrams of all schemes with termwise limits; h generated by proper surjective maps and Zariski covers; five generators; matching objects computed in B/B. The README's labels are those of ILO14 v1 XII 2.1.2 (proper S′ with X factoring, étale S′ with Y factoring), the published labels swapped, as the README says. |
| 3.5 oriented descent | ILO-final-XII lines 279–282 (Thm 2.2.3, p. 243), 324–333 (Rem 2.2.6.1, p. 244) | The theorem is for ℤ/n; the remark extends it to any torsion ring, and to torsion cohomology under coherent morphisms. The README restricts that variant to coherent maps at `:774`. Matches. |
| 4.2 Gabber finiteness | ILO14 lines 9260–9267 (Thm XIII 1.1.1–1.1.2, p. 195) | Noetherian quasi-excellent X, f of finite type, n invertible, F constructible: (i) constructible, (ii) bounded, with the D^b_c form. Matches. |
| 5.2 existence of dimension functions | ILO14 lines 9997–9999 (Thm XIV 2.2.1), 10002–10004 (2.2.2), 10046–10047 (2.2.6), 10057–10058 (2.3.1), 10085–10086 (2.3.3), pp. 212–214 | (1) universally catenary iff a Zariski-local dimension function exists; (2) quasi-excellent gives étale-local existence, a torsor by line 9993; (3) −dim O is a dimension function on normal quasi-excellent X. Matches. |
| 5.8 cd bound | ILO14 lines 16193–16217 (Thm XVIII-A 1.1, Cor 1.2, 1.4, p. 331), 16252–16266 (Lemma 2.1), 16269–16275 (Lemma 2.2) | Strictly local noetherian, d > 0, ℓ invertible, any open U: cd_ℓ(U) ≤ 2d − 1. Lemma 2.1 completes along 𝔪. ArcTopologyAndDescent §8.9 (#1755 at dfd2dd1c, `README.md:1151–1155`) gives the I-adic support comparison for noetherian I-henselian A, so the README's input exists. |
| 6.4 top class, higher transitions | ILO14 lines 12855–12874 (Thms XVII 3.1.1–3.1.2, p. 268) | Normal strictly henselian excellent: H^q_x(Λ(d)) = 0 for q > 2d and [x] : Λ ≅ H^2d_x(Λ(d)); group transitions on any noetherian excellent X, composing and finite-compatible. Matches. |
| 6.10 Gabber duality | ILO14 lines 12220–12235 (Thm XVII 0.9, p. 257) | Noetherian excellent ℤ[1/n]-scheme with a dimension function: existence, uniqueness up to invertibles, ctf, finite quasi-injective dimension iff finite Krull dimension, plus the three bullets. The README's f^* for regular f is the reading of XVII 4.1.1 (ILO14 line 13520); v1 prints f^!, see Source issues. |
| 6.12 local duality | ILO14 lines 14231–14246 (XVII §6, Thm 6.1.1, p. 293); CS24 lines 1367–1380 (proof of Lemma 3.2.3, p. 33) | Biduality plus i_x^!RHom(G, K) = RHom(i_x^*G, i_x^!K) and the pinning give the stated formula. The derivation in the README route is the one CS24 cites from SGA 5 I (4.2.2). |
| 7.3 local Lefschetz | CS24 lines 1356–1360 (Lemma 3.2.3, p. 33) | Regular local (R, 𝔪), f ∈ 𝔪, ℓ invertible: bijective for i < dim R − 1, injective at dim R − 1. Verbatim hypotheses. |
| 8.6 tilting with supports | CS24 lines 827–836 (Thm 2.2.7 and (2.2.7.1), p. 21) | ϖ^p ∣ p, ϖ-henselian, bounded ϖ^∞-torsion, perfectoid completion; closed Z ⊂ Spec A/ϖA; torsion G. Matches. |

Also read, as load-bearing for the headlines:
- ILO14 lines 664–670 (I 5.3.1) and 722–734 (I 5.5.1(ii)): a local G-ring is quasi-excellent.
- ILO14 lines 10350–10376 (XV 1.2.2, 1.2.4 and the reduction 1.2.5).
- ILO14 lines 396–401 (Exposé 0, Cor 8).
- SGA4 lines 1336–1364 (X 2.3 Example, Cor 2.4, Cor 2.5).
- ILO14 lines 2276–2280 (IV 2.1.1), 2419–2422 (IV 2.2.2), 2884–2892 (V 2.1.1–2.1.2), 2957–2982 (V 3.1.1, 3.1.3, 3.1.4).
- ILO14 lines 1394–1399 (II 3.1.1), 1414–1421 (II 3.2.1), 1499–1505 (II 3.2.3).

### Adversarial table

Values computed in this review, covering the sampled targets, the eight headlines and the targets the findings touch.

| Statement | Instances tried | Values on each side | Result |
| --- | --- | --- | --- |
| §0.4 criterion, prime-to-ℓ | k = 𝔽_p(t), Spec k(t^(1/p)) → Spec k; ℓ = p, then ℓ ≠ p | ℓ = p: degree p ∉ p′; the test V = k^sep (trivial, pro-p) has no t^(1/p), so no lift; both sides "not covering". ℓ ≠ p: p ∈ ℓ′, perfect K contains t^(1/p); both sides "covering". | holds; ILO14 v1's "always perfect" would say covering at ℓ = p |
| §0.4 criterion, negative | 𝔾_m ⊂ 𝔸¹ | A valuation centred at 0 does not lift; not jointly surjective | holds |
| §0.5 a-isomorphism | X = Spec k⟦t⟧, Y = Spec k, a = 1 | gr¹₁ = (t)/(t²) ≅ k against 0; closed fibres both Spec k | not 1-close, as the Check says |
| §1.4 / `MixedCohenGabberPresentation` | identity on ℤ_p⟦x⟧; V = W[π]/(π^ℓ − p) with μ_ℓ; t ↦ x^p | Degree 1 and gcd(1, ℓ) = 1. [Frac B : Frac A] = ℓ, B^H = A, invariant degree 1. p·x^(p−1) is a nonunit at the generic point of the p-fibre, so not étale. | holds; the last fails `etaleAtPFibre` |
| §2.3 / §0.3 form (1) | R = 𝔽₃[t]_(t), x³+x²+2x+t, rational closed point deleted, ℓ = 2 | Closed fibre 𝔽₃ × 𝔽₉ (disc of x²+x+2 = −7 ≡ 2, a nonsquare mod 3). Generic degree 3; remaining closed point of degree 2. Any odd-degree finite R′ has Σe_if_i odd, so some f_i is odd, so no odd-degree lift. | alt-cover, not alt_2′; consistent |
| §3.2 tube base change | strict trait, X = s, Y = η | f^*Rg_*Λ at s = RΓ(η, Λ) = Λ ⊕ Λ(−1)[−1]; the tube stalk RΓ(S_(s) ×_S η) is the same | equal |
| §3.3 B and h-covers | K = k(t₁,t₂,…), K ⊗_k K; D(t), D(t−1) on 𝔸¹ | Chain (t_i⊗1 − 1⊗t_i)_(i≤m) strictly increasing, so not noetherian; (t, t−1) = (1) covers | holds |
| §3.5 descent | Čech nerve of Y ⊔ Y → Y over a point; constant ℚ/ℤ | Equalizer of M² ⇉ M⁴ is the diagonal M; identity ℚ/ℤ → ℚ/ℤ with no annihilator | holds |
| §4.2 finiteness | snc with r = 0, 1, 2 branches; H¹(𝔸¹_k, ℤ/p) | Ranks of ∧^q(Λ(−1)^r): (1), (1,1), (1,2,1). Artin–Schreier classes t^m (p ∤ m) are infinite. | bounded; n invertible needed |
| §5.2 (1) | Nagata's catenary, not universally catenary, local domain; strict trait | No Zariski-local δ; δ(η) = 1, δ(s) = 0 | holds |
| §5.8 / `cohomologicalDimension_le_of_strictlyLocal` | k⟦t⟧; punctured k⟦x,y⟧; Spec k (d = 0) | H¹(η) = ℤ/ℓ(−1) ≠ 0 at 1 = 2d − 1, zero for q ≥ 2. H³ = H⁴_s = ℤ/ℓ(−2), and 3 < 4 = 2d. d = 0: H⁰ ≠ 0 at q = 0, excluded by `hd`. | holds, sharp |
| §6.4 top class | strict trait; strict regular surface | H²_x(Λ(1)) = Λ and H³_x(Λ(1)) = H²(η, Λ(1)) = 0 since cd = 1; H⁴_x(Λ(2)) = Λ, other degrees 0 | holds |
| §6.10 shifts | Λ = ℤ/6, normalized trait complex ⊗ (𝔽₂ ⊕ 𝔽₃[1]) | n₂ = (−2, 0), n₃ = (−3, −1); ⌊−n/2⌋ = (1, 0) for both factors | no common shift; δ recovered |
| §6.11 (R01) | d = 0, 1, 2; n = 6 | Λ; Λ(1)[2]; Λ(2)[4]; μ₆[2] = μ₂[2] ⊕ μ₃[2]; closed pinning H^2d_x(Λ(d)) ≅ Λ | holds |
| §6.12 (R01) | strict trait, F = Λ, K = Λ(1)[2] | H⁰_x = H¹_x = 0 against Hom(H⁰(K), Λ) = Hom(H⁻¹(K), Λ) = 0. H²_x(Λ) = Λ(−1) against Hom(Λ(1), Λ) = Λ(−1). | equal in every degree |
| §7.1 (R01) | d = 1, f a uniformizer; f = 0 | H^(>1)(η) = 0; empty open | holds |
| §7.3 (R01) | k⟦x,y⟧ with f = x; a DVR with f a uniformizer; f = 0 | i = 0, 1: 0 → 0 (H⁰_𝔪 = H¹_𝔪(k⟦y⟧) = 0). i = 2 = d: 0 → H¹(k((y))) = ℤ/ℓ(−1), not onto. DVR, i = 0: 0 → ℤ/ℓ injective. f = 0: identity. | holds, range sharp at d |
| §8.6 supports | 𝔽_p with ϖ = 0, Z = Spec 𝔽_p, G = ℤ/ℓ; 𝒪_C with Z = V(ϖ) | H⁰ = H¹ = ℤ/ℓ on each side, including ℓ = p; restriction G → G is the identity, so both support complexes are 0 | holds |
| §3.1 / CAEC §5.4 (R02) | X = Y = S a strict trait | Points (s,s), (η,η), (s,η), 3 against 2 for S ×_S S; the object exists at CAEC `README.md:3135`, the name does not | object sound, name stale |
| `cohenGabber_equalCharacteristic` | cusp at p = 2 (t ↦ y) and p = 3 (t ↦ x); d = 0 | Rank 3 with ∂/∂x = 3x² = x² ≠ 0; rank 2 with 2y ≠ 0. d = 0: A is a field, MvPowerSeries (Fin 0) k = k. | holds |
| `cohenGabber_equivariant` | μ₂ on k⟦x⟧; S₃ on k⟦x₁,x₂,x₃⟧; char 2 with x ↦ x/(1+x) | t = x², degree 2; degree 6. σ²(x) = x/(1+2x) = x, but \|G\| = 2 is not a unit, excluded by `horder`. | holds |
| `cohenGabber_mixedCharacteristic` | ℤ_p⟦x⟧, d = 2; Q₈ acting trivially with ℓ = 2, p = 3; S₃ | Identity presentation exists; Q₈ element orders 1, 2, 4, a 2-group; a 3-cycle in S₃ fails `IsPGroup 2` | holds |
| `partialAlgebraization_equalCharacteristic` | k⟦x,y⟧/(xy) with (x), (y); a field | B = k, dim 0 + 1 = 1; a field has dim 0, excluded by `hpos` | holds |
| `partialAlgebraization_mixedCharacteristic` | ℤ_p⟦x⟧ with (x − p); W(𝔽̄₃)[π]/(π² − 3) with C₂ | B = ℤ_p, C = ℤ_p[x], 𝔫 = (p, x): 1 + 1 = 2, regular, char 0, residue char p. A′ = W⟦x⟧ has no V-structure (2v₃(b₀) = 1). | holds |
| `affineLefschetz_strictlyLocal` | strict trait with n = 2; n = 1; d = 0; punctured k⟦x,y⟧; non-noetherian V of rank 1 with group ℤ + ℤ√2 | H¹(η) = ℤ/2 ≠ 0 at q = d, so q > d is sharp; ZMod 1 = 0; H^(>0) = 0. Non-affine U has H³ ≠ 0. V has H²(K) = ∧²(ℤ/ℓ)² ≠ 0, excluded since `IsGRing` includes noetherian (`GRing.lean:59`). | holds |
| `cohomologicalDimension_fractionRing_eq` | ℤ_p; W(k̄)⟦x⟧; henselized ℝ[x,y]/(x²+y²) with ℓ = 2 and ℓ = 3; ℝ⟦t⟧ with ℓ = 2; 𝔽_p⟦t⟧ with ℓ = p; d = 0 | 2 = 1+1; 2 = 2+0; 1 against ∞ (excluded by `hreal`); 1 = 1+0; ∞ = 1+∞ (excluded but true); ≤ 1 against 2 (excluded by `IsUnit`); c = 0 + c | holds |

### Headlines, padding, binders

- **Headlines in the README.** Cohen–Gabber (§§1.1, 1.2, 1.4), partial algebraization (§§1.6–1.7), weak and prime-to-ℓ uniformization (§§2.2–2.3), oriented descent (§§3.5–3.6), finiteness (§4.2), dimension functions (§5.2), affine Lefschetz (§§5.6–5.7), cd bound (§5.8), fraction-field cd (§5.9), perverse t-structures (§6.5), dualizing complexes, biduality and local duality (§§6.6–6.12), local Lefschetz (§7.3), tilting (§§8.3–8.6).
- **Which are stated.** `Suggested.lean` states, as eight theorems, the ones statable at the pins: Cohen–Gabber (§§1.1, 1.2, 1.4), partial algebraization (§§1.6–1.7), the local form of affine Lefschetz (§5.7), the cd bound (§5.8) and the fraction-field formula (§5.9). Its module docstring names each of the rest and the carrier it lacks. No perfectoid-ring predicate exists in the pinned Mathlib (only `Perfectoid/{BDeRham,FontaineTheta,Untilt}`) or in Tau Ceti, so the tilting docstring entry stands.
- **Padding probe.** I replaced each `sorry` by `first | rfl | simp | infer_instance | trivial` in a scratch copy. All 8 theorems stay open: seven fail at `assumption`, and `cohenGabber_equivariant` is left with unsolved goals after `simp`. No padding.
- **Binders.** I ran `#check @` on all 11 declarations in one scratch file. The three structures keep exactly their stated parameters, and each theorem carries its hypotheses. They agree with the README statements, and nothing changed.

### Library declarations opened at the pins

- **Every name resolves.** One scratch file ran `#check @` on all 72 Mathlib and Tau Ceti names the README cites, from `AlgebraicGeometry.LocallyOfFiniteType` to `TauCeti.AdicCompletion.ringKrullDim_eq`. It elaborated with 0 errors.
- **Mathlib, opened:**
  - `PrimeSpectrum.isIdempotentElemEquivClopens` (`Mathlib/RingTheory/Spectrum/Prime/Topology.lean:1402`) and `_mul` (`:1416`).
  - `Algebra.IsEtaleAt` (`Mathlib/RingTheory/Etale/Locus.lean:35`).
  - `CategoryTheory.Sheaf.H` (`Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:57`).
  - `IsFormallyReal` (`Mathlib/Algebra/Ring/IsFormallyReal.lean:105`).
  - `Algebra.EssFiniteType` (`Mathlib/RingTheory/EssentialFiniteness.lean:40`).
- **Tau Ceti, opened:**
  - `TauCeti.Excellence.IsGRing` (`TauCeti/RingTheory/RegularLocalRing/GRing.lean:57`, with a noetherian field).
  - `TauCeti.cohomologicalDimensionAt` (`…/CohomologicalDimension/Basic.lean:146`; v is the first universe, so `.{u}` sets v = u).
  - `TauCeti.AdicCompletion.ringKrullDim_eq` (`TauCeti/RingTheory/AdicCompletion/LocalRing.lean:52`).
  - `TauCeti.IsProPSylow.cohomologicalDimensionAt_eq` (`…/Profinite/Sylow/CohomologicalDimension.lean:95`).
  - `TauCeti.galoisSubgroup` (`…/AbsoluteGaloisGroup/FiniteExtension.lean:143`).
- **Not already proved at the pins.** No Cohen structure theorem, coefficient field or p-basis lift exists in either library. So the `equicharacteristic-cohen-coefficients` gap asks for nothing already there.

### Cross-roadmap citations resolved

**On main:**
- SchemeAndStackFoundations §§0.7, 0.9 (`spreading_out_models`), 0.12–0.16, 0.20, 0.21 (`excellent_examples`), 0.22, 2.7, 2.11, 2.12, 2.15 (`etale_galois_comparison`, `etale_cohomology_limits`), 2.16 and 4.16–4.20.
- EtaleCohomologyFoundations §§F.0.3 (`VanishingCycles.etaleTateTwists`, `README.md:233`), 0.7 (`ClassicalAlgebraic.supportLocalization`, `:443`), 0.9 (`ClassicalAlgebraic.lciCycleClass`, `:1135`), 0.10 (`ClassicalAlgebraic.smoothBoundaryPurity`, `:1147`), F.5 (`VanishingCycles.etaleExceptionalInverseImage`, `:1181`), F.6 (`VanishingCycles.smoothPurity`, `:1202`), F.2.4, F.3 and F.8. These are the six names `scratch/citations.md` flagged as absent from the pins; all are supplier roadmap names.
- AdicEtaleGeometry §§A1.14–A1.15.
- EnhancedDerivedSheaves §§0.1–0.4, E2, E2.6 and E2.8.

**At open heads:**
- AdicCoefficientsAndComparisonsPartII (#1796): §§PA.0.2–PA.0.8, PA.0.11, PA.1.2–PA.1.4, PA.4.1–PA.4.8, PA.5.1–PA.5.4.
- ClassicalAdicEtaleCohomology (#875 at fc1c03a): §5.3 (tame quotient and pro-p invariance) and §5.4. R02 concerns the name only.
- LefschetzPencilsAndVanishingCycles (#873): §§0.2–0.5, 0.10, 6.2.
- ArcTopologyAndDescent (#1755 at dfd2dd1c): §§1.3, 3.6, 8.6–8.9, 11.1, 11.2, 11.5, 12.6.
- NoncommutativeAndEquivariantIwasawa (#1307): §0.11, which states `cd_p_eq_of_isOpen_of_noPTorsion` for any profinite group and any prime.
- DeformationAndDerivedPatchingAlgebra (#1034): §1.10.
- AlgebraicModuliForArithmeticGeometry (#853): §§6.0–6.1.
- PerfectoidQuotients: §§0.4–0.6.
- EtaleDualityAndPerverseSheaves (#1040): §§0.1, 0.2, 1.1, 2.2, 2.4, 2.11.
- PurityForFlatCohomology (#1840): §1.6, the consumer.

**PerfectoidQuotientsPartII.** `citations.md` reports it on neither main nor an open pull request. It is line 219 of the merge order, earlier than this roadmap, and its board package has §§Q5.1–Q5.3 and Q6.2–Q6.7, so it is a valid earlier supplier.

### Declared gaps

The README declares five slugs (`:82`, `:86`, `:98`, `:116`, `:132`), equal to the five in `design/plan.json`, with the same suppliers and sections. Each is precise and minimal:
- SchemeAndStackFoundations §0.21 on main has no henselization permanence for quasi-excellence.
- SchemeAndStackFoundations §0.14 has only the finite étale equivalence over R/I, not Elkik's equivalence for algebras étale away from V(I).
- EtaleCohomologyFoundations §F.3 is stated for finite-type field and excellent-trait bases.
- LefschetzPencilsAndVanishingCycles §6.2 states the trait perversity and the t-exactness of RΨ, but not the affine support bound.
- DeformationAndDerivedPatchingAlgebra §1.10 lifts Cohen-ring coefficients but has no p-basis-prescribed coefficient field.

### Duplication and overlap

- **No second owner** at the open heads or on main for: Cohen–Gabber, partial algebraization, local uniformization, potential or putative dualizing complexes, h-oriented descent, the fraction-field cd formula, or Gabber's monotone perversities. LefschetzPencilsAndVanishingCycles' "Gabber's duality" is nearby-cycle duality, a different theorem.
- **AdicCoefficientsAndComparisonsPartII:**
  - §0.4 owns ℓ′-alterations as morphisms; this roadmap owns the topology (Scope `:13`).
  - §6.11 is de Jong's Galois alteration over an algebraically closed field.
  - §§6.4–6.8 are conditional on universal resolvability.
  - None of these is §2.1, §2.2 or §2.3 here.
- **`scratch/overlaps.md`, re-run on this head:** no pull request changes this roadmap, and no dropped or revision-only id. PurityForFlatCohomology, among the five closest roadmaps, is R01.

## Not verifiable

- **Ill03, Epp73, Ser65.** Settled as uncertified. Ser65 is used only through NoncommutativeAndEquivariantIwasawa §0.11, whose statement I read.
- **BČ22 Theorems 2.3.1 and 2.3.4.** Cited by CS24 line 837. The README goes through ArcTopologyAndDescent §8.9 instead, so they were not opened.
- **The published ILO XVII** (numbering 0.2) is not in the cache. Whether the v1 misprint in Théorème 0.9 below is corrected in print was not checked.

## Source issues

- **Misprint** in ILO14 at II Théorème 4.2.1, p. 32 (arXiv v1; ILO14 lines 1574–1575): the source says the valuation rings have algebraically closed residue field; it should be algebraically closed fraction field, as its own proof uses; affects nothing; corrected in print at ILO-final-II Théorème 4.2.1, p. 33.
- **Error** in ILO14 at II Remarque 4.2.2, p. 32 (arXiv v1; ILO14 lines 1576–1580): the source says the prime-to-ℓ test always uses perfect fraction fields; it should require perfection only when ℓ ≠ char K, else k(t^(1/p))/k passes; affects a stated result; corrected in print at ILO-final-II Remarque 4.2.2, p. 34.
- **Misprint** in ILO14 at III Théorème 5.1, p. 41 (ILO14 line 1960): the source says X is of finite type over S; it should be over Ŝ, the base of its model and of the proof at line 1984; affects nothing.
- **Misprint** in ILO14 at XVII Théorème 0.9, p. 257 (ILO14 lines 12232–12233): the source says f^!K is dualizing for flat f with geometrically regular fibres; it should be f^*K, as in XVII 4.1.1 (line 13520); affects nothing.
- **Error** in ILO14 at Exposé 0, Corollaire 8, p. 5 (ILO14 line 400): the source says cd_ℓ(K) = d + cd_ℓ(k) for every henselian quasi-excellent local domain; it should assume ℓ ≠ 2 or k not formally real, since henselized ℝ[x,y]/(x²+y²) gives 1 ≠ ∞ (SGA 4 X 2.3); affects a stated result.

# FIX-DESIGN-PadicHodgeTheoryPartII~2

Repair of the design of `PadicHodgeTheoryPartII` against the findings F01–F14 of `REV-DESIGN-PadicHodgeTheoryPartII` (review of 6502997). Files changed: `packages/PadicHodgeTheoryPartII/design/README.md` (restructured into house form), `packages/PadicHodgeTheoryPartII/design/plan.json`, and `packages/PadicHodgeTheoryPartII/sources.toml` (created through the sources service).

## F01 (P1) — applied differently

Change: G01 (no supplier) → `gap:quasisplit-highest-weights`, supplier ReductiveGroups Layer 10 (10B), one-sentence `needs`, README "What ReductiveGroups must provide" line, prerequisite of GM1/quasisplit-threshold and GM1/frobenius-transport; threshold formula stated here (§1.2); Res-torus test as Checks (§§1.1–1.3).

Evidence: ReductiveGroupsPartIII is absent from main, the open heads (`roadmaps list`) and `merge-order/ORDER.txt`, so it cannot supply (the reviewer's own F04); ReductiveGroups (main) owns highest weights (Layer 10B split, Layer 7 Galois action on root data).

## F02 (P1) — applied

Change: deleted `GM4/quasisplit-converse`, G02 and all converse text. Scope records GLX26 Proposition 5.11 and Theorem 6.1 as consumers in the component theory of local shtuka towers (using §§3.2, 3.5, 4.2). §4.2 keeps transitivity as a hypothesis, citing HeckeStacksAndLocalShtukas §HS2.16. Confirmed: GLX26 lines 2108–2176 put Lemma 6.12 inside (4)⇒(5).

## F03 (P1) — applied

Change: nonexistent parent node → `gap:serre-sen-openness` (PadicHodgeTheory §4.4): for Hodge–Tate ρ over an algebraically closed residue field, ρ(Γ_K) is open in the Q_p-points of its Zariski closure (Serre79 §1.3, Théorème 1, p. 158; Chen14 Prop. 3.2.1(2)). H, H° from ArithmeticGaloisRepresentations §7.6; "parent Mumford–Tate group" deleted; cyclotomic test in §0.7.

## F04 (P1) — applied

Change: every RG3.0 citation (supplier paragraph, Layer 1–2 dependencies, six plan nodes) → ReductiveGroups Layer 10 (10B: split highest weights, weights between w_0λ and λ, one-dimensional simples); only the quasisplit/Galois part is the gap (F01). The GL_2 standard test appears in §§1.2–1.3 and §1.6.

## F05 (P1) — applied differently

Change: central lifting → target §3.4 (proof via D(J°), MilneiAG Prop. 8.20/Cor. 8.21); density of open subgroups → target §3.3; Fl_μ → ShimuraData §3.8; universal filtration → AutomorphicBundles §B0.4; chamber → BunGAndNewtonStrata §1.12; isogeny openness → RG2.0.2; lifting Checks (GL_2→PGL_2, torus, det).

Evidence: no G04 gap is needed, because rank loci are owned by AlgebraicModuliForArithmeticGeometry §1.7 `rankLocus`, earlier in the merge order (ORDER.txt line 30). Tag 02GL is Mathlib `Algebra.FormallyEtale.iff_exists_algEquiv_prod` at `Mathlib/RingTheory/Etale/Field.lean`:194; the reviewer's `Algebra.Etale…`:271 does not exist at pin 6b7abb3.

## F06 (P2) — applied differently

Change: the G01 `needs` is now one sentence (W_O classification, W_O⊗k̄ ≅ ⊕W_λ, V_O⊗k̄ = ⊕V^λ, Galois equivariance, V_O = (⊕V^λ)^Γ). Generic-flag equality (§1.1), the threshold formula (§1.2) and Frobenius transport (§1.4) are now targets; the character criterion is cited to ReductiveGroups Layer 10.

Evidence: the Γ_E-refinement is not requested. The corrected threshold m_O = min_{λ∈O}⟨w_0λ,μ⟩, which equals the minimum over Γ_E-orbits because μ is Γ_E-fixed, needs no refinement (proof in §1.2).

## F07 (P2) — applied

Change: deleted `GM3/witt-leading-digit` and `GM3/infinite-transcendence` and their subsections; §3.1 now needs ReductiveGroupsPartII §RG2.0.4 `transcendenceDegree_infinite` (checked at its head: characteristic zero, citing Chen Prop. 2.0.3). The strengthened residue-degree bound is passed to that owner (plan `upstreamNotes`; maintainer notes below).

## F08 (P2) — applied

Change: "morphism preserving the filtered isocrystal sends a member to a member" → requires (b, μ) admissible; proof via the injective, hence strict, map from the rank-one coefficient object (§0.5). Negative-control Check: T = 𝔾_m², b = 1, μ = (0,1), v = e_1+e_2 (jump 0 = k), image e_2 (jump 1), with F(χ_2) not weakly admissible.

## F09 (P3) — applied

Change: explorer ids → sections, each verified at the head or on main: PadicHodgeTheory §§3.4, 3.6, 4.4, 5.5; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.2, R07.4.13; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; BunGAndNewtonStrata §§1.7–1.9, 1.12, 1.23, 1.43; HeckeStacksAndLocalShtukas §§HS2.11–HS2.13, HS2.15, HS2.16; ArithmeticGaloisRepresentations §§1.1, 7.6; SchemeAndStackFoundations §0.8; ReductiveGroups Layers; DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.5.

## F10 (P3) — applied

Change: the hashes and the word "current" are deleted. "From Mathlib" and "From Tau Ceti" list the declarations opened at pins 6b7abb3c and a91d3aaf, with file:line (e.g. `Character.lean`:101, `Equivalence.lean`:188, `Isocrystal.lean`:180). plan.json `baseline` and `baselineAudit` record these pins and the file sha256.

## F11 (P3) — applied

Change: retitled "p-adic Hodge theory and geometric comparison, Part II: generic crystalline monodromy". It opens with where PadicHodgeTheory stops (§5.5 torsor, §4.4 Sen, no monodromy group) and uses the house headings, §k.n subsections, Examples/Dependencies per layer and a *Needs:* line per target. Process words are deleted.

## F12 (P3) — applied

Change: Lean names dropped from Checks. The non-tests are replaced by computed Checks (Res-torus threshold §§1.2–1.3, F08 negative control §0.3, and others). Old line 609 → "identity coset has stabilizer C; gC has stabilizer gCg⁻¹", with [[1,−2],[0,−1]] ∉ C computed (§4.1 and Layer 4 examples).

## F13 (P3) — applied

Change: "short Lean companion with DegreeAt, frobeniusDegreeSum, positive_sum_forces_zero" → `Suggested.lean` states no theorem, and the docstring names the headlines that cannot be stated (Thm 5.8(1)–(2), Prop. 5.9, z-extension comparison, compact torsor) and the missing carriers. The README has no backticked own names; plan `suggestedLean` is updated. No Lean file exists yet.

## F14 (P3) — applied

Change: created `sources.toml` through the service (GLX26 arXiv v3 with DOI and version note, Chen14, Stacks, Serre79, MilneiAG; check: 0 problems). GLX locators now use v3 pages, the "published text" sentence is deleted, and E8 is dropped: GLX26 lines 624–627 conjugate within G(Q_{p^s}), and lines 1601–1604 refer to that replacement.

## Checks run

Dependency check (`tauceti-roadmap … gate --candidate packages/PadicHodgeTheoryPartII/design/README.md --only PadicHodgeTheoryPartII --order merge-order/ORDER.txt`):

    candidate: PadicHodgeTheoryPartII is not in the merge order yet; checked as if placed after HeckeStacksAndLocalShtukas (the intake inserts it when its design is accepted)
    depcheck: 56 roadmaps, 639 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

Other checks:
- `roadmaps resolve` on the README found no cross-roadmap citation and no Lean name "found nowhere". The Mathlib and Tau Ceti names were checked by hand at the pinned sources, with the file:line given in the README.
- `sources check`: 0 problems; `needs-references.toml` was not written, since every cited text was readable.
- No gate failures were listed for this round.
- The `#check @name` comparison does not apply: no `Suggested.lean` exists at the design stage and none is planned to declare anything.

## Adversarial pass (new and changed statements)

| Statement | Instances | Computed values | Result / change |
|---|---|---|---|
| §0.1 jump | Fil = K for i ≤ a; zero; jumps 2, −1 | 1 ↦ a; 0 in every Fil^d; e_1 ↦ 2, e_1+e_2 ↦ −1 = min | true; hypothesis now exhaustive+separated (bounded not needed) |
| §0.2 degree sum | φ = id; involution 1, −1; 3-cycle 2, 0, −5 | s·d; 0 ≠ 2; d_3 = −3, d_2 = 2 | true |
| §0.3 morphism bullet | T = 𝔾_m², b = 1, μ = (0,1), v = e_1+e_2 | jump(v) = 0 = k; jump(e_2) = 1; F(χ_2): t_H = 1, t_N = 0 | false without admissibility → hypothesis added, negative control Check |
| §0.3 with admissibility | split torus | ν_b = μ, so equal Newton exponent forces equal μ-weight | true |
| §0.4 ω_s | unit; slope-1/2 block, s = 2; φ = pσ; b = p^m | Q_{p^s}; φ²(ae_1+be_2) = p(σ²a e_1+σ²b e_2), dim 2; 0 vs 1; ω_1 = V | true |
| §0.5 rank-one objects | s = 1; s = 2, (1,−1), k = 0; wrap p | t_H = t_N; lines F(e_0+ce_1), cσ(c) = 1, t_H = −1 ≤ 0; t_N = 1 ≠ 0 | true |
| §0.6 line criterion | 𝔾_m, b = p^m, m ≠ 0; b = 1, μ = 0; 1 ⊕ χ | H = 𝔾_m acting by a character; V⊕1 stabilizers give 1, irreducibles give Z(GL_2) = 𝔾_m; T^{m1,m2} has one weight | true; the m ≠ 0 condition was added to the Check |
| §0.7 comparison | b = 1; 𝔾_m, b = p^m | H = 1; ξ = χ^{−m}, image open in ℤ_p^×, H = 𝔾_m | true; G_der normal is used in the descent |
| §1.1 generic filtration | GL_2 std; det; Res_{Q_5(5^{1/3})}𝔾_m | ⋂ of lines = 0, generic line ∩ V = 0, [1:0] gives ke_1; Fil^1 det = det; V ∩ (weight-1 factor of E⊗E) = 0 | true; density now via the big cell (ReductiveGroups Layer 7) |
| §1.2 threshold | Res torus; GL_2 std, det; quadratic Galois E with trivial weight; μ = 0 | m = min(1,0,0) = 0 vs Gal(E/k)-formula 1; 0 and 1; one block, 2v; Fil^1 = 0 | corrected formula min_{λ∈O}; true |
| §1.3 orbit bound | sizes 1, 2 and pairings 0, 3; Res torus | 0 ≤ 2 (unweighted 3/2); 0 ≤ 0 ≤ 1/3 = ⟨e_1, μ̄⟩ | true |
| §1.4 Frobenius transport | Res_{Q_{p²}/Q_p}𝔾_m, s = 2; split G | (a,b) ↦ (σb, σa) swaps e_1, e_2; identity | true |
| §1.5 full-period bound | 𝔾_m, b = p^m; GL_2 basic slope 1/2; period ms | m = m; d_2 ≤ 0 < 1 = k; d_{ms} = m·d_s by G(Q_{p^s})-invariance | true |
| §1.6 Newton lowest weight | GL_2, ν = (a,b); torus | exponents {sa, sb} ≥ sb; equality | true |
| §1.7 strict HN | SL_2, c > 0; GL_2, c = 0, λ = (1,0) | −cn < 0; sandwich 0 ≤ 0 ≤ 0 with ⟨λ,α^∨⟩ = 1 | true; c_α > 0 needed |
| §2.1 descent | b = 1; simple a/h block; diag(p,1) | rational lines; {0, block}; Fe_1, Fe_2 | true |
| §2.2 minimality | plane, jumps (1,0), line L | t_H = 1 at [L], 0 elsewhere; locus = rank(L → V/ℓ) ≤ 0 = {[L]} | true |
| §2.3 generic admissibility | GL_2, b = diag(p,1); 𝔾_m; basic slope 1/2 | Fil^1 = Ke_2: t_H = 1 > 0; m = h; std simple, so every V passes (direct summands) | true; Check 3 wording justified |
| §2.4 derived monodromy | GL_2 basic; torus; GL_2 ordinary | V^{2,1} = ∅ so SL_2 ⊆ H°; 1 ⊆ H°; V^{1,0} = Q_p^×e_2, Fe_2 WA subobject, ξ reducible | Check 3 corrected (old claim e_1 ∈ V^{1,1} was false at a generic flag) |
| §3.1 generic points | ℙ¹; n = 0 | transcendental coordinate; X = Spec E | n = 0 wording corrected (geometrically integral forces Spec E) |
| §3.2 open image | torus; norm-one torus with κ ≠ 0 | G_der = 1; [b] ∉ B(T,0), no admissible point | true |
| §3.3 density | 𝔾_m, 1+pℤ_p; O(2) ⊃ SO(2)(Q_p); diagonal ⊂ GL_2(ℤ_p) | closure 𝔾_m; SO(2) ≠ O(2); torus ≠ GL_2 | true; connected and open both needed |
| §3.4 central lifting | GL_2→PGL_2, J = GL_2, SL_2, T; det: GL_2→𝔾_m, J = T | J° ⊇ SL_2; f(T) ⊉ PGL_2; hypothesis holds but SL_2 ⊄ T | true; central kernel needed |
| §3.5 z-extension | GL_2→PGL_2; G×𝔾_m→G; det∘ξ̃ for μ̃ = (1,0) | index [Q_p^×:Q_p^{×2}] = 4 or 8 (p = 2); extra character; χ^{−1} ≠ 1 | true |
| §4.1 components | ξ = 1; C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | trivial stabilizers; gCg⁻¹ ∋ [[1,−2],[0,−1]] ∉ C | true; the old Check was false and is corrected |
| §4.2 ambient stabilizers | Y a point; Y = T_y ⊔ G(Q_p)×Spd K; torus | G(Q_p); trivial stabilizers on the second summand, not open for G_der ≠ 1; automatic | true; transitivity needed |
| gap:serre-sen-openness | χ_cyc over K/Q̆_p; finite image | image open in ℤ_p^×; closure = image | consistent with Serre79 Thm 1 |

## Notes for the maintainer

- **Plan node changes.** Deleted: `GM3/witt-leading-digit`, `GM3/infinite-transcendence`, `GM4/quasisplit-converse`. Added: `GM1/generic-filtration`, `GM1/quasisplit-threshold`, `GM1/frobenius-transport`, `GM3/open-subgroup-zariski-dense`, `GM3/central-lifting`. Each node now carries a `readmeSection`, and `requests` is empty: its contents went into prerequisites, targets or gaps.
- **Gap changes.** G01 is `gap:quasisplit-highest-weights`; G03 is new as `gap:serre-sen-openness`; G02 is deleted. No Lean name changed that another roadmap could cite, since this roadmap never had a Lean file.
- **Requests to other roadmaps.**
  - ReductiveGroups Layer 10: the quasisplit Galois-orbit classification.
  - PadicHodgeTheory §4.4: Sen openness over algebraically closed residue fields.
  - ReductiveGroupsPartII §RG2.0.4: Chen14 Prop. 2.0.3 needs residue degree above m·p^{n−b}·M with n − b = b(m−1) + r, not m·p^{b(m−1)}·M; choose b for the stronger bound.
- **Ownership check.** Done by object, with `roadmaps grep` over main and the 367 open heads, for generic filtrations, central lifting, density of open subgroups, Serre–Sen openness and rank loci. It found AlgebraicModuliForArithmeticGeometry §1.7 (rank loci, cited) and DeligneWeightsAndPurity §2.2 (the Sp(V) case of density, now named in §3.3 as the special case). No other owner was found.
- **Moves.** No notion was moved down from a later roadmap.
- **Suspicious text.** The review text contained no instructions beyond its claims.

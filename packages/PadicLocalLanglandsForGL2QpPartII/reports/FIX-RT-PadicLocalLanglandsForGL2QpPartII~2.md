# FIX-RT-PadicLocalLanglandsForGL2QpPartII~2: red-team round 2 repaired

Reviews settled: `RT-PadicLocalLanglandsForGL2QpPartII~2a` (five findings) and `RT-PadicLocalLanglandsForGL2QpPartII~2b` (five findings). No two findings overlap, so each has its own section. Files changed: `packages/PadicLocalLanglandsForGL2QpPartII/README.md`, `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` (docstring only), `packages/PadicLocalLanglandsForGL2QpPartII/sources.toml`. `design/plan.json` is unchanged: no new supplier gap.

## RT-PadicLocalLanglandsForGL2QpPartII~2a/F01 (P2) — disputed

The witness quotes only the first part of the base §5.8, the projective-envelope comparison, which assumes p ≥ 3. The README cites a different paragraph of the same section. At the head of PadicLocalLanglandsForGL2Qp, §5.8 has a paragraph headed *Universal family for absolutely irreducible residual representations* that begins "For every prime p and absolutely irreducible ρ̄". It constructs Π^univ with fibre Π(ρ_x(ε)) and central character det(ρ^univ)ε. Its Checks say "The family includes p=2 with absolutely irreducible ρ̄" and "This all-prime family does not use the odd-prime splitting of determinant variation in (iii)". So §6.1's comparison has an object on its right-hand side at p = 2, and the proposed Check ("At p = 2 the base §5.8 constructs no universal family") would be false.

Clarifying edits, which make no change of substance: the supplier-contract bullet for §5.8 now names that paragraph and says "for every prime p, p = 2 included". It also says that the p ≥ 3 hypothesis of the envelope comparison is not used. §6.1 reads "For absolutely irreducible ρ̄_B, at every prime p, prove its comparison …".

## RT-PadicLocalLanglandsForGL2QpPartII~2a/F02 (P3) — applied

Verified. Base §5.12 indexes by "type (M, a, b) … D_pst ≅ M". LocalGaloisDeformationRings §3.8 (head) has the Check "ρ_x … with WD(ρ_x) ≅ M". Both therefore index by Colmez's module M° = M[−1].

- **Layer 6 opening:** new sentences say the objects are the base's R^[0,1]_(M°,B), LL^[0,1]_B(M°) and ρ^[0,1]_(M°). They give R_(B,M) = End_G(LL_B(M)), since LL^[0,1](M°) = LL_p(M°) = LL(M), and name the closed points: the V_(M,ℒ) with semisimplified reduction ρ̄_B.
- **Supplier contracts:** the §5.12 and LocalGaloisDeformationRings §3.8 bullets now state the D_pst/WD indexing.
- **New §6.1 Check:** indexing by M would give LL_p(M) with central character ζη², with |η(p)²| = p^(∓2). That is not unitary, so the base §5.12 would not apply.
- **Dependencies:** Layer 6 already lists "Layers 0 and 4–5", which covers §0.4.

## RT-PadicLocalLanglandsForGL2QpPartII~2a/F03 (P3) — applied differently

The finding is right: gap:fixed-radius-divisibility covers trivial central character only. The proposed repair is insufficient for §7.5, though:

- The two-chart argument (DLB17 Prop. 11.10, lines 2697–2706) kills only a vector whose Weyl transform also lies in ∩_j(u⁺)^j. That holds for the G-stable kernel of the comparison map, but not for the whole intersection, which is what §7.5 needs.
- The intersection is not G-stable. On O(Ω), z lies in every (d/dz)^jO(Ω), but w·z = 1/z has no primitive on the annulus |p| < |z| < 1, which lies in Ω.
- The other route DLB17 cites, COLMEZ19POIDS Prop. 2.20 (line 1240), goes through Lemme 2.19 (line 1206). That lemma assumes Δ⁺_dif has no gl₂-stable lattice, and the assumption fails for de Rham V of weights {0,1}: N⁺_dif is stable.

The repair:

- **§1.7 (new statement):** for every non-trianguline V, at every prime: ∩_(n≥1)φⁿ(D_rig(V̌)) = 0 (COLMEZ14LA Théorème 3.23(i), line 2032); Π(V)_c^P-fin is dense in Π(V)^an; and ∩_j(u⁺)^j(Π(V)^an)′_b = 0 (DOSPINESCU12THESE Théorème 8.4.3 and Remarque 8.4.4). Its route goes through the §1.7 duality, §§1.4–1.6, and density ⇒ vanishing. It has three Checks.
- **§3.3:** a fourth input, this vanishing, which replaces the gap's step in the injectivity argument for general ζ.
- **§7.5:** now cites §1.7 instead of the gap.
- **§2.1 Check:** the claim that ℤ_p-restriction is not injective on E_π is restricted to sections of the sheaf.
- **E9:** gains a pointer to §1.7.
- **Scope and ownership:** this roadmap now owns the density at every prime; the base §4.9 states it for p ≥ 5.

## RT-PadicLocalLanglandsForGL2QpPartII~2a/F04 (P3) — applied

Verified. Layer 4 defines O[M] as C-valued, while §4.12 uses the L-rational Ω¹[M]^(G_ℚ_p).

- **§3.3(i)–(ii):** (i) now reads ((L⊗O(M^p_n))[M])′_b. The exact sequence of (ii) is now 0 → (L⊗O(M^p_n))[M] → …, with a sentence naming its Layer 4 counterparts O[M]^(G_ℚ_p) and Ω¹[M]^(G_ℚ_p).
- **§7.5:** declares its own index: "For r ≥ 0 let Σ_r be … DLB level r …, so that Σ_r = M^p_(2r)". It uses Σ_r throughout, cites §3.3(i) "at CDN level 2r", and has a new Check for r = 1 ↔ n = 2.
- **Same pattern elsewhere:** E2 and the `Suggested.lean` docstring bullet on §7.5 now use Σ_r.

## RT-PadicLocalLanglandsForGL2QpPartII~2a/F05 (P3) — applied differently

Verified. TEI90 lines 256–259 describe a minimal regular model over the unramified base, and lines 260–267 extend the PGL₂ action only.

The sentence "It is the minimal semistable model, so … extend" is replaced by the target "Prove that the actions of G, Ǧ and Gal(K/ℚ_p) … extend to Σ̂". Its route:

- the components y′^(p+1) = ζ(z−z^p) have genus p(p−1)/2 ≥ 1;
- so the component points are the intrinsic nodes (TropicalAndBerkovichArithmetic §2.16);
- automorphisms preserving them extend to the model (§2.17), as in CDN20 Prop. A.1 (line 2227).

A new Check computes the genus by Riemann–Hurwitz. Unlike the proposed repair, I do not assert that Σ̂ *is* the model of ProetaleCohomologyOfPAdicCurvesAndTowers §7.2: that model inserts genus-zero vertices at thick nodes, and the identification is not needed. New supplier contract: TropicalAndBerkovichArithmetic §§2.16–2.17.

## RT-PadicLocalLanglandsForGL2QpPartII~2b/F01 (P2) — applied

Verified against CDN20 lines 242–252 and 809–821, and Prop. 2.5 (lines 859–864, which assume W supercuspidal over F).

- **§4.4:** now opens by defining an L-(φ,N,G_F)-module of rank two and "supercuspidal over F" (irreducible WD_F representation). It defines M_dR = (C⊗M)^(G_F), of rank two over L⊗F, and X⁺_st(M), with F = ℚ_p recovering Conventions and §0.3. *Needs:* gains PadicHodgeTheory §5.4.
- **§4.6:** now assumes "M supercuspidal over F as in §4.4, V finite-dimensional continuous". It adds the reviewer's ℚ_p²-induced Check: the Hom has dimension 2 for M|G_F, which the hypothesis excludes.

## RT-PadicLocalLanglandsForGL2QpPartII~2b/F02 (P2) — applied

Verified. DLB17 Thm 7.11 (lines 1615–1618) and its use at line 2436 (Prop. 11.2) match the finding.

- **§1.7:** a third bullet: π = {v ∈ Π(V)^an : u⁺v = a⁺v = 0} = ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^P-fin, with π ≅ LP_c(…)^Γ. Its route follows DLB17 lines 1619–1642 and the reviewer's text, which I recomputed: Ad u(−x) on E11 and E21, [a⁺,u⁻] = −u⁻, and h = 2a⁺ because k − 1 = 0.
- **New supplier:** that π is spanned by the vectors (1−u(b))v′ uses SmoothRepresentationsOfLocalGroups SR.3a.1 (Jacquet module zero), now a supplier contract.
- **§3.2:** cites this converse, and its *Needs:* gains §1.7.
- **§1.7 Check:** the t⁻²e vector Check now also notes u⁺v ≠ 0.

## RT-PadicLocalLanglandsForGL2QpPartII~2b/F03 (P3) — applied

Verified: DLB17 Thm 7.8 is stated for any two-dimensional V (line 1426), and §1.6 is general.

- **§1.7:** now opens "Let V be absolutely irreducible and two-dimensional, as in §1.5". The statement about vectors fixed by u(ℚ_p) holds "for every such V". The smooth-vector bullets are restricted to "V in the family of π". The duplicated route sentence is merged into the first paragraph.
- **Layer 1 opening:** now lists §1.7's duality and density among the general statements.

## RT-PadicLocalLanglandsForGL2QpPartII~2b/F04 (P3) — applied

The Layer 2 opening gains the sentence: "Within the layer the order of proof is §2.1, §2.2, §2.4, §2.3: the irreducibility and the absence of smooth vectors in §2.3 are read off the exact sequences of §2.4(ii) at k = 1, and §2.4 uses only Layers 0–1". I checked §2.4's *Needs:*: §§0.3, 0.4, 1.1, 1.5. No renumbering.

## RT-PadicLocalLanglandsForGL2QpPartII~2b/F05 (P3) — applied

- **§6.3 hypothesis:** now "a field, or a principal ideal domain with infinitely many maximal ideals, or a finite product of such rings".
- **§6.3 route:** handles the field case: its closed point is its generic point.
- **Checks:** a new Check on A = L against a DVR; the first Check now reads "infinitely many maximal ideals".

## Checks run

- **Elaboration:** `lake env lean` on `Suggested.lean`, run from the content checkout: exit 0, no output. The file declares nothing, so the `#check @name` comparison has nothing to elaborate, and no binder changed.
- **Dependency check:** `depcheck: 257 roadmaps, 2446 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **`roadmaps resolve`:** no cross-roadmap citation and no Lean name found nowhere.
- **Gate failures:** none were listed for this round.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.7 density ⇒ vanishing | (u(pⁿ)−1)²v = 0 | u(pⁿx)v = v + x(u(pⁿ)−1)v ⇒ (u⁺)²v = 0; ((u⁺)^kℓ)(v) = (−1)^kℓ((u⁺)^kv) = 0 | holds | added |
| §1.7 non-triangulinity | trianguline V̌ with R(δ₁) | φ(t) = pt ⇒ te₁ ∈ ∩φⁿ; w·e₁ ∈ ∩(u⁺)^j (Dospinescu lines 3386–3408) | hypothesis needed | Check |
| Whole intersection, not G-stable | z on Ω | z = (d/dz)^j(z^(j+1)/(j+1)!); w·z = 1/z, coefficient of z⁻¹ is 1 on \|p\|<\|z\|<1 | not G-stable | Check |
| §1.7 converse | Ad u(−x) on E11, E21 | E11 + xE12; E21 − xH − x²E12; [E11,E21] = −E21; h = 2a⁺ at k = 1; for V₀(1), k = 3 gives a⁺+a⁻ = 2 | holds in the family only | scoped |
| §1.7 generality | V₀(1), weights {1,2} | m(V) from base §3.11; §1.6 perfect; Casimir 0 | holds | widened |
| §6.1 index | M versus M° | LL(M°) central character ζ, unitary; LL_p(M): ζη², \|η(p)²\| = p^(∓2) | M° | Check |
| base §5.8 at p = 2 | ρ̄ absolutely irreducible | paragraph "For every prime p"; Check "includes p=2" | supplied | disputed |
| §4.6 over F | F = ℚ_p², WD = Ind θ, θ ≠ θ^σ | dim End_(WD_F)(θ′⊕θ′^σ) = 2; F = ℚ_p: 1 | needs "over F" | applied |
| §7.3 genus | p = 2, 3, 5 | 2g−2 = (p+1)(p−2): g = 1, 3, 10 = p(p−1)/2 | positive | Check |
| §6.3 field | A = L; DVR with ρ, ρ⊗χ, χ(p) = 1+p | one closed point = generic point; determinants differ by (1+p)² ≠ 1 | field fine, DVR excluded | applied |
| §7.5 level | r = 1 | 1+pO_D = K_D(2): CDN n = 2, not 1 | consistent | Check |
| §2.1 Check | section supported on pℤ_p | w(pℤ_p) = ℙ¹∖ℤ_p (v(1/x) ≤ −1, 0 ↦ ∞) | true for the sheaf | reworded |
| §2.3/§2.4 order | Needs lines | §2.4 needs §§0.3, 0.4, 1.1, 1.5 only | no cycle | sentence |

## For the maintainer

- **New suppliers:**
  - SmoothRepresentationsOfLocalGroups SR.3a.1 (on main).
  - TropicalAndBerkovichArithmetic §§2.16–2.17, an open roadmap at merge-order line 235, before this roadmap at line 383. The dependency check accepts both.
- **New sources:** COLMEZ14LA (Théorème 3.23(i)) and DOSPINESCU12THESE (Théorème 8.4.3, Remarque 8.4.4), both author-page copies, recorded in `sources.toml` and References.
- **Ownership:**
  - The density of compactly supported P-finite vectors at every prime is now owned here. The base §4.9 states it for p ≥ 5 only; `roadmaps grep` found no other owner.
  - Ownership of the injectivity of ℤ_p-restriction: searched, no owner; it is not used.
- **Source issue, not used here:** COLMEZ19POIDS Proposition 2.20 is stated for every non-trianguline Δ, but its proof uses Lemme 2.19, which assumes Δ⁺_dif has no gl₂-stable lattice. That assumption fails for de Rham Δ with distinct weights, the case DLB17 Remarque 12.1 applies it to.
- **Ids:** no section id changed, and no Lean name changed (`Suggested.lean` declares none).
- **Overlaps:** none listed. Ownership against the open pull requests was checked with `roadmaps grep` for the density and the restriction-injectivity statements.

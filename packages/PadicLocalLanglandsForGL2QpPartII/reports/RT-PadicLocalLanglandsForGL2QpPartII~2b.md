<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13092#issuecomment-6910584008 -->
Red team round 2 pass b (claude) of 41a4c27

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §§4.4 and 4.6 are stated "for finite F/ℚ_p" with objects the README defines only over ℚ_p; with a type of Conventions, §4.6 is false

   Location: `README.md:657` ("For finite F/ℚ_p, a finite-dimensional continuous L-representation V of G_F and a supercuspidal M of slope 1/2, define H_M(V) …") and `README.md:697`–`700` ("If dim V = rank M and this Hom is nonzero, then V is supercuspidal, D_pst(V) ≅ M[−1] and the Hom is one-dimensional").

   Claim: the statements hold for every finite F with M "supercuspidal".

   Witness: Conventions (`README.md:53`) and §0.3 define types, "supercuspidal", M_dR (an L-space) and X⁺_st(M) for (φ,N,G_ℚ_p)-modules only; "M_dR⊗_(L⊗F)H_C(V)" is then ill-typed for F ≠ ℚ_p. CDN20 lines 242–250 and 809–811 take an L-(φ,N,G_F)-module, supercuspidal over F. Counterexample for a type of Conventions: F = ℚ_p², WD(M) induced from a character θ ≠ θ^σ of W_F, V = V_(M,ℒ)|G_F: the Hom of the first bullet is End_(WD_F)(θ⊕θ^σ), of dimension 2, and WD(V)|W_F is reducible.

   Repair. Replace the first sentence of §4.4 by:

   > For finite F/ℚ_p, let M be an L-(φ,N,G_F)-module of rank two: a free L⊗ℚ_p^nr-module with a semilinear Frobenius φ, an operator N with Nφ = pφN and a smooth semilinear action of G_F (CDN20 lines 242–250). Call it supercuspidal over F when its Weil–Deligne representation of WD_F is irreducible, and let it have slope 1/2. Put M_dR = (C⊗_(ℚ_p^nr)M)^(G_F), free of rank two over L⊗_ℚ_p F, and X⁺_st(M) = (B⁺_cris⊗_(ℚ_p^nr)M)^(φ=p) (CDN20 lines 809–812). For F = ℚ_p these are the types, M_dR and X⁺_st(M) of Conventions and §0.3. For a finite-dimensional continuous L-representation V of G_F, define H_M(V) = Hom_(L[G_F])(V, X⁺_st(M)) and H_C(V) = Hom_(L[G_F])(V, L⊗_ℚ_p C) (CDN20, §2.1.2 and Remarque 2.3, lines 800–821).

   In §4.6 replace "For finite F/ℚ_p, supercuspidal M and V a representation of G_F" by "For finite F/ℚ_p, M supercuspidal over F as in §4.4 and V a finite-dimensional continuous L-representation of G_F", and add the Check:

   > Supercuspidality is a condition over F, not over ℚ_p. Let F = ℚ_p² and let M be a type of Conventions whose Weil–Deligne representation is induced from a character θ of W_F with θ ≠ θ^σ. Restricted to W_F it is θ⊕θ^σ, reducible. For V = V_(M,ℒ)|G_F the Hom of the first statement is End_(WD_F)(θ⊕θ^σ), of dimension 2 over L, and V is not supercuspidal over F; so the second statement fails for the restriction of M to G_F, which is not supercuspidal over F.

   Tested on the refuting instance: with the repaired hypothesis M|G_F is excluded (θ⊕θ^σ reducible); for F = ℚ_p nothing changes.

2. **F02** (P2) §1.7 cites DLB17 Théorème 7.11 but states only one inclusion; the equality is used by §3.2 and has no owner

   Location: `README.md:372`–`375` ("Prove the following description of the smooth vectors (DLB17, Proposition 7.9 and Théorème 7.11, lines 1593–1615): The P-smooth vectors of infinite slope, ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^P-fin, are contained in π.").

   Claim: §1.7 is the "smooth-vector criterion" that later layers use.

   Witness: DLB17 lines 1615–1618 state Π(V)^lisse = {v ∈ Π(V)^an : u⁺v = a⁺v = 0} = Π(V)_c^P-lisse and the P-isomorphism of π with the Kirillov functions. The README states neither equality, nor does the base roadmap (no occurrence). DLB17 lines 2435–2446 (the proposition behind §3.2) use the theorem twice; §3.2's *Needs:* (`README.md:546`) omits §1.7.

   Repair. Add a third bullet to the list at `README.md:374`–`375`:

   > - Conversely π = {v ∈ Π(V)^an : u⁺v = a⁺v = 0} = ker u⁺ ∩ ker a⁺ ∩ Π(V)_c^P-fin, so v ↦ φ_v restricts to a P-isomorphism π ≅ LP_c(ℚ_p^×, N⁺_dif(V)/D⁺_dif(V))^Γ (DLB17, Théorème 7.11, lines 1615–1618).

   and after the paragraph on vectors fixed by u(ℚ_p) (`README.md:377`) add:

   > The route for the equality: let v ∈ Π(V)^an with u⁺v = a⁺v = 0. Its orbit maps under u(ℚ_p) and diag(ℤ_p^×,1) have zero derivative, hence are locally constant, so v is P-finite. For x ∈ ℚ_p, v_x = u(x)v − v is killed by u⁺ and by a⁺, since a⁺u(x) = u(x)(a⁺ + xu⁺), and has infinite slope (§1.3), so v_x ∈ π by the first bullet and u⁻v_x = 0. As u⁻u(x) = u(x)(u⁻ − xh − x²u⁺) with h = a⁺ − a⁻ = 2a⁺ here, u⁻v is fixed by u(ℚ_p); it is P-finite, so it is 0 by the statement above. Thus gl₂ kills v and v is smooth. Finally π ⊂ Π(V)_c^P-fin: π is supercuspidal, so it is spanned by the vectors (1 − u(b))v′, which have infinite slope by §1.3.

   Add `§1.7` to the *Needs:* line of §3.2.

   Tested: the vector of the fourth Check of §1.7 (φ_v(1) the class of t⁻²e) has u⁺v ≠ 0, since t·t⁻²e = t⁻¹e ∉ D⁺_dif,n, and is correctly outside π; a function with one value in N⁺_dif/D⁺_dif is killed by t and by ∇ and is smooth. h = 2a⁺: a⁺ + a⁻ = k − 1 = 0 at weights {0,1} (§1.5).

3. **F03** (P3) §1.7 narrows the Kirillov duality formula to the family of π; the source and §1.5 have it for every V

   Location: `README.md:372` ("For V in the family of π, prove first that Π(V)_c^P-fin ⊂ Π(V)^an … prove {ℓ, v}_ℙ¹ = Σ_(j∈ℤ) {i_(j,n)(ℓ), φ_v(p⁻ʲ)}_dif").

   Witness: DLB17 lines 1572–1586 state the inclusion and the formula for the V of their §7.1 (any two-dimensional V, line 1426); the family enters only at line 1593. `README.md:266` says the family "enters §1.5 only as a specialisation", and §1.6 is general.

   Repair: replace "For V in the family of π, prove first that" by "Let V be absolutely irreducible and two-dimensional, as in §1.5. Prove first that", and replace "Prove the following description of the smooth vectors" by "For V in the family of π, prove the following description of the smooth vectors". The statement on vectors fixed by u(ℚ_p) keeps its proof for every such V.

   Tested on V₀(1) of the second Check of §1.5 (weights {1,2}, outside the family): m(V) exists by the base roadmap §3.11, the pairing of §1.6 is perfect between D⁺_dif(V̌)[1/t] and D⁺_dif(V)[1/t], and the formula is the source's.

4. **F04** (P3) §2.3 needs the later §2.4

   Location: `README.md:451` ("*Needs:* §§2.1 and 2.4; …") and `README.md:439` ("Hence Π(π,0) ≅ Π(M°,−1)⊗det, which §2.4 writes Π(M,−1)⊗det … (§2.4(ii))").

   Witness: §2.3 is derived from the exact sequences of §2.4(ii) at k = 1; §2.4 (`README.md:471`) needs only §§0.3, 0.4, 1.1 and 1.5. No cycle, but the target order contradicts its own dependency line.

   Repair: add to the opening paragraph of Layer 2 (`README.md:400`) the sentence "Within the layer the order of proof is §2.1, §2.2, §2.4, §2.3: the irreducibility of §2.3 is read off the exact sequences of §2.4(ii) at k = 1." (Exchanging the two subsections would renumber ids that §§3.1, 3.3, 7.2, E25 and the Lean docstring cite.)

5. **F05** (P3) §6.3 excludes a field, the case the first Check of §6.5 instantiates

   Location: `README.md:1051` ("Let A be a principal ideal domain with infinitely many prime ideals, or a finite product of such.") against `README.md:1102` ("For R_(B,M) = L (one closed point), Ř = L …") and `README.md:1095` ("Apply §6.3 …").

   Witness: A = L has one prime ideal, so §6.3 as stated does not apply to the instance of the Check; a discrete valuation ring, also with one closed point, must stay excluded (first Check of §6.3).

   Repair: replace the sentence by "Let A be a field, or a principal ideal domain with infinitely many maximal ideals, or a finite product of such rings." and add after "so let A be one principal ideal domain, with fraction field F": "If A is a field, its closed point is its generic point and the hypothesis is the conclusion."

   Tested: A = L gives V_x ≅ W_x ⇔ V ≅ W; A = O with ρ and ρ⊗χ, χ(p) = 1+p, remains outside the hypothesis.

Round 2. Two new P2 findings (S01, S02) and three P3 findings (S03–S05). All fourteen round-1
findings are repaired at this head. No finding re-raises a settled one: the repair report marks
nothing `not actionable in this package`.

Read in full: `packages/PadicLocalLanglandsForGL2QpPartII/README.md` (1295 lines, 51 numbered
subsections) and `packages/PadicLocalLanglandsForGL2QpPartII/Suggested.lean` (79 lines, no
declaration).

## Round-1 findings at this head

| Id | Status | Witness at 41a4c27 |
|---|---|---|
| 1a/F01 (gap supplier) | repaired | `README.md:145`: "What GL2AutomorphicRepresentationsAndTransfer must provide (gap:cuspidal-projectivity-coefficients): in R16.2.10, the form with coefficients in a field of characteristic zero"; `design/plan.json` has the same slug with supplier GL2AutomorphicRepresentationsAndTransfer, section R16.2.10. R16.2.10 exists at the supplier's head with the complex statement and names the L-descent without stating it. |
| 1a/F02, 1b/F03 (no smooth vectors) | repaired | `README.md:441`: "Prove also that Π(V)^an/π has no nonzero smooth vector for V in the family of π, and that Π^an_(M,ℒ)/LL(M) has none for every supercuspidal type M"; cited at `README.md:516` and `:570`; §2.3 is in the *Needs:* of §§3.1 and 3.3. Route recomputed (table below). |
| 1a/F03 (Γ_m) | repaired | `README.md:1190`: "∫_(Γ_m)μ ∈ H¹_e(G_(ℚ_p(μ_(p^m))), V) for every m ≥ 1 … Here Γ_m = 1+p^mℤ_p ⊂ Γ, so that Γ_1 = Γ at p = 2". |
| 1a/F04 (m(V), inclusion) | repaired | `README.md:372`: "prove first that Π(V)_c^P-fin ⊂ Π(V)^an … there is an index m(V) such that every element z … has Res_ℤ_p(z) and Res_ℤ_p(wz) in D^(]0,r_m(V)])(V̌)". Agrees with DLB17 lines 1572–1581. |
| 1a/F05 (X_st) | repaired | `README.md:697`: "put X_st(M) = (B_st⊗_(ℚ_p^nr)M)^(N=0, φ=p) (CDN20 line 860)". |
| 1a/F06 (colim) | repaired | `README.md:313`: "D⁻_dif(V) = colim_n D⁺_dif,n[1/t]/D⁺_dif,n"; agrees with DLB17 line 1537. |
| 1a/F07 (normalisation of Conjecture 0.10) | repaired | `README.md:1156`: "in the normalisation of Conventions … the action is the left one of §3.1, the multiplicity is Hom_Ǧ(JL(M), −) … and the twist is det⁻¹"; Check at `:1162`. |
| 1a/F08 (derived category) | repaired | `README.md:1218`: "the derived category (Mathlib `DerivedCategory`) of the abelian category 𝒞_G of coadmissible D(G,L)-modules of LocallyAnalyticRepresentationsOfLocalGroups §1.1". §1.1 exists with that API; `DerivedCategory` is at `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87`. |
| 1a/F09 (Summary) | repaired | `README.md:7` lists §§7.2–7.6 by their mathematics. |
| 1b/F01 (M versus M[−1]) | repaired | `README.md:241`: "so M ≅ M(π)[1] … LL(M) = LL_p(M[−1])"; `:455`: "M° = M[−1] its module in Colmez's normalisation". Central characters recomputed (table). |
| 1b/F02 (bijectivity of ∂) | repaired | `README.md:282`: "Injectivity: choose h with t^hN_rig(V) ⊂ D_rig(V); then (∇−h)(t^hx) = t^(h+1)∂x". |
| 1b/F04 (central character in (c)) | repaired | `README.md:771`: "(c) If Π is admissible unitary of finite length with a central character"; base roadmap §2.5 carries the same hypothesis. |
| 1b/F05 (Checks of §§4.4, 7.7) | repaired | `README.md:668` (Tate) and `:1241` (cokernel (Ω¹(Σ_r)^ρ)′ ≠ 0). |

No repair introduced a false statement. One repair left a build-order defect (S04).

## Dependency check

    depcheck: 253 roadmaps, 2409 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The roadmap is line 383 of `merge-order/ORDER.txt`; the base roadmap is line 33, GL2AutomorphicRepresentationsAndTransfer 101, CompletedCohomologyAndLocalGlobalCompatibility 252, LocallyAnalyticRepresentationsOfLocalGroups 253, ProetaleCohomologyOfPAdicCurvesAndTowers 265, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower 382. `roadmaps resolve` on the README lists no citation and no Lean name found nowhere.

## The pass (values computed)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| §0.1 Example p = 7 | θ = θ₀³ on 𝔽₄₉^× | order 16, θ⁶ ≠ 1; θ(g⁸) = −1; squares on μ₆ of order ∣ 3 | holds | none |
| §0.2 decomposition | n = 0 | Ǧ/(p^ℤO_D^×) = ℤ/2: two characters δ∘Nrd, δ unramified, δ(p)² = 1 | holds | none |
| §0.3 line | weights {0,1} | Fil⁰(B_dR⊗D_dR) = B⁺⊗ℒ + tB⁺⊗D_dR; t_H = −1 = t_N(M[−1]) | holds | none |
| §0.4 Check 4 | pI₂ | η(det pI₂) = η(p)² ∈ {p², p⁻²} | holds | none |
| §1.2 | h general | ∇(t^hx) = ht^hx + t^(h+1)∂x | holds | none |
| §1.3 third bullet | c = c₀+p^Nc₁ | S(1−u(c₀)) = (1−u(p^N))Σ_(i<c₀)u(i); 1−u(p^Nc₁) ∈ (u(p^N)−1)·End on the span | holds | none |
| §1.3 Check | b = p⁻¹, m = 1, N = 2 | support p⁻¹ℤ_p^×; Σ_(i<p²)ε(ix) = pΣ_(i<p)ζ_p^(iu) = 0 | holds | none |
| §1.4 action | g₁g₂ | ε(b₁x)e^(tb₁x)ε(b₂a₁x)e^(tb₂a₁x)φ(a₁a₂x) both sides | left action | none |
| §1.5 | (a,b) general; (0,1); (1,2); X²−c | [u⁺,u⁻] = 2∇+1−k = a⁺−a⁻; ∇(∇−1) = t²∂²; Casimir 0, 0, (4c−1)/2 | holds | none |
| §1.6 | m ≥ 0 | product in t^(m−1)L_∞[[t]]dt, residue 0 for all partners iff m ≥ 1 | holds | none |
| §1.7 kernel | weights {0,1} | (t⁻¹D⁺/D⁺)^(∇=0) = N⁺/D⁺: ∇ = −1 on t⁻¹ℒ, 0 on N⁺/tN⁺ | holds | S02, S03 |
| §1.7 Check 4 | N ≥ 0 | (e^(tp^N)−1)t⁻²e ≡ p^Nt⁻¹e; (u(1)−1)² kills it | holds | none |
| §2.2 | O(Ω), g general; w | g⁻¹z = (dz−b)/(a−cz); g′(g⁻¹z) = (a−cz)²/det g; w: ∂⁻¹, −∂²u⁺ = z²f′ | holds | none |
| §2.2 versus §1.5 | E_π on ℤ_p | ∂ = ∇t⁻¹, −∂²u⁺ = −t⁻¹(∇−1)∇ | agree | none |
| §2.3 smooth vectors | (u⁺)² = 0 | t²Res_ℤ_p(z) = 0 ⇒ Res_ℤ_p(z) = 0, same for wz ⇒ z = 0 | holds | S04 |
| §2.4 (i)–(iii) | k = 0, 1; ζ = 1 | Casimir −1/2, 0; centre x^kω, ω = x⁻¹; [u⁺, −∂u⁺∂] = 2c·u⁺∂ + c² with [∂,u⁺] = c, forcing c = 1 | holds | none |
| §2.4 étaleness | k = 1, 2 | det(p) = 1; p, δ₂(p)² = p⁻¹ gives 1 | holds | none |
| §2.4 versus §2.2 | Π(M,−1)⊗det and its dual | a⁺ = u⁺∂ − 1 + 1; on the dual −(u⁺∂)ᵗ = ∂u⁺ | agree | none |
| §3.1 Lie action | O(k); Ω¹′; O′ | a⁺ = u⁺∂+1−k, u⁻ = −∂²u⁺+k∂; duals ∂u⁺, −∂u⁺, −∂²u⁺; ∂u⁺−1 | holds | none |
| §3.1 Check | ξ | central character ξ² at p is a root of unity | holds | none |
| §3.3 route, injectivity of Φ_i | Π^an = π⊕X | completion π^∧⊕X^∧ = Π irreducible; both summands map nonzero to Π | contradiction, as claimed | none |
| §4.3 | S = Le₁, Ae₁ = 0; Ae₁ = Ae₂ = e₃ | T = S, T = L(e₁−e₂) invariant: excluded; Kronecker form has only L_ε^T blocks | holds | none |
| §4.5 Check | cocycle | c(gh) = c(g)+gc(h) for l·e₂ + l²e₁/2 | holds | none |
| §4.6 | F = ℚ_p², induced type | Hom = End(θ⊕θ^σ), dimension 2 | fails for a type of Conventions | S01 |
| §4.9 | H¹(p^ℤ, ∏O_L/p^k) | orbits infinite, T−1 onto | 0 | none |
| §4.12–4.14 | Π = η∘det; V = δ | Hom_G(η⁻¹, Ω¹) = 0 (St^an has no character quotient); special sector δ′ = δ only | agree with "0 otherwise" | none |
| §5.1 Check | p = 5 | indicator of 5^jℤ₅^× pairs to 1, 0 | holds | none |
| §6.1 Check 4 | ρ_x(ε) | det·ε against det·ε⁻¹ | holds | none |
| §6.2 Check 4 | χ of order 3 | η(a²)⁻¹ζ₃ on both; ζ₃² for the wrong twist | holds | none |
| §6.3 | A = L; DVR; char p | trivial; excluded; equal traces ⇒ isomorphic for absolutely irreducible | holds | S05 |
| §6.4 | p = 3 | base §5.6(iii): Z_B = R^ps/(O-torsion) at p = 3, isomorphism for p ≥ 5 | "p > 2" correct | none |
| §7.2 row | aI₂ | a^k, a^(−k−2)a^(2k+2), a^k; preimage a^(−k−1)·a·a^(2k) = a^k; sub at s = −k is Π(M,−k−1)′⊗det⁻¹ | holds | none |
| §7.3 Check | y = ϖ_Ky′ | y′^(p²−1) + (z−z^p)^(p−1) = ∏(y′^(p+1) − ζ(z−z^p)); ζ ∈ μ_(2(p−1)) ⊂ ℚ_p² | holds | none |
| §7.6 | Hom | Hom((Π^an)′, M*_dR⊗π′) = M*_dR, dimension 2; F⁰ a line | holds | none |
| §7.7 Check | ρ ≅ ρ^∨ | ρ^∨ ≅ ρ⊗ω_ρ⁻¹, ω_ρ = 1 | holds | none |

## Verified sound

- Declarations read: 0. `Suggested.lean` has `import Mathlib`, the module docstring, the namespace and nothing else; no `sorry`, `set_option`, `#check` or `lemma`. Its ten bullets match README §§4.14, 4.12–4.13, 6.6, 3.3, 3.1, 2.3–2.4, 7.2–7.3, 7.4, 7.5 and 7.6. No Lean was run and no `#check` comparison was made: there is no declaration to elaborate.
- Headline theorems (Summary and docstring): the Galois-socle theorem, the Banach multiplicities, the factorisation, the realisation of §3.3, the discharge of §3.1, the irreducibility and weight change, §§7.2–7.6. None is statable at the pins: the pinned Tau Ceti has no Robba ring, Drinfeld half-plane, Bruhat–Tits tree, Banach or locally analytic representation carrier (its only near name is `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean`), and the pinned Mathlib has `Mathlib/RingTheory/Perfectoid/BDeRham.lean` as the docstring says. Nothing is padding.
- Targets read: 51 subsections, Conventions, the supplier contracts, 25 source corrections.
- Pinned declarations checked (6): `Bornology.IsVonNBounded` (`Bounded.lean:61`), `NormedSpace.image_isVonNBounded_iff` (`Bounded.lean:495`), `WithSeminorms.banach_steinhaus` (`Barrelled.lean:164`), `DerivedCategory` (`DerivedCategory/Basic.lean:87`, with `HasDerivedCategory` at `:74`, no boundedness condition), the two `WithSeminorms` boundedness theorems by name.
- Locators verified against the cached texts (76): DLB17 26 (among them lines 434, 1063, 1071, 1184–1209, 1460, 1473–1543, 1550–1586, 1593–1618, 2432–2449, 2469–2472, 2633, 2815–2822, 2861–2880), CDN20 21 (242–252, 749–756, 800–821, 822–853, 857–913, 917–963, 1078–1169, 2247), CDN23 15 (2553–2557, 2574–2595, 2606–2614, 2620–2700, 2786–2796), COLMEZ19POIDS 11 (146–271), TEI90 3 (177, 232–236, 251–259).
- Checks tested by computation: 61 (table above).
- Sibling citations checked at the cited heads (32 section ids): base roadmap §§0.1, 0.2, 1.7, 2.5, 2.7, 3.1, 3.8, 3.11, 4.1k, 4.2, 4.2a, 4.9, 4.11, 5.3, 5.6, 5.8, 5.12, 6.7, 6.9 (statements read for §§2.5, 3.11, 5.6); GL2AutomorphicRepresentationsAndTransfer R16.2.10 (read); LocallyAnalyticRepresentationsOfLocalGroups §§0.3, 0.5, 1.1 (§1.1 read); CompletedCohomologyAndLocalGlobalCompatibility §§2.7, 4.9, 6.3, 6.4 (§§4.9, 6.4 read); ProetaleCohomologyOfPAdicCurvesAndTowers §7.2 (read); PadicDifferentialEquationsAndRigidCohomology §RD.2.43; the remaining ids were resolved by `roadmaps resolve`.
- Declared gaps: four slugs, identical in `design/plan.json` and the README, each with a named supplier and section; none raised.
- Ownership: `roadmaps grep` for the smooth-vector equality, P-finite vectors and this roadmap's name. The base roadmap (line 23), ProetaleCohomologyOfPAdicCurvesAndTowers (line 1009) and TriangulineVarietyAndItsLocalModel (line 19) name this roadmap as the owner of what it states; none uses it as a supplier, so "No roadmap cites this one as a supplier" holds. No fully qualified Lean name can collide.
- Policy: the pull request changes only `packages/PadicLocalLanglandsForGL2QpPartII/`. No pull-request number, process narrative, `lemma` declaration or algorithm in the README or the docstring ("lemma" occurs only as "Schur's lemma", "Shapiro's lemma" and in locators). Every target has a locator. Each definition has at least three Checks.
- Overlaps: none listed; the closest roadmap is the base roadmap, whose §§2.5, 3.11, 5.6 and 6.9 were compared with what the README says they supply.

## Not verifiable

- The proof routes of §§2.1, 5.4, 6.4 and 6.5 beyond their Checks and the source statements read.
- Source corrections E1, E5–E9, E12, E13 (complement step), E17, E19: the locators exist; that each step is a gap was not re-derived.
- DLB17 line 1939 (a use of Théorème 7.11 inside the chapter behind §2.2): seen by search only, not read in context; S02 therefore asks for the *Needs:* edge of §3.2 only.
- §7.3, "It is the minimal semistable model": TEI90 lines 256–259 speak of the minimal regular model over the unramified base; over O_K the claim rests on the components y′^(p+1) = ζ(z−z^p) having positive genus, which was computed (p(p−1)/2), not found in a source.
- The statements behind the four declared gaps.
- TEI90 is an OCR text; the display at line 255 is legible only in outline.

## Source issues

- **Error** in DLB17 at Proposition 7.7(b), printed page 38: the source says the orthogonal of the unfiltered lattice of the Cartier dual is t^k times the lattice for weights 0 and k; it should be t times the lattice for every k ≥ 1; affects a stated result.
- **Gap** in DLB17 at the proof of Théorème 5.1, §5.3, printed page 30: the source says the analytic quotient has no nonzero smooth vector and leaves it as an exercise; it should be proved, for instance from irreducibility and the injectivity of t²; affects the proof.
- **Misprint** in DLB17 at Théorème 1.9, printed page 11: the source says the integration domains are 1+pⁿℤ_p for every n ≥ 0; it should be the whole group Γ at n = 0, since ℤ_p is not contained in Γ; affects nothing.
- **Misprint** in CDN20 at the proof of Proposition 2.5, printed page 22: the source says the Hom has dimension 0 or 1 according as the modules are isomorphic or not; it should be 1 when isomorphic and 0 otherwise; affects nothing.
- **Gap** in CDN20 at Proposition 2.9, printed page 24: the source says the identification with the analytic dual, for every supercuspidal module, is the main theorem of Dospinescu–Le Bras; it should note that that theorem assumes trivial central character; affects the proof.
- **Misprint** in CDN23 at Théorème 5.15, printed page 68: the source defines the dual coefficient module as the dual of itself; it should be the continuous L-dual of the type ring; affects nothing.
- **Gap** in CDN23 at the proof of Lemme 5.12, printed page 67: the source says equal traces and irreducibility over the fraction field give an isomorphism there; it should first prove absolute irreducibility, which the trace argument needs in positive characteristic; affects the proof.
- **Misprint** in COLMEZ19POIDS at Remarque 0.2(ii), printed page 4: the source says the quotient by the locally algebraic part is Π(M,−k); it should be Π(M,−k) twisted by x^k, as its Théorème 0.6(iii) states; affects nothing.

Source independence: 20 passages compared with 5 sources (DLB17 Définition 7.4, Remarque 7.5, Théorèmes 7.3, 7.8 and 7.11, §5.3, Proposition 12.2, §12.3; CDN20 §2.1.2, Proposition 2.5, §2.1.5, proof of Théorème 2.15, Remarque A.2, Corollaire 2.16 against the Lean docstring; CDN23 Lemme 5.12, Définition 5.14, Propositions 5.16 and 5.19; COLMEZ19POIDS Théorèmes 0.6 and 0.8; TEI90 lines 251–259), none shared beyond formulas and theorem statements whose hypotheses can be written in one way; largest share DLB17, 115 of 246 source mentions; contents compared with DLB17 (chapters 3–12): independent. Layer 1 draws on its chapters 6–7, Layer 2 on 8–9 with COLMEZ19POIDS, Layer 3 on 3, 4, 5 and 11 (after 6–9, against the source's order), Layers 4–6 on CDN20 and CDN23, Layer 7 on Remarque 11.12 and chapter 12 with TEI90; the order Layer 1, 2, 3 is forced by the *Needs:* lines of §2.1 (§§1.1, 1.2, 1.6, 1.7) and §3.1 (§§2.1, 2.3). No table, figure or list is taken over.

## For the human reviewers

- **Licence.** CDN20 and COLMEZ19POIDS are read from authors' pages (`packages/PadicLocalLanglandsForGL2QpPartII/sources.toml`: `licence_class = "author-page"`); the README cites line numbers of those copies, not of the journals.
- **Not tested.** TEI90 is an OCR of a scan; its displayed equations are only partly legible, so the wording comparison with it covered prose only.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "41a4c272264bf29097e6dd5b125c5600f1493657", "job": "RT-PadicLocalLanglandsForGL2QpPartII~2b", "model": "fable", "worker": "chris-x89"} -->

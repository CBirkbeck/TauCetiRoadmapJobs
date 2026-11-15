<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13046#issuecomment-6900169285 -->
Red team round 1 pass b (claude) of dc03a56

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) H is connected; the README keeps a distinction H versus H° that does not exist and attributes a slip to GLX that is not one

   Location: `packages/PadicHodgeTheoryPartII/README.md:36` "The tensor group of the category generated
   by the image of `F_{b,η}` is H, not H°." and `README.md:231` "GLX26 §5.1 ¶14 (arXiv v3 p. 32) calls
   H° the Tannakian group; the full closure H is meant."

   Claim: for the crystalline ξ of an admissible pair over a finite K/Q̆_p the full Zariski closure H
   may differ from its identity component, and GLX misstate which one is the Tannakian group.

   Witness: K has algebraically closed residue field. A representation of H trivial on H° is an object
   of `T_{b,η}` with finite Galois image; its filtered isocrystal has all jumps 0, hence slope 0, hence
   is the unit object; so π_0(H) = 1 and H = H°.

   Computation. Let W be an object of `T_{b,η}` on which ξ(Γ_K) acts through a finite quotient. W is
   crystalline with all Hodge–Tate weights 0, so D_cris(W) has the trivial filtration (single jump 0);
   weak admissibility gives t_N = t_H = 0 on every subobject and quotient, so every slope is 0; over
   F = Q̆_p a slope-zero isocrystal is spanned by φ-fixed vectors (VectorBundlesAndIsocrystals Layer 1,
   "Dieudonné–Manin classification of finite isocrystals"), so D_cris(W) is a sum of unit objects and W
   is trivial. Under `T_{b,η}` ≃ Rep_{Q_p}(H) (the first bullet of §0.7) every representation of
   π_0(H) = H/H° is such a W, so the regular representation of π_0(H) is trivial and π_0(H) = 1. The
   README's own instances agree: §0.7 Check 2 has H = 𝔾_m = H°, Check 1 has H = 1. Chen14 line 885–886
   describes the full closure as the smallest algebraic subgroup containing the image of μ_HT, which is
   connected; GLX26 line 1290–1291 is therefore correct as printed. Nothing downstream is false (every
   use of H° stays true with H° = H), but the note at README:231 would enter the errata register as an
   error of GLX26.

   Repair. (a) Add a fourth bullet to §0.7 after "Derived containment":

   > - Connectedness: H = H°. A representation of H trivial on H° is an object of `T_{b,η}` with finite
   >   Galois image; its filtered isocrystal has the single jump 0, so by weak admissibility all its
   >   slopes are 0, and over Q̆_p a slope-zero isocrystal with trivial filtration is a sum of unit
   >   objects; hence the representation is trivial and π_0(H) = 1. *Needs:* the Tannakian description
   >   above; PadicHodgeTheory §5.5; VectorBundlesAndIsocrystals Layer 1 ("Dieudonné–Manin
   >   classification of finite isocrystals").

   and the Check:

   > - Negative control for connectedness: over K = Q_p, whose residue field is finite, the unramified
   >   quadratic character is crystalline with image {±1} and Zariski closure μ_2, which is
   >   disconnected; its filtered isocrystal is the line with φ = −σ and jump 0. Over Q̆_p the equation
   >   σ(x) = −x has a unit solution, the same line is the unit object and the character is trivial.
   >   The algebraically closed residue field is what forces H = H°.

   (b) Replace README:36's last two sentences by: "GLX's Mumford–Tate group MT(b,η) is H°, which equals
   H by §0.7 (connectedness); the statements below are written for H and do not use the equality unless
   they say so." (c) Replace README:231's sentence "GLX26 §5.1 ¶14 (arXiv v3 p. 32) calls H° the
   Tannakian group; the full closure H is meant." by "GLX26 §5.1 ¶14 (arXiv v3 p. 32) states the
   Tannakian description for H°; this agrees with the first bullet by the connectedness bullet."
   Tested on the refuting instance: for G = 𝔾_m, b = p^m, μ = z^m the repaired text gives H = H° = 𝔾_m
   (m ≠ 0) and H = H° = 1 (m = 0), as §0.7 Checks 1–2 compute.

2. **F02** (P3) §1.4: no Check distinguishes σ_0(O) from σ_0⁻¹(O)

   Location: `README.md:304` "carries the isotypic part `(V⊗Q_{p^s})_O` onto
   `(V⊗Q_{p^s})_{σ_0(O)}`"; Checks at `README.md:308–310`.

   Claim: the three Checks pin the direction of the transport.

   Witness: the only nontrivial Check uses `Res_{Q_{p²}/Q_p}𝔾_m`, where σ_0 has order 2 and
   σ_0 = σ_0⁻¹; split G has σ_0 = 1. The wrong model O ↦ σ_0⁻¹(O) passes all three.

   Computation of a discriminating instance. L = `Q_{p³}`, G = Res_{L/Q_p}𝔾_m, V = L, s = 3, b = 1.
   `V⊗L` = ∏_{τ∈Gal(L/Q_p)} L by x⊗y ↦ (τ(x)y)_τ, the factor τ carrying the character e_τ, and
   γ·e_τ = e_{γτ}. Then (1⊗σ)(w)_τ = σ(w_{σ⁻¹τ}): the factor of e_{τ′} is carried onto the factor of
   e_{στ′} = σ_0(e_{τ′}), not onto that of e_{σ⁻¹τ′}; for the three characters e_1, e_σ, e_{σ²} these
   differ (e_1 ↦ e_σ versus e_1 ↦ e_{σ²}). The README's statement is the correct one.

   Repair: add to the Checks of §1.4:

   > - For G = `Res_{Q_{p³}/Q_p}𝔾_m`, s = 3, b = 1 and V = `Q_{p³}`, write `V⊗Q_{p³}` = ∏_τ `Q_{p³}`
   >   with x⊗y ↦ (τ(x)y)_τ, the factor τ carrying the character e_τ. Then (1⊗σ)(w)_τ = σ(w_{σ⁻¹τ}), so
   >   the e_1-part is carried onto the e_σ-part, where σ_0(e_1) = e_σ, and not onto the e_{σ²}-part
   >   where σ_0⁻¹(e_1) = e_{σ²}; the inverse convention fails here, while it passes the quadratic
   >   example.

3. **F03** (P3) the ArithmeticGaloisRepresentations §7.6 contract drops the supplier's hypothesis

   Location: `README.md:87` "the equality of the closure of α(Σ) with α of the closure for a
   homomorphism α of algebraic groups".

   Claim: §7.6 supplies that equality over the fields used here (Q_p in §§3.2 and 3.5).

   Witness: ArithmeticGaloisRepresentations §7.6 at its open head: "Prove that over an algebraically
   closed field the closure of `α(Σ)` is `α(Σ̄)`"; the next clause adds "that closures commute with
   field extension". The Q_p statement is the combination of the two, which the README does not say.

   Repair: replace the quoted clause of README:87 by "over an algebraically closed field, the equality
   of the closure of α(Σ) with α of the closure for a homomorphism α of algebraic groups, and the
   compatibility of closures with field extension; together they give, for Σ ⊆ G(Q_p) and α defined
   over Q_p, that the closure of α(Σ) is the scheme-theoretic image of the closure of Σ, the form used
   in §§3.2 and 3.5", and delete the now duplicated trailing "and the compatibility of closures with
   field extension". Tested on §3.2: Σ = ξ(Γ_K) ⊆ G(Q_p), α = ρ a closed immersion: closure of ρ(Σ) is
   ρ(H), as used.

4. **F04** (P3) Milne iAG 8.20–8.21 is cited for an equality it does not state

   Location: `README.md:47` "These give the equality f(D(J)) = D(f(J)) of §3.4 (Milne iAG Proposition
   8.20 and Corollary 8.21, p. 131)" and `README.md:447` "f(D(J°)) = D(f(J°)) ⊇ D(G_der) = G_der (Milne
   iAG Proposition 8.20 and Corollary 8.21, p. 131)".

   Claim: the cited statements contain the image equality.

   Witness: MilneiAG line 5283 (Proposition 8.20: DG is generated by the commutator map) and line
   5297–5302 (Corollary 8.21: base change, connectedness, points, characteristic); neither mentions a
   homomorphism f or an image.

   Repair: at both places replace the parenthesis by "(Milne iAG Proposition 8.20, p. 131, describes
   D(J) as the subgroup generated by the commutator map, from which the image equality follows because
   f carries commutators onto commutators of f(J); Corollary 8.21(b), p. 131, gives connectedness of
   D(J°))". The Tau Ceti derivation already written in §3.4 is unchanged. Tested on §3.4 Check 1:
   J = SL_2, f: GL_2 → PGL_2, f(D(J)) = f(SL_2) = PGL_2 = D(PGL_2).

5. **F05** (P3) μ^♮ is said to be the notation of BunGAndNewtonStrata §1.7, which writes μ♯

   Location: `README.md:33` "with μ^♮ and μ^◇ the Hodge invariants of its §1.7".

   Claim: BunGAndNewtonStrata §1.7 defines an invariant named μ^♮.

   Witness: BunGAndNewtonStrata §1.7 at its open head: "Put `μ♯=[μ*]` in `π_1(G)_Γ` and
   `μ◇=|Γ·μ*|^−1 sum`"; §1.23 writes `κ(b)=μ♯`. PadicHodgeTheory §5.5 writes `μ^(natural)`; the README
   itself writes μ^♯ for HeckeStacksAndLocalShtukas in the same paragraph.

   Repair: replace the quoted clause by "with μ^◇ the Galois average of its §1.7 and μ^♮ the class of
   the dominant representative in π_1(G)_Γ, written μ♯ in its §§1.7 and 1.23 and μ^♮ in GLX26 ¶2
   (arXiv v3 p. 14) and PadicHodgeTheory §5.5". Tested on 𝔾_m, μ = z^h: all three notations give
   h ∈ ℤ = π_1(𝔾_m)_Γ, and [b] ∈ B(G,μ) reads m = h as in §2.3 Check 2.

6. **F06** (P3) §2.3: the field E of the proof plan must lie in K, and the plan does not say why it does

   Location: `README.md:381` "Choose s and a finite E containing `Q_{p^s}` and a field of definition of
   a representative μ; genericity over the reflex field persists over E".

   Claim: η: Spec K → Fl_μ, generic over the reflex field E_0, gives a generic K-point of
   Fl_μ = G_E/P_μ; §§1.5, 2.2 and 2.4 then use E ⊆ K ("K/F finite containing the field of definition
   E", README:314).

   Witness: G = D^× for the quaternion algebra over Q_p, {μ} = (1,0), the README's own instance at
   README:91: E_0 = Q_p, and E = Q_p(√p) is "a finite E containing a field of definition of a
   representative" with E ⊄ K = F = Q̆_p; a K-point of Fl_μ ⊗ E does not exist for this E.

   Repair: replace the quoted sentence by "Choose s as in the Conventions and put E = `Q_{p^s}`·E_0 for
   the reflex field E_0; then E ⊆ K because `Q_{p^s}` ⊂ F ⊆ K and E_0 ⊆ K. Since `G_{Q_{p^s}}` is
   quasisplit with T ⊆ B over `Q_{p^s}`, the B-dominant representative μ ∈ X_*(T) of the class is
   fixed by Γ_E, so it is defined over E. The K-point η factors through Fl_μ ⊗_{E_0} E = G_E/P_μ, and
   its image is the generic point because Fl_μ is geometrically irreducible and the projection to
   Fl_μ over E_0 is finite." Tested on the witness: s = 2, `Q_{p²}` splits D, E = `Q_{p²}` ⊂ Q̆_p = K,
   Fl_μ ⊗ E = ℙ^1_E, and a generic K-point is a coordinate transcendental over E (§3.1 Check 1).

Six findings, all P3. No statement of the README was refuted on the instances computed below; no
supplier citation, pinned declaration or source locator failed to resolve. `Suggested.lean` has no
declaration, so there is no signature to elaborate (`#check` comparison: nothing to compare, nothing
changed).

Dependency check (run on `packages/PadicHodgeTheoryPartII/README.md` against
`merge-order/ORDER.txt`):

```
depcheck: 246 roadmaps, 2253 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap (position 192 in the merge order, after
HeckeStacksAndLocalShtukas at 191).

## The adversarial pass: record

`Suggested.lean`: 0 declarations (module docstring and an empty namespace); nothing to tabulate.
README targets (25 numbered sections plus the Conventions):

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Q_p(1), signs | 𝔾_m, b = p^m, μ = z^h | t_N = m, t_H = h; Q_p(1): φ = p⁻¹σ, jump −1, t_N = t_H = −1; agrees with PadicHodgeTheory Conventions (jump −h for weight h) | sound | none |
| Conventions: GLX vs Berkeley orientation | HS2.15 `[b] ∈ B(G,μ_HS⁻¹)`, HS2.12 `κ(b) = −μ_HS♯` | with μ_HS = μ⁻¹: `[b] ∈ B(G,μ)`, κ(b) = μ♯ | sound | R05 (name only) |
| Conventions: decency, quasisplit s | conjugation by g ∈ `G(Q_{p^s})` | (gbσ(g)⁻¹σ)^s = g(sν_b)(p)g⁻¹σ^s since σ^s(g) = g | sound | none |
| 0.1 jump | Fil^i = K (i ≤ a); v = 0; e_1, e_1 + e_2 in the two-step example | jump a; no jump; 2 and −1 = min(2, −1) | sound | none |
| 0.2 degree sum | identity; involution (1, −1); 3-cycle (2, 0, −5) | s·d; 0; d_3 = −3, d_2 = 2; d_0 = 0 | sound | none |
| 0.3 `V^{s,k}` | 𝔾_m (a, h); b = 1 jump 1; GL_2 diag(p,1), e_1, e_2, e_1 + e_2; v = 0 | k = sa = sh; Newton 0 vs d_s = s > 0; (1,1), (0,0), not an eigenvector; excluded | sound | none |
| 0.4 ω_s | unit; slope 1/2, s = 2; φ = pσ; b = p^m | `Q_{p^s}`; φ² = p·σ² on e_1, e_2, dim 2; {φ^s x = x} = 0 by valuation; V | sound | none |
| 0.5 rank-one objects | X(d): commutation φ(a·e_i) = a·φ(e_i) at i = s−1 (σ^s(a) = a); s = 2, (1, −1); wrap p; torus control | t_N = t_H = Σd_i; lines F(e_0 + ce_1), cσ(c) = 1, t_H = −1 ≤ 0; t_N = 1 ≠ 0; e_1 + e_2 jump 0, e_2 jump 1 | sound | none |
| 0.5 Hom description | w = f(e_0) with φ^s w = p^k w | components: `p^{sλ}σ^s w_λ = p^k w_λ` forces sλ = k and σ^s w_λ = w_λ, so w ∈ `V⊗Q_{p^s}` | sound | none |
| 0.6 line criterion | 𝔾_m, b = p^m; b = 1, μ = 0, V ⊕ 1; GL_2 irreducibles only | 𝔾_m via nontrivial character; trivial group; centre | sound | none |
| 0.7 monodromy, comparison | b = 1; 𝔾_m; change of trivialization; finite-image object | H = 1; ξ = χ^{−m}, H = 𝔾_m; conjugate; π_0(H) = 1 | sound; H = H° unstated | R01 |
| 1.1 generic filtration | GL_2 std, det; nonnormal cubic torus over Q_5 (5 ≡ 2 mod 3, no ζ_3) | Fil^1_gen = 0; det jump 1; `E⊗E` = E × E(ζ_3), diagonal meets weight-1 factor in 0 | sound | none |
| 1.2 threshold formula | cubic torus; GL_2 std, det; μ = 0; the source's Gal(E/k)-indexed form | m_O = min(1,0,0) = 0; 0 and 1; 0; source form gives 1 at representative e_1 and 0 at e_2 | sound; source form ill-defined | Source issues |
| 1.3 orbit bound | sizes (1,2), pairings (0,3); cubic torus; GL_2 | 0 ≤ 2; 0 ≤ 0 ≤ 1/3; 0 = 0 | sound | none |
| 1.4 Frobenius transport | quadratic and cubic unramified tori; split G | order 2 cannot see direction; cubic: e_1 ↦ e_σ | sound; Check weak | R02 |
| 1.5 Galois-average inequality | 𝔾_m; GL_2 slope 1/2, s = 2; s ↦ ms | m = m; d_2 ≤ 0 < 1 = k; both sides × m | sound | none |
| 1.6 Newton inequality | GL_2 ν = (a,b); torus | exponents sa, sb ≥ sb; equality | sound | none |
| 1.7 strict positivity | SL_2 c > 0, weight −n; GL_2 ordinary c = 0; torus | −cn < 0; 0 ≤ 0 ≤ 0 with ⟨λ,α^∨⟩ = 1; vacuous | sound | none |
| 2.1 descent | b = 1; simple block; diag(p,1) | rational lines; 0 and whole; Fe_1, Fe_2 | sound | none |
| 2.2 minimal Hodge degree | formula t_H = A·r + Σ_{i=A+1}^{B} dim(D′ ∩ Fil^i) recomputed by Abel summation; plane, line L | f_A = r, f_{B+1} = 0 gives the formula; t_H = 1 at [L], 0 elsewhere | sound | none |
| 2.3 generic admissibility | GL_2 diag(p,1) with Fil^1 = Ke_2; 𝔾_m; D^× with E_0 = Q_p | t_H = 1 > 0 = t_N; m = h; E must be `Q_{p²}`, not Q_p(√p) | sound; plan imprecise | R06 |
| 2.4 derived monodromy | GL_2 basic; torus; GL_2 ordinary | μ^◇ − ν = (1/2)α^∨, `V^{2,1}` = ∅; 1 ⊆ H°; `V^{1,0}` = Q_p^×e_2, ξ reducible | sound | none |
| 3.1 generic points | ℙ^1; torus (n = 0) | transcendental coordinate; K = FE | sound | none |
| 3.2 open-image point | torus; norm-one torus, κ ≠ 0; finite extension | automatic; B(T) = ℤ/2, no point; finite index | sound | none |
| 3.3 Zariski density | 𝔾_m, 1 + pℤ_p (p = 2: ℤ_2^×, infinite); O(2); diagonal in GL_2(ℤ_p) | 𝔾_m; SO(2); torus | sound | none |
| 3.4 central lifting | GL_2 → PGL_2 with J = GL_2, SL_2, torus; det | SL_2 ⊆ J°; hypothesis fails; kernel not central, conclusion fails | sound | R04 (locator) |
| 3.5 z-extension | GL_2 → PGL_2; G × 𝔾_m | index \|Q_p^×/Q_p^{×2}\| = 4 (p odd), 8 (p = 2); central character | sound | R03 (contract) |
| 4.1 torsor components | C = 1; C = {1, diag(1,−1)}, g = [[1,1],[0,1]] | trivial; gCg⁻¹ ∋ [[1,−2],[0,−1]] ∉ C | sound | none |
| 4.2 ambient stabilizers | Y a point; Y = T_y ⊔ G(Q_p) × Spd K; trivial ξ in GL_2 | G(Q_p); trivial stabilizers on the second summand; {1} not open in SL_2(Q_p) | sound | none |

## Verified sound

- Declarations read: 0 of 0 in `Suggested.lean` (53 lines; single `import Mathlib`, no `set_option`,
  no sorry'd data, namespace `TauCetiRoadmap.PadicHodgeTheoryPartII`). The six docstring bullets
  agree with README §§2.3, 2.4, 3.2, 3.5, 4.1, 4.2 in hypotheses and conclusions. The carriers the
  docstring names as missing are missing at the pins: no crystalline-representation predicate, no
  diamond, no σ-conjugacy set in the pinned Mathlib or Tau Ceti; Mathlib's isocrystals are
  `Mathlib/RingTheory/WittVector/Isocrystal.lean` only. `TauCeti.reductiveCommHopfAlgProperty` is at
  `TauCeti/Algebra/AlgebraicGroup/Reductive/Basic.lean`:71.
- Headlines and padding: the five headlines the README lists are not statable at the pins and the
  docstring says so for each; nothing is stated in their place; no padding (no declaration). §3.3 and
  §3.4 could be written on pinned carriers (`TauCeti.HopfIdeal.vanishingIdeal`, the point topology,
  `derivedDefiningIdeal`), but they are auxiliary general lemmas that mention no object this roadmap
  defines and the README does not list them as headlines; their absence is not raised.
- Targets read: 25 numbered sections, the Conventions and all supplier contracts; every one
  instantiated in the table above.
- Checks tested: 83 Check bullets read; every one with a computable value recomputed (values in the
  table); none false. Each of the six definitions (§§0.1–0.5, 1.1) has at least three Checks.
- Pinned declarations: 5 Mathlib and 15 Tau Ceti declarations opened at the pins; every name exists
  at the stated file and line, and the hypotheses the README attributes to them match (finitely
  generated Hopf ideal for the Chevalley statement; algebraically closed base and reduced target
  for `faithfullyFlat_derivedMap`; T1 value ring for the closed embedding; finite type for the open
  embedding of integral points).
- Sibling citations checked: 48 section or target citations in 16 roadmaps, each opened at main or
  at the open head: PadicHodgeTheory §§3.3, 3.4, 3.6, 4.4, 5.5 and its Conventions;
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.3.1, R07.3.2 (the notation
  `FilteredPhiNModule.IsWeaklyAdmissible` is fixed there, which settles the one lead of the citation
  resolver); PadicLocalLanglandsForGL2Qp §0.2; VectorBundlesAndIsocrystals Layer 1 (the four quoted
  titles exist verbatim); MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; BunGAndNewtonStrata §§1.7, 1.8,
  1.9, 1.12, 1.23, 1.43; HeckeStacksAndLocalShtukas §§HS2.11, HS2.12, HS2.13, HS2.15, HS2.16;
  ReductiveGroupsPartII §§RG2.0.2, RG2.0.4 (`transcendenceDegree_infinite`), RG2.1.5;
  ArithmeticGaloisRepresentations §§1.1, 7.6; ShimuraData §3.8 (`parabolicTypeVariety`);
  AutomorphicBundles §0.4 (`associatedCoefficient`); AlgebraicModuliForArithmeticGeometry §1.7
  (`rankLocus`); SchemeAndStackFoundations §0.8 (`etale_coordinates`); ReductiveGroups Layers 1, 2,
  3, 6, 7, 10 (10B); DiamondsAndVStacks §§D0.6, D3.10, D5.3, D5.16, D6.5; DeligneWeightsAndPurity
  §2.2. One hypothesis mismatch (R03), one notation mismatch (R05).
- Merge order: every roadmap supplier is on main or earlier than position 192; none is on the
  never-cite list; the dependency check reports 0 problems.
- Declared gaps: `gap:quasisplit-highest-weights` and `gap:serre-sen-openness` have the same slug
  and the same `needs` sentence in `design/plan.json` and in the README, a named supplier each, and
  ask for nothing the supplier states today (PadicHodgeTheory §4.4 has the Sen operator and its
  vanishing for finite K/Q_p, not openness in the Zariski closure; ReductiveGroups 10B is for split
  groups). The `needs` of the first agrees with the hypotheses of Serre79 line 43–45 and line 125.
- Ownership: searched by object at main and the open heads for GLX26 Theorem 5.8, Proposition 5.9,
  Lemma 6.12, Chen14 Théorème 5.0.6, generic filtrations, Hodge–Newton irreducibility, crystalline
  Mumford–Tate groups and Zariski density of open subgroups. No second owner of a target of this
  roadmap. AdmissiblePairsAndPadicHodgeStructures (later in the merge order) has Mumford–Tate groups
  and Hodge-generic points of p-adic Hodge structures in a different sense and cites neither result;
  HeckeStacksAndLocalShtukasPartII concerns dimensions of affine Deligne–Lusztig loci.
  DeligneWeightsAndPurity §2.2 is the Sp(V) case of §3.3, as the README says.
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/PadicHodgeTheoryPartII/`; no
  pull-request number, process narrative, `lemma`, `set_option` or algorithm in the README or the
  Lean file; every numbered section has a locator.
- Locators verified: 41. GLX26: Definition 2.1 and (2.6)–(2.7) (line 594–610, p. 15); §5.1 ¶13–15,
  (5.1)–(5.5), Definition 5.1, Theorem 5.2 (line 1275–1322, pp. 32–33); Definitions 5.3, 5.5, ¶17,
  (5.9), Propositions 5.4, 5.6 (line 1340–1458, pp. 33–35); ¶18 (line 1459–1490, p. 35);
  Proposition 5.7 (line 1501–1585, pp. 36–37); Theorem 5.8 and (5.23)–(5.38) (line 1591–1711,
  pp. 37–40); Proposition 5.9, Lemma 5.10 (line 1712–1736, p. 40); Proposition 5.11 (p. 41);
  Proposition 6.6(1) (line 1920–1947, pp. 45–46); Proposition 6.7 (line 1970–1998, pp. 46–47); Lemma
  6.12 (line 2142–2176, pp. 50–51). Chen14: §3.1 (line 781–820, pp. 739–740); Proposition 3.2.1
  (line 855–858, p. 740, proof p. 741); Proposition 3.2.3 (line 892–911, pp. 741–742); Définition
  3.3.1, Lemme 3.3.2, Proposition 3.3.3 (line 928–952, pp. 742–743); Proposition 3.3.4 (line
  965–1003, pp. 743–744); Lemme 3.3.5 (line 1006–1027, p. 744); Proposition 3.3.6 (line 1029–1066,
  pp. 744–745); Lemme 4.2.2 (line 1133, p. 747); Théorème 5.0.6 and proof (line 1303–1362,
  pp. 750–751). Serre79: §1.1 hypotheses (line 43–45, p. 156), §1.3 and Théorème 1 (line 97–128,
  pp. 157–158). MilneiAG: 8.20, 8.21 (line 5283–5306, p. 131). Stacks: 01UA (line 2128), 02GL (line
  3577), 03WT (line 3611), 054L (line 3743), with the lemma numbers the README gives.
- Wording and arrangement: nine README passages set beside their sources (§0.5 with Chen14 line
  1006–1066; §1.1 proof with GLX26 line 1443–1458; the gap sentence at README:109 with GLX26 line
  1464–1490; §1.2 with GLX26 line 1501–1585; §1.7 with GLX26 line 1703–1711; §2.2 with Chen14 line
  1345–1361; §3.1 with GLX26 line 1727–1736; §3.3 with Serre79 line 111–124; §4.1 with GLX26 line
  2157–2176) and the six docstring bullets of `Suggested.lean` with GLX26 line 1591–1594, 1712–1717,
  2142. No sentence shares more than a formula or a standard name with its source; no table, figure
  or list is taken over. Arrangement against GLX26 (contents: 5.1, 5.2, 5.3, 6.2, 6.5): Layer 0
  draws on GLX §5.1 and Chen §3; Layer 1 on GLX §5.2 and on steps (5.23)–(5.38) of the proof in
  §5.3; Layer 2 on Theorem 5.8 in §5.3; Layer 3 on the end of §5.3, on §6.2 and on two statements
  (§§3.3, 3.4) that GLX does not contain; Layer 4 on one lemma of §6. The layers do not map one to
  one with equal scope onto GLX's sections, and their order is forced by the `*Needs:*` lines
  (§1.1 ← §0.1; §2.4 ← §§0.6, 0.7, 1.5–1.7; §3.2 ← §§2.3, 2.4, 3.1; §4.2 ← §§3.2, 4.1).

Source independence: 15 passages compared with 3 sources (GLX26, Chen14, Serre79), none shared;
largest share GLX26, 40 of 72 locators; contents compared with GLX26: independent.

## Not verifiable

- Elaboration of `Suggested.lean`: no Lean command is permitted in this pass; the file has no
  declaration, so only the import line and the namespace would be checked.
- The published version of GLX26 (Inventiones mathematicae, DOI in the References): not read; the
  README's locators are to arXiv v3, which is what was checked. Whether the published numbering
  agrees with v3 is not checked.
- BunGAndNewtonStrata §1.8 (Newton and Kottwitz invariants) and DiamondsAndVStacks §§D0.6, D5.3,
  D6.5: headings confirmed, bodies not compared sentence by sentence with the uses in §4.1.
- The 240 open pull requests of the brief's list were searched through the grep tool by object and
  by source locator, not read in full.

## Source issues

- **Error** in GLX26 at Proposition 5.7, formula (5.18), arXiv v3 p. 36: the source says the threshold is tested on the inertia-type orbits of τ(λ) for τ in Gal(E/K) at a chosen λ; it should be tested on every Γ_E-orbit inside the Γ_K-orbit, which for nonnormal E the τ do not reach; affects a stated result.
- **Error** in GLX26 at equation (5.29), proof of Theorem 5.8, arXiv v3 p. 38: the source says the isotypic component is the sum over Gal(E/K) of the refined components; it should be the sum over the distinct Γ_E-orbits in the orbit, each once (the trivial weight with E/K quadratic gives 2v); affects the proof.
- **Gap** in GLX26 at Proposition 6.7, crystalline step, arXiv v3 p. 47: the source says openness transfers because the Galois image lies in the derived group of the z-extension; it should compare the intersections with the derived groups, the image having a central part; affects the proof.
- **Misprint** in GLX26 at Lemma 5.10, proof, arXiv v3 p. 40: the source says the étale chart of the flag variety is over affine space over Q_p; it should be affine space over the field of definition of the flag variety; affects nothing.
- **Misprint** in Chen14 at Lemme 3.3.5, p. 744: the source says the underlying module is a sum of lines over the degree-s unramified field; it should be a sum of lines over K_0, on which that field acts through the embeddings; affects nothing.
- **Error** in Chen14 at Proposition 3.3.4(2) and Proposition 3.3.6(2), pp. 743 and 745: the source says every representation embeds in one mixed tensor power of a faithful one; it should allow direct sums or subquotients (for 𝔾_m with b = 1, μ = 0 the formula gives 𝔾_m, not 1); affects a stated result.

## For the human reviewers

- **Scope.** None observed: the headline theorems are GLX26 Theorem 5.8 and Proposition 5.9 (published, Inventiones 2026 per the README) and Chen14 Théorème 5.0.6 (Annales ENS 2014).
- **Licence.** None observed: all five sources are recorded `certified`, `open-repository` in `packages/PadicHodgeTheoryPartII/sources.toml`; `Suggested.lean` has no declaration to compare with a public formalisation.
- **Not tested.** The published text of GLX26 was not read; wording and arrangement were compared with arXiv v3 only (`packages/PadicHodgeTheoryPartII/README.md:516`).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "dc03a56398ac5405507775ea9100999abe223687", "job": "RT-PadicHodgeTheoryPartII~1b", "model": "fable", "worker": "chris-x79"} -->

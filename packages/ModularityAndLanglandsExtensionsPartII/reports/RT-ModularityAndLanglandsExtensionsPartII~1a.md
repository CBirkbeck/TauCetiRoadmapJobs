<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6907748061 -->
Red team round 1 pass a (claude) of 6697677

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §4.9: the Kazhdan–Lusztig classification rests on a construction that no layer, supplier or gap provides

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:1854-1858` (proof sketch of
   §4.9) and `:1905-1906` (its `*Needs:*`): "Kazhdan–Lusztig realise `H_B` in the equivariant `K`-theory
   of the Steinberg variety of `G^∨` and classify simple modules by standard modules in the homology of
   fixed-point varieties".

   **Claim.** §4.9 is a target this roadmap owns ("for every split adjoint group", README:99-103). Its
   route uses (a) the `G^∨ × ℂ^×`-equivariant `K`-theory of the Steinberg variety with its convolution
   and its identification with the affine Hecke algebra, (b) the standard modules
   `Hom_{A(s,u)}(ρ, H_*(ℬ_u^s))` with the criterion for which `ρ` occur, and (c) the existence of an
   `s`-adapted Jacobson–Morozov homomorphism. Its `*Needs:*` line lists only
   SmoothRepresentationsOfLocalGroups SR.1.5, SR.3.3, SR.3.4 and ReductiveGroupsPartII §RG2.4.2. The
   only other reference is kl87 Theorem 7.12 and §8, an uncertified citation; a citation is not a
   supplier.

   **Witness.** `roadmaps grep` for the equivariant `K`-theory of the Steinberg variety finds no owner
   on main or at any open head. SpringerResolutionAndCharacteristicCycles (earlier in the merge order)
   stops at §6.4 "The reduced Steinberg variety". SmoothRepresentationsOfLocalGroupsPartII README:141
   declares the same input as a contract on that roadmap.

   **Repair.** In `## Exact supplier contracts` add a subsection
   `### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles and LieHighestWeightPartII` with:

   > SpringerResolutionAndCharacteristicCycles §§6.2, 6.4 (the Springer resolution and the reduced
   > Steinberg variety). LieHighestWeightPartII N2.1 (the `SL_2`-homomorphism of a Jacobson–Morozov
   > triple and the conjugacy of triples with fixed nilpositive element).
   >
   > What SpringerResolutionAndCharacteristicCycles must provide (gap:steinberg-equivariant-k-theory):
   > in Layer 6, for a complex connected reductive group `G^∨` with simply connected derived group: the
   > convolution algebra `K^{G^∨ × ℂ^×}(Z)` of the Steinberg variety `Z` of §6.4, its isomorphism with
   > the affine Hecke algebra with parameter `q` the coordinate of `ℂ^×`, the
   > standard modules `Hom_{A(s,u)}(ρ, H_*(ℬ_u^s, ℂ))` obtained by localisation at a semisimple pair
   > `(s, q)`, and the theorem that for `q` not a root of unity the simple modules are their unique
   > simple quotients, indexed by the triples `(s, u, ρ)` with `ρ` occurring in `H_*(ℬ_u^s)` (kl87
   > Theorem 7.12).

   Add the same slug to the `gaps` list of `design/plan.json` (supplier
   `SpringerResolutionAndCharacteristicCycles`, section `Layer 6`). In §4.9 replace the sentence quoted
   above by "The realisation of `H_B` in the equivariant `K`-theory of the Steinberg variety and the
   classification of its simple modules by standard modules are supplied by
   SpringerResolutionAndCharacteristicCycles (gap:steinberg-equivariant-k-theory); the adapted
   homomorphism `φ` exists by LieHighestWeightPartII N2.1 applied in the centraliser of `s₀`", and
   append to the `*Needs:*` line "SpringerResolutionAndCharacteristicCycles §§6.2, 6.4
   (gap:steinberg-equivariant-k-theory); LieHighestWeightPartII N2.1". Add both to the Layer 4
   `### Dependencies`. Tested on the refuting instance: for `PGL_2` the contract supplies exactly the
   two triples of the first Check of §4.9 (`(s, 1, triv)` and the Steinberg triple).

2. **F02** (P2) gap:geometric-weak-primitive-auxiliary-finiteness asks for the removal of a hypothesis that holds in its only application

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:308` (the contract) and
   `:4089-4092` (§11.6): "The additional no-`l`-power-quotient hypothesis on its cyclotomic restricted
   image is not assumed here: its removal for both applications is precisely
   gap:geometric-weak-primitive-auxiliary-finiteness."

   **Claim.** PotentialAutomorphyInfrastructurePartII §8.16 would have to be re-proved without its added
   hypothesis "`ρ̄(G_{F(ζ_l)})` has no nontrivial quotient of `l`-power order", and extended to "two
   deformation problems".

   **Witness.** In §11.6, `ρ̄ = s̄|_{G_{K_2}}` and `K_2` is `X_0`-split, so
   `r̄(G_{K_2(ζ_p)}) = r̄(G_{F(ζ_p)}) ⊇ SL_2(𝔽_{p^a})` (a perfect subgroup survives an abelian quotient).
   With `H = (r̄ × ȳ)(G_{K_2(ζ_p)})`: `[H, H] = SL_2(𝔽_{p^b}) × 1` is perfect and `H/[H, H]` embeds in
   `k^× GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b}) × k^×`, of order prime to `p`; so `H`, and its quotient
   `s̄(G_{K_2(ζ_p)})`, has no quotient of `p`-power order. This is the README's own argument at
   README:4957-4974 (§13.8). Both applications (nt26 lines 961 and 976) are §8.16 as stated: the problem
   with Steinberg conditions at `T_{F_2} ∪ {v_2}` is a quotient of the §8.16 ring with `v_0 = v_2`, and
   the second application has `v_0 ∈ T_{F_2}`.

   **Repair.** In §11.6 replace the two sentences quoted above by:

   > The added hypothesis of §8.16 holds: `K_2` is `X_0`-split, so `r̄(G_{K_2(ζ_p)})` contains a conjugate
   > of `SL_2(𝔽_{p^a})`, and by the computation of the last Check of §13.8 the image of `s̄` on
   > `G_{K_2(ζ_p)}` has no nontrivial quotient of `p`-power order. §8.16 is applied twice as stated: with
   > its Steinberg place `v_2` (the ring with Steinberg conditions at `T_{F_2} ∪ {v_2}` is a quotient of
   > that ring), and with its Steinberg place in `T_{F_2}` and the unrestricted condition at `v_2`.

   Add a Check to §11.6: "`p = 7`, image `{g ∈ GL_2(𝔽_{7^a}) : det g = ±1}`: the quotient by
   `SL_2(𝔽_{7^a})` is `{±1}`, of order prime to `7`." Then delete the contract paragraph at README:308,
   the phrase "in the geometric weak-primitive form of the supplier contracts" at README:4100-4101, the
   slug at README:4123, and the `gaps` entry of `design/plan.json`. If
   the repair worker finds a residue that §8.16 does not cover, the `needs` sentence must name it
   exactly; "this hypothesis removal and two-application extension" does not.

3. **F03** (P2) §11.6: the automorphy lifting theorem that turns the Khare–Wintenberger lifts into automorphic representations is missing from the route

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4101-4105`: "the
   Khare–Wintenberger lifting argument and Thorne's level raising (§6.9) produce an ordinary automorphic
   lift `Π′` with the prescribed types … and extract `Π`"; `*Needs:*` at `:4120-4123`.

   **Claim.** Finiteness of the deformation ring and §6.9 give `Π′` and `Π`.

   **Witness.** Finiteness gives a characteristic-zero lift, not its automorphy. nt26 line 966 applies th24 Theorem 7.5 (th24 line 1965) for this, and line 978 repeats the method for `Π`.
   That theorem is this roadmap's own
   gap:auxiliary-place-reducible-lifting, cited in §13.8 only. ModularityAndLanglandsExtensions §4.2
   does not replace it: its cyclotomic clause can fail over `K_2` (README:4945-4956).

   **Repair.** Replace README:4099-4105 from "Apply residually reducible finiteness" to the end of the
   sketch by:

   > §6.9, applied to the isobaric sum of these two lifts, gives a cuspidal ι-ordinary `Π_2` with
   > residual representation `s̄|_{G_{K_2}}`, Steinberg above `v_2`. With `Π_2` as automorphic input, §8.16
   > (Steinberg place `v_2`) makes the ring with Steinberg conditions at `T_{F_2} ∪ {v_2}` finite over
   > `Λ_{F_2}`; the Khare–Wintenberger argument gives a characteristic-zero point of it, and the
   > auxiliary-place lifting theorem (gap:auxiliary-place-reducible-lifting, with the auxiliary place
   > above `v_a` and the cyclotomic hypothesis verified above) makes it `r_{Π′_2,ι}` for an ι-ordinary
   > RACSDC `Π′_2`, Steinberg at `T_{F_2} ∪ {v_2}`. With `Π′_2` as input, §8.16 (Steinberg place in
   > `T_{F_2}`, unrestricted at `v_2`) makes `R_{𝒮′_{F_2}}` finite; a second Khare–Wintenberger point and
   > the same lifting theorem give `Π`.

   Append to the `*Needs:*` line of §11.6 "PotentialAutomorphyInfrastructurePartII Layer 5
   ("Characteristic-zero lifts from finiteness and the dimension bound"), Layer 8
   (gap:auxiliary-place-reducible-lifting)". Tested on the instance: with `p = 7` and the image of the
   Check at README:4945 the §4.2 clause fails and the gap's hypotheses hold (R02).

4. **F04** (P2) Layers 9–13 map one to one, in order and in scope, onto the sections of nt21b and nt26, and Layers 9 and 12 state one patching argument twice

   **Location.** Layer introductions at `packages/ModularityAndLanglandsExtensionsPartII/README.md:3245`,
   `:3580`, `:3846`, `:4262`, `:4616` (each opens with the source section it reproduces, e.g.
   "Newton–Thorne II §2 (nt21b pp. 5–19) proves …"), and §§12.3, 12.4, 12.6, 12.7, whose sketches begin
   "As §9.3", "As §9.4", "As §§9.5–9.6", "as in §9.7".

   **Claim.** The organisation is the roadmap's own.

   **Witness.** Pairs, by number: Layer 9 ↔ nt21b §2; Layer 10 ↔ nt21b §3; Layer 11 ↔ nt26 §3; Layer 12
   ↔ nt26 §4; Layer 13 ↔ nt26 §§5–6 (contents at nt21b lines 13-15, nt26 lines 13-18). Inside each the
   targets follow the source's numbered statements in order (10.1–10.8 ↔ Definition 3.2 to Theorem 3.1;
   11.1–11.10 ↔ Lemma 3.1 to Theorem 3.2). The dependency lines §10.6 → §9.8, §13.3 → §11.10 and
   §13.4 → §12.7 force the order 9 < 10 and 11, 12 < 13; they do not force these scopes.

   **Repair.** Reorganise by what the endpoints need, not by article:

   1. Merge Layers 9 and 12 into one layer, "Functoriality lifting by simultaneous patching against a
      pseudodeformation ring", stated once for a rank-two deformation problem and a conjugate self-dual
      rank-`m` determinant obtained from it by a fixed algebraic construction: torsion-semistable
      Artinian points and the map `P → R` (now §§9.2, 12.2); Taylor–Wiles data with the ordered residual
      characters of the construction and the rings `P_Q` (§§9.3, 12.3); unitary modules at the ordered
      diagonal level (§12.4; the single-character level of §9.4 is its quotient, as README:4433-4435
      already says); patching for odd `p` and for `p = 2` (§§9.5, 9.6, 12.6); transfer of automorphy at a
      regular point (§9.7). Then two applications as separate targets: `Sym^{n−1}` (§9.8) and the tensor
      with a fixed factor (§§12.5, 12.7).
   2. Merge Layers 8 and 10 into "Reduction to level one: `n`-regular congruences and supercuspidal
      primes" (both are relative to the same seed and §10.7 is built on §§8.2–8.3).
   3. Keep Layer 11 and Layer 13, and open every layer with the mathematics it supplies; move the
      source sections to the locators of the targets.
   4. Cite, for the main results of these layers, further sources beside nt21b and nt26: th24
      Theorem 7.1 (th24 line 1864, p. 42) and Theorem 7.6 (line 2002, p. 45) for the induction step with
      `TP_r`; ct17 Theorem 6.2 (p. 45) for the first cases beyond rank five by the same residual
      decomposition; kw09 Proposition 9.3 for the dyadic torus patching.

   Old-to-new numbering must be recorded in the README, since ModularityAndLanglandsExtensions and the
   gaps cite §§9.8, 12.7, 13.6, 13.10.

5. **F05** (P3) §14.1(1): ordinarity of the level-raised form is asserted without its hypotheses

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:5069-5075`: "raise the level
   of the base change of `σ_0` to `F⁺_1` at `v` to an unramified Steinberg twist, congruent modulo `p`
   and of the same weight … obtaining a non-CM ordinary `σ`".

   **Claim.** The form produced by SerreWeightAndLevelOptimisation §6.9 is ι-ordinary.

   **Witness.** §6.9 there gives a form of level `GL_2(𝒪_v)` at `v | p` and nothing on ordinarity. nt21
   line 4227-4229 obtains it over `ℚ` from `p > 8k` and local residual reducibility; over `F⁺_1` that
   argument needs `p` unramified in `F⁺_1`, which the sketch does not impose.

   **Repair.** In the sketch, after "(PotentialAutomorphyInfrastructure §2.5)" insert "in which `p` is
   unramified", and replace "obtaining a non-CM ordinary `σ`" by:

   > obtaining `σ`, non-CM because it is Steinberg at `v`, with the central character of the base change
   > of `σ_0`. It is crystalline at each `w | p` with labelled Hodge–Tate weights `{0, 4}`, `F⁺_{1,w}` is
   > unramified and `p > 5`, and `r̄_{σ_0,ι}|_{G_{ℚ_p}} = ψ̄ ⊕ ψ̄^c` is reducible; a non-ordinary crystalline
   > lift in the Fontaine–Laffaille range has irreducible reduction
   > (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11), so `σ` is ι-ordinary.

   Add "FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.5.11" to the `*Needs:*` line of §14.1. Checked
   on the instance `n = 3`, `p = 577`: `577 > 5`, `577 ≡ 1 mod 4` splits in `ℚ(i)`, so the local residual
   representation is the sum of two characters.

Read in full: `packages/ModularityAndLanglandsExtensionsPartII/README.md` (5358 lines, 110 numbered
targets in Layers 0–14) and `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` (127
lines, 4 declarations and 1 proved `example`). Five findings: one P1, three P2, one P3.

## Verified sound

Counts: 4 declarations and 1 `example` read; 110 README targets read; 131 statement-and-page locators
compared with the cached texts (nt21 50, nt21b 17, nt26 28, th24 7, ct17 26, at20 1, con99 1, bk05 1),
all inside the README's stated pages; about 120 numerical Checks recomputed; 68 quoted supplier
section titles resolved at the suppliers' heads, with the section numbers of
PotentialAutomorphyInfrastructurePartII (about 45), ModularityAndLanglandsExtensions (about 25) and
SerreWeightAndLevelOptimisation (4); 16 pinned library declarations opened at the pins.

**Suggested.lean.** Compared with `scratch/signatures.md` (no Lean was run, as the brief allows none);
no section variables exist, so no binder can be lost; nothing changed.

| Declaration | Context | Instances and computed values | Result |
|---|---|---|---|
| `symPowerEulerFactor` | no variables | `n = 0`: `1 − x`. `n = 1`: `(1 − βx)(1 − αx)`. `Δ`, `p = 2`, `n = 2`: `α² + αβ + β² = 576 − 2048 = −1472`, as README §14.4 | real body, agrees |
| `example` (symmetry) | none | `j ↦ n − j` on `range (n+1)`; tests the kept definition; README:5158 names it | kept, not padding |
| `HasQuadraticSelfTwist` | `{N} [NeZero N] {k}` | `M = 0` excluded by `0 < M` (`Coprime p 0 ↔ p = 1`); `M = 1, 2`: only `ψ = 1`; level 32, `ψ = χ₋₄`: `0·(−1) = 0`, `(−2)·1 = −2` holds; `Δ`, `p = 3`: `−252 ≠ 252` | agrees with README §14.5 |
| `symPowerEulerProduct_levelOne_entire` | `Newform 1 k` | `n = 0` would be `ζ(s)` (excluded by `hn`); `n = 1`: abscissa `(k+1)/2`, the pinned `LSeries_eulerProduct_hasProd_satakeParameters`; factors non-zero since `|α^jβ^{n−j}p^{−s}| = p^{n(k−1)/2 − Re s} < 1` | true as typed |
| `symPowerEulerProduct_entire_of_not_hasQuadraticSelfTwist` | `[NeZero N]`, `2 ≤ k` | CM level 32, `n = 4`: pole of `ζ(s − 2)` at `s = 3 = n(k−1)/2 + 1` (hypothesis needed); `n = 2` CM still entire; weight one icosahedral: pole (needs `2 ≤ k`); omitted factors at `p ∣ N` are reciprocals of polynomials | true as typed |

Headline theorems: the two holomorphy statements are stated; every other headline (README §§2.4, 3.8,
5.4, 5.10, 6.4, 6.7–6.9, 7.5–7.7, 8.3, 9.8, 10.8, 11.10, 12.7, 13.5, 13.6, 13.10, 14.1–14.3) needs
automorphic representations, Galois representations or eigenvarieties, absent at the pins, and is
named in the module docstring. No padding found: the level-one statement does not follow from the
general one by one tactic (it needs that level-one forms have no quadratic self-twist and weight at
least 2). No name of `Suggested.lean` occurs in another roadmap's Lean file (`roadmaps grep`).

**README targets, computed.**

| Statement | Instances tried and values | Result |
|---|---|---|
| §0.2 characters of `G_{ℚ_p}^{ab}` | `Hom(ℤ_3^× × ℤ̂, C_5) = 5`, `Hom(ℤ_3^× × ℤ_3, C_5) = 1`; pro-`p` quotient `ℤ_p²`, dimension 2 | holds |
| §0.3 extension to `𝒢_n` | conjugating `(A, μ)j` by the scalar `(α, 1)` gives `(α²A, μ)j`; square root exists since `2` is a unit | holds |
| §0.4 | `n = 2`: `1 + 0 + 4 = 5` | holds |
| §1.3 derivative matrix | indices `{0, 2}`: `[[1, 1], [0, 2]]`, determinant `2 = ∏(j − i)` | holds |
| §2.1 twin | `Δ`: `v_2(−24) = 3`, slopes `3 + 8 = 11`; `v_p(ζ − 1) ≤ 1 < v_p((1+q)^{k−2} − 1)` for `p = 2`, `ζ = −1`: `1 < 2` | holds |
| §2.2 | `t ↦ t^p` on the open disc, `p` preimages; `⟨2⟩ mod 3`: `2^a ≡ (−1)^a` | holds |
| §2.5 `Sym^6` criterion | `S_4`: degrees `≤ 3 < 7`; `A_5`: degrees `≤ 5 < 7`; `Q_8`: `g² = ±1`, discriminant `0` although irreducible | holds, reducibility clause needed |
| §3.2 boundary weights | `k = 3`: `w = 4`; `k = 4`: `w = 24`, `v = 3`; `k = 6`: `624 = 2⁴·39`; `m = 1`, `k = 2`: `w = −2` | holds, both directions |
| §3.3 | weight 5: `i + i′ = 4/2 = 2`; weight 3: `1`, impossible | holds |
| §3.4 | `2` has order 4 mod 5 and order 3 mod 7; `2³ ≡ 3`, `2⁵ ≡ 2 (mod 5)`; `2³ ≡ 1`, `2⁵ ≡ 4`, `2⁷ ≡ 2 (mod 7)`; `X² − X + 3 = (X − 2)(X − 4)` mod 5 | holds |
| §3.5(2) | Steinberg twist in weight `k > 2`: slope `(k−2)/2 ≠ 0`, irreducible; `k = 2` is ordinary and excluded | holds |
| §3.7 ping-pong | `i = 1`: `m_π = 2`, `k′ = 9`, `2 < 7/2`, twin on `X_3`, slope `6 = 3·2`; general `i′ = (k′−1)/2 − i = 2^m − 1` | holds |
| §4.1 | `Φ_2^t = −Φ_2 = Φ_2^{−1}`; `|𝔽₉^×/𝔽₃^×| = 4` | holds |
| §4.3 signs | `St_2(χ) ⊞ 1`, `n = 3`: `χ(ϖ) = −1` on `F⁺`, conjugate symplectic, times `sp(2)` gives sign `+1 = (−1)^{n−1}` | holds |
| §4.4 | `|C| = q³ + 1`; `q = 3`: `28`, `dim τ = 6`, `dim λ = 4·8 = 32`; `−1 + q(q−1) + q³ = (q+1)(q²−1)` | holds |
| §4.8 | `[K : B]` for `q = 3`: `4·40·364 = 58240`; `det(−1_{2k+1}) = −1` | holds |
| §4.9 | `PGL_2`, `s = diag(i, −i)`: `zs = −s` is `W`-conjugate, pullback splits `2 = 1 + 1`; real positive `s` never | holds; see R01 for the route |
| §4.10 | `n = 7`: `2 + 2 + 4 = 8 = 1 + 7`; `n = 9`: `6 + 4 + 4 = 14 = 1 + 11 + 2`; `k = 5`: `1 + 16 + 5 = 22 = 2·3 + 2 + 14`; `L_4 = [1,0,2,1] + [1,2,0,1]` | holds |
| §4.12 | `jY − jX + jZ`, `m = 5`: `4[2,1,1,0] + 2[2,1,0,1] + 2[1,2,1,0] + 2[1,2,0,1] + 2[1,0,2,1]`, twice the six shuffles; `11 − 1 + 2 = 12` | holds |
| §5.6 | `l > 5`: `4^{s+1}/2` and `4^{s+1}`; `l = 5`: `2^s` and `2^{s+1}` | holds |
| §5.10 | ranks `a + 3b`, `P`-fixed `a + b`: `2(a + b) ≤ a + 3b ⇔ a ≤ b`; `a = 2, b = 1`: `6 > 5` | holds |
| §7.1 | `(2 + i)⁴ + (2 − i)⁴ = −14`; `(1 + i)⁴ = −4`; `a_4 = 16`, `a_8 = −64` | holds |
| §7.2 | `χ_iχ_i^c = ε^{3(n−1) − 4(n−1)} = ε^{1−n}`; `(p − 1)/8 ≥ 6·n! > 2n(n − 1)`; `577 = 2·288 + 1` prime | holds |
| §7.4 defect | with `r = r_τ ω_1 ω_0^{2k}`: `r^c = r_τω_1ε^{6k}ω_0^{−2k}`, `r^∨ε^{−2k} = r_τω_1ε^{6k}δω_0^{−2k}`; they differ by `δ_{K/ℚ}`, and `r_τ ⊗ δ ≇ r_τ` since `τ` is Steinberg at `q_1`. Control: the rank `n − 2` block gives `ε^{5−n}` on both sides | the README's claim about nt21 is correct |
| §7.3 | Diamond: `0 ≡ −q³(q + 1)²` iff `q ≡ −1 (mod p)` | holds |
| §8.2 | `(n − 1)(k − 1) ≤ (n − 1)k − 1 ≤ p − 2`; `n = 3`, `k = 2`: `p ≥ 11` | holds |
| §9.3 | `n = 2m`: exponent at `i = m` is `1`; `n = 2`: `χ_2|_I = χ_1^{−1}|_I` | holds |
| §10.3 | `8·3·2 = 48`, `t = 53`; `q + 1 = 4·53`, `q = 211` prime | holds |
| §10.5 | `t = n = 13`: trace of `I_{13}` is `0`; `8·13·12 = 1248` | holds |
| §11.3 | `s^∨ = (r_π ⊗ Sym)·ε^{2r−1}ω_p^{1−r}y^{r−1}`, `s^c = (r_π ⊗ Sym)·ω_p^{1−r}y^{r−1}`: ratio `ε^{1−2r}` | holds |
| §11.6 Check | `q = 3`, `Φ = diag(1, 2)` over `𝔽_7`: `3, 3, 6, 12 ≡ 5` | holds |
| §12.4 | `r = 1`, `(α, β, γ) = (2, 3, 5)`: `η = (10, 15)`, `η_1η_2 = 150 = αβγ²` | holds |
| §12.6 | `dim W′_∞ − dim W_∞ = (n − 1)q`; `γ = 2 − 3 + 3 = 2` | holds |
| §13.4 | `r = 4`, `q = 17`, `x = 2`: forbidden set `{1,2,4,8,9,13,15,16}`; `y = 3`: `7, 6, 10, 11, 14, 12, 3, 5` distinct; `q = 43`, slots exchanged: `y³ = y^{−3}` | holds |
| §13.8 | `7^a ≡ 3 (mod 4)` for odd `a`, scalars `±1` only, `ε̄` trivial on `ker ad r̄`; eigenvalues `−(α/β)^j`, `j = 0` gives `−1 ≠ 1` | holds |
| §13.9 | `p = 5,…,23`, `r ≤ 3`: `6 = 5+1`, `7 = 5+2`, `8 = 5+3`, `9 = 7+2`, `10 = 7+3`, `11` impossible, even `12…26` reached; `13 = 11 + 2` is reached as well, which the source does not list | statement true |
| §13.10 Bertrand | `m = ⌊n/2⌋`: `m < p ≤ 2m ≤ n`, `p ≠ n` for even `n > 2`; `n = 11`: only `7`; `n ≥ 6` gives `p ≥ 5`; indices `r, r ± 1, p − r < n` | holds |
| §14.1(1) | `Sym^{n−1}(sp(2) ⊗ χ) = sp(n) ⊗ χ^{n−1}`; over `F_1 ⊇ K`, `δ_{K/ℚ}` is trivial, so the twist by `ω^{n−1}` is conjugate self-dual (contrast §7.4) | holds; see R05 |
| §14.5 | as in the Lean table | holds |

**Suppliers and direction.** Output of the dependency check: `depcheck: 248 roadmaps, 2354 edges,
0 problem(s)`; no UPWARD or CYCLE line. All 14 gap slugs occur once in `design/plan.json` and in the
README contracts. Layer 13 uses Layers 6, 11, 12 (and 9 through 12) only, so §14.1 does not make
Layers 7–10 circular. The former §8.17 of PotentialAutomorphyInfrastructurePartII is mapped by that
roadmap's own table to ModularityAndLanglandsExtensions §4.2, so the alias cited in §7.3 is valid.
ModularityAndLanglandsExtensions §§4.32, 4.37 state holomorphy for semistable elliptic curves and
for `n ≤ 8`; README §§14.4–14.5 are different statements and are not a second copy.

**Pinned declarations opened.** `Nat.multiplicity_pow_two_sub_one`, `Polynomial.discr`,
`Nat.exists_prime_lt_and_le_two_mul`, `NumberField.abs_discr_gt_two`,
`DirichletCharacter.changeLevel`, `changeLevel_injective`, `changeLevel_eq_one_iff`,
`changeLevel_eq_cast_of_dvd'`, `MulChar.map_nonunit`, `ZMod.χ₄` (Mathlib);
`HeckeRing.GL2.Newform`, `satakeParameters`, `exists_satakeParameters_eq_pair`,
`prod_map_one_sub_mul_satakeParameters`, `LSeries_eulerProduct_hasProd_satakeParameters`,
`CuspForm.hasEntireExtension_qExpansion_coeff` (Tau Ceti). All exist with the stated content.

**Policy.** The pull request changes only the package folder; no `lemma` declaration, `set_option`,
pull-request number or process narrative in the README or the Lean file; every target has a locator.

**Wording.** 14 passages set beside their sources (README §§7.1, 7.2, 7.5, 7.4, 13.8, 13.9, 11.4,
11.6, 14.2, 4.10, 4.12, 5.5, 3.1 and the docstring of the second theorem, against nt21 lines
4042-4120 and 4164-4328, th24 lines 1850-2086, nt26 lines 866-980, ct17 Theorems 2.3, 3.3 and
Lemma 3.4): no shared sentence; the only agreements are formulas and lists of hypotheses of fewer
than a dozen words.

Source independence: 14 passages compared with 4 sources, none shared; largest share nt21, 83 of about 250
locators; contents compared with nt21: not one to one (its §2 is split over Layers 0–2, §1 follows
§3, §5 is imported, Layers 4–7 merge it with ct17 and th24); contents of nt21b and nt26 compared as
well: Layers 9–13 follow their sections one to one (R04).

## Not verifiable

- kl87, bbm82, kw09: uncertified, cited by locator only; kl87 Theorem 7.12 and §8, kw09 Proposition 9.3
  and bbm82 Théorème 3.1.1 were not read.
- §4.11: the corrected `(10, 10)` entry `−1/(1 + q)` of the rank-nine matrix of `T_{s_2}` and the
  claim that the printed block fails the quadratic relation: the matrices of ct17 pp. 14–16 are not
  legible enough in the extraction to recompute.
- §4.12: the socle multiplicity after ct17 (3.9) and the `ε_1` signs: they depend on Mœglin's
  hereditary Jacquet formula, which the gap assigns to the supplier.
- §6.9 against th24 §§3–6 (pp. 16–41): hypotheses (1)–(5) were read against th24 Theorem 6.11 only at
  the level of the statement's page; the proof was not followed.
- The published paginations of nt21, nt21b, nt26, th24: the README cites the arXiv versions by PDF
  page, which is what was checked.
- The proved `example` and the four signatures were not elaborated in this pass.

## Source issues

- **Error** in nt21 at proof of Proposition 7.4, pp. 86–88 (arXiv v3): the source takes the rank-two block to be the base change of a form with odd nebentypus twisted by an even power of a character of conjugate norm `ε³δ_{K/ℚ}`, and applies its Theorem 4.1; it should be a conjugate self-dual block, but this one differs from its polarized dual by `δ_{K/ℚ}`, non-trivial on the field used; affects the proof.
- **Misprint** in ct17 at Theorem 3.3(i), p. 21: the source says that for `m = 3` the module `X` has exponent `[1, 0, 1]`; it should be `[1, 0, −1]`, as its own Theorem 2.3(1)(c), p. 9, states; affects nothing.
- **Gap** in th24 at proof of Lemma 7.3, p. 43: the source bounds the group above by scalars times `SL_2` of the finite field in both projective cases; it should be scalars times `GL_2` when the projective image is `PGL_2`; affects the proof.
- **Misprint** in ct17 at Lemma 3.4, p. 21: the source writes the archimedean component as a square root of `z/z̄` without a branch; it should be `z/|z|`, the branch that restricts to the sign character on real numbers; affects nothing.

## For the human reviewers

- **Scope.** SmoothRepresentationsOfLocalGroupsPartII §§7.3–7.4 at its open head still state the Kazhdan–Lusztig classification without citing README §4.9; the last repair marked this not actionable here. Two owners remain until that roadmap is edited.
- **Scope.** README:108-116 and §7.4 rest on a claimed defect in the published proof of nt21 Proposition 7.4; this pass recomputed it from arXiv v3 and agrees. The published Publ. IHÉS text was not compared.
- **Licence.** ct17, ct15, bk05 and con99 were read from authors' pages (`sources.toml`, licence class `author-page`); the README cites ct17 and ct15 by manuscript pages, not by the published pagination.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "669767713bc133cf61b22bfa68680f88d2ba2c9a", "job": "RT-ModularityAndLanglandsExtensionsPartII~1a", "model": "fable", "worker": "chris-x80"} -->

# FIX-PKG-ShimuraVarietiesPartII~14

Findings settled: the five findings of the round 13 review (REV-PKG-ShimuraVarietiesPartII~13), F01 (P2) and F02–F05 (P3). All five are correct and all five are applied. Two of the repairs (F01, F03) state facts whose inputs no supplier states. Each input is declared as a new supplier gap: gap:fixer-stable-lattices on ReductiveGroupsPartII and gap:rg3-r-smooth-central-quotient on ReductiveGroupsPartIII. The review's section for the human reviewers was not acted on.

## REV-PKG-ShimuraVarietiesPartII~13/F01 (P2) — applied

Old: §5.4 extended the Siegel map of "any Hodge embedding … with a suitable self-dual lattice". New: the triple, ι_2, a self-dual V_2,Zp with G_2^fix → stabilizer scheme of V_2,Zp, and the levels K′_2,p ⊇ K_2,p and K′_2^p are stated. Added: existence by replacement (KZ §4.3.5), a negative Check, and gap:fixer-stable-lattices.

**Verification.** KZ line 1759–1766 (§4.3.5, p.40): KZ first replaces ι_2 and applies Zarhin's trick. It then assumes a self-dual V_2,Zp such that G_2 → GSp(V_2,Qp) extends to a morphism from the Bruhat–Tits stabilizer scheme of the very special point to the stabilizer scheme of V_2,Zp. It sets K′_2,p to the Z_p-points of that stabilizer and K′_2^p ⊇ K_2^p. Proposition 4.3.6 is stated under these hypotheses. I recomputed the reviewer's witness, below.

**Edits beyond the proposed text.**
- The construction paragraph of §5.4 now says that G_2^fix maps to the stabilizer scheme and takes K′_2^p "as there".
- The first Check (GU(1,1), Z[i]²⊗Z_5) says why it satisfies the hypothesis: the lattice defines the hyperspecial point, so G_2^fix is its stabilizer scheme in G_2.
- The new negative Check is placed after the torus Check, whose form it uses.
- The existence sentence is used: §7.1 forms A through "the integral Siegel map of §5.4", and the end theorem §7.6 needs one for every strongly acceptable triple. The proof sketch gives the route. Take a lattice to which G_2^fix → GL extends, scale the form, and note that the multiplier extends to a character G_2^fix → G_m: its values on the bounded group G_2^fix(Z̆_p) are units, and G_2^fix is smooth. Then apply Zarhin's enlargement (PadicDifferentialEquationsAndRigidCohomology §RD.5.116, already in the `*Needs:*` of §5.4).
- The first step of that route has no supplier. ReductiveGroupsPartII §RG2.2.4 *toral-embedding-into-gl-building* is only G(K)-equivariant over a local field K. A morphism of stabilizer schemes needs points over Z̆_p (*extension-principle*, §RG2.3.1). *minuscule-toral-embedding* and *hodge-type-fixer-immersion* (§RG2.3.5) assume a split or tame group, while a strongly acceptable G_2 can be a Weil restriction from a wild extension.
- I therefore declared gap:fixer-stable-lattices (ReductiveGroupsPartII §RG2.3.5, new target beside *hodge-type-fixer-immersion*): for a connected reductive G over a finite extension of Q_p, a full fixer G_x and a representation V, a lattice to which ρ extends as a morphism G_x → GL(Λ).
  - The statement is true in this generality. G_x is smooth affine, so O(G_x) is free over O_F. For a lattice L_0, the set of v ∈ L_0 with Δ(v) ∈ L_0⊗O(G_x) is a subcomodule, by coassociativity in a basis of O(G_x), and it contains ϖ^n L_0.
  - The gap is listed in the `*Needs:*` of §5.4, in the Layer 5 Dependencies, under the README's ReductiveGroupsPartII contract and in the `gaps` list of `design/plan.json`.

**Pattern.** "as in §5.4" in §§5.5, 5.9 and 5.10, and "the integral Siegel map of §5.4" in §7.1, now refer to the stated hypothesis. The §5.5 lattice V_1,Zp⊕V_2,Zp is stable under G_3°(Z_p) through G_3° → G_1° = G_1^fix and G_3° → G_2° ⊂ G_2^fix. No other "suitable" or "any Hodge embedding" claim remains; grep for "suitable" finds no hit.

## REV-PKG-ShimuraVarietiesPartII~13/F02 (P3) — applied

Old: Conventions defined quasi-tame from KPZ alone. New: "Quasi-tame is the notion of ReductiveGroupsPartII §RG2.3.2 (*quasi-tame-group*) …", with the KPZ locator and the extension to groups over Q. Scope now lists quasi-tame groups under ReductiveGroupsPartII §RG2.3. The contract lists §RG2.3.2, including quasi-tameness of a Weil restriction of a quasi-tame group.

**Verification.** On main, `TauCetiRoadmap/ReductiveGroupsPartII/README.md` line 4123–4130, under heading RG2.3.2 (line 4044), states *quasi-tame-group* with the same content: K_i/K finite separable, which is automatic in characteristic 0. The same text gives quasi-tameness of a Weil restriction of a quasi-tame group. KPZ line 712–715, p.16, matches.

The `*Needs:*` of §§2.3, 2.4 and 2.5, the sections that use the word, and the Layer 2 Dependencies already list ReductiveGroupsPartII §RG2.3. The reviewer's item 3 (§2.5) therefore needed no edit. The quasi-tame Check of Conventions is kept.

## REV-PKG-ShimuraVarietiesPartII~13/F03 (P3) — applied

Old: §3.9 built an "adjoint fixer torsor". New: π is a torsor under G^fix/Z. Here G^fix is the full fixer, in the §2.5 cover, of a point lifting x_ad, and Z is the closure of Z_G. Under (E) the quotient is smooth with neutral component the adjoint parahoric; it is not asserted to be the full fixer of x_ad. API, Check 3 and locator are updated, and a Check is added.

**Verification.** KPZ line 3299–3306 (§7.1.12, p.75) defines the adjoint group scheme as the stabilizer scheme of the cover modulo the closure of its centre. It says this is not in general the Bruhat–Tits stabilizer of x_ad; under (E) it is smooth with neutral component the parahoric of x_ad. Theorem 7.2.21(3) (KPZ line 3756–3758) and Proposition 7.1.14(3) (line 3335–3337) make π a torsor under that group.

**Edits beyond the proposed text.**
- **New Check in §3.9.** At a point over the midpoint of an edge of the GL₂ tree, the full fixer is the Iwahori I: w=[[0,1],[p,0]] has det w=−p, of valuation 1, and moves the central coordinate. So G^fix/Z=I/G_m is the connected Iwahori of PGL₂. The full fixer of x_ad also contains the image of w (w²=p, a scalar) and has two components. This Check excludes the wrong model that the old words named.
- **Same pattern elsewhere.** §3.9 Check 3 and §6.2 now speak of "a torsor under G^fix/Z with disconnected special fibre". Formerly they spoke of a "disconnected full-fixer" fibre or torsor.
- **Spelling.** "nonexceptional" is unified to "non-exceptional" in §3.9 and §5.3.
- **New supplier gap.** The smoothness of G^fix/Z and the identification of its neutral component rest on KZ Proposition 2.4.13 (KZ line 778–781, p.17) and KP Lemma 4.6.2(2) (KP line 3107–3112, p.198), which KPZ §7.1.12 cites. ReductiveGroupsPartII excludes KZ Proposition 2.4.13 from its scope (its README line 91–92). I found no owner on main, at the open heads or in the board's packages; its R-smooth neighbours are already gaps on ReductiveGroupsPartIII. I declared gap:rg3-r-smooth-central-quotient (ReductiveGroupsPartIII Layer 2, new target). It is added to the `*Needs:*` of §§3.9 and 3.10, to the Layer 3 Dependencies, to the contract and to `plan.json`. §3.10 is included because its "smooth connected adjoint parahoric" is the same identification.

## REV-PKG-ShimuraVarietiesPartII~13/F04 (P3) — applied

Old: §6.3 locator "(KZ, Proposition 5.2.3 and Corollary 5.2.7, pp.49–53)". New: "…; proof of Proposition 5.3.5, p.54, for a point of the top stratum".

**Verification.** KZ line 2169 and 2322 both assume λ≠μ. The top-stratum curve, with a dense preimage of the μ-ordinary locus, is in KZ line 2411–2418, which falls on p.54 (page marker at line 2383). `sources.toml` now lists Proposition 5.3.5 in the KZ locator.

## REV-PKG-ShimuraVarietiesPartII~13/F05 (P3) — applied

Old → new.
- §0.3: "admissible p-level … expected finite level action" → the p-level of §0.1, neat levels, and "K_2^p/K_1^p acts … simply transitively on geometric fibres".
- GeometricSatakeAndFusionPartII contract: "no (NE) hypothesis" → "no non-exceptional hypothesis, the condition of §2.3".
- §5.2 defines V_3, Ψ_3 and ι_3; §5.5 refers back to them.
- §2.3: "five cover properties" → "the cover properties listed in the construction".

**Verification and additions.**
- **§0.3.** HT line 950 gives finite étale transitions; KZ line 1299–1303 gives the quotient by K^p/K_1^p.
  - The torsor claim needs freeness, so the proof sketch now argues it. At neat level the stabilizer of a point is central, and Z_G(Q) is discrete for Hodge type, so it meets a neat level trivially. The map from the source times the group to the fibre square is a map of finite étale covers that is an isomorphism on the dense generic fibre, hence an isomorphism. This is the argument §7.1 already uses.
  - The Layer 0 Example agrees: Y(9)→Y(3) has degree |1+3M₂(Z/9)|=3⁴=81.
- **Non-exceptional.** The term is now defined where §2.3 states the condition: "(the non-exceptional condition, KPZ §6.1, p.62)", KPZ line 2703–2708, which is condition (NE).
- **§5.2.** The construction now names ι_i:(G_i,X_i)→(GSp(V_i),S_i^±) and the forms Ψ_i, so that Ψ_3=Ψ_1⊕Ψ_2 is defined before the §5.3 proof sketch uses ι_3, V_3 and Ψ_3.
- **§2.3.** I counted seven properties in the construction (derived group, adjoint datum, reflex splitting, self-dual very-good embedding, R-smooth centre, quasi-tame Z_G^c, torsion-free coinvariants), not five.

## Adversarial pass (new and changed statements)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| §5.4 Theorem, lattice hypothesis | T=Res_(Q(i)/Q)G_m, p=5, α²=−1, Λ=⟨e_1+e_2/5, e_2⟩ | form (α/2)(x_1y_2−x_2y_1); ψ(f_1,f_2)=α/2, Gram det α²/4 a unit; t=(1,2): t·f_1=f_1+(1/5)f_2∉Λ | self-dual, yet K_2,p=T(Z_5)⊄K′_2,p: hypothesis needed | negative Check added |
| same, standard lattice | Z_5e_1⊕Z_5e_2 | (a,b)∈(Z_5^×)² gives (ax_1,bx_2) integral | hypothesis holds | none |
| same, GU(1,1) | Z[i]²⊗Z_5, G_2,Q5≅GL₂×G_m | stabilizer GL₂(Z_5)×Z_5^× = hyperspecial = G_2^fix(Z_5) | holds | clause added to Check 1 |
| same, doubled ι_2 | V_2,Zp⊕V_2,Zp | each summand stable, sum self-dual | holds | none |
| §5.4 existence route | GSp_(2g) at a very special level; torus T from the bad lattice Λ | G^fix(Z_p)⊂GSp(Z_p) stabilizes Z_p^(2g); for T a stable lattice is Z_5e_1⊕Z_5e_2, already self-dual, so Zarhin is not needed | route gives a lattice in both | gap:fixer-stable-lattices |
| multiplier on G_2^fix | T at 5: c(a,b)=ab | c(T(Z_5))=Z_5^× | unit | none |
| gap:fixer-stable-lattices | V=0; split T; GL₂ Iwahori I with Z_p² | Λ=0; eigenlattice; I⊂GL₂(Z_p) gives I→GL(Z_p²) | holds in all three | new gap |
| §3.9 G^fix/Z | torus cover; hyperspecial GL₂; GL₂ at edge midpoint | trivial, π=id, dim 0; PGL₂, dim 3; I/G_m connected, full fixer of x_ad has 2 components | not the full fixer of x_ad | text, API, locator, Check |
| §3.9 Check 3 / §6.2 | Z/2 constant torsor over F_q | H¹(F_q,Z/2)=Z/2; connected smooth group: H¹=1 | Lang only for the connected group | wording |
| gap:rg3-r-smooth-central-quotient | GL₂ hyperspecial; GL₂ Iwahori; torus | G_m smooth, PGL₂; I/G_m = Iwahori of PGL₂; quotient trivial | neutral component = parahoric; quotient ≠ full fixer of x_ad | new gap |
| §0.3 torsor | Y(9)→Y(3), p∤3; K_1^p=K_2^p; non-neat K_2^p∋−1 | 3⁴=81; trivial group; −1∈Z(Q) acts trivially, not free | holds under neatness, fails without | sketch extended |
| §2.3 non-exceptional | split PGL_n; PGL_m(D) with p∣ind D | no division algebra: NE; excluded by §2.3 | agrees with §2.3 Checks 1–2 | term defined |
| §5.2 ι_3, Ψ_3 | diag(2,1)⊕diag(3,1); equal multipliers | multipliers 2≠3: no similitude; c_1=c_2=c scales Ψ_1⊕Ψ_2 by c | agrees with §5.2 Checks 1–2 | notation |
| Conventions quasi-tame | Res_(Q_9/Q_3)G_m; norm-one tori of Q_3(√3) and Q_3(∛3) | 1 factor; e=2 tame; Galois image S_3 of order 6, not dividing 8 | Check unchanged | citation |

Context: no Lean statement changed. `Suggested.lean` declares nothing, so no `variable` block applies.

## Checks run

- `lake env lean packages/ShimuraVarietiesPartII/Suggested.lean`, from the content checkout: exit 0, no output, run after the last edit. The file is unchanged this round. It has no declaration, so the `#check @name` comparison has 0 inputs and nothing changed in it.
- Dependency check, the prescribed command with `--movable`, after the last edit: exit 0. Output: `depcheck: 260 roadmaps, 2508 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- `roadmaps resolve packages/ShimuraVarietiesPartII/README.md`: cross-roadmap citations found nowhere: none; Lean names found nowhere: none.
- Gap consistency: 23 slugs used in the README, 23 "What … must provide" contracts and 23 entries in the `design/plan.json` `gaps` list. The three sets are equal, and each contract names the plan's supplier.
- Residue search: no LaTeX delimiters, process words or machine paths in the README.

No gate failures were listed for this round.

## For the maintainer

- **New supplier gaps (21 → 23).**
  - gap:fixer-stable-lattices asks ReductiveGroupsPartII, on main, for a new target in §RG2.3.5.
  - gap:rg3-r-smooth-central-quotient asks ReductiveGroupsPartIII for a new target in Layer 2. It sits beside the three rg3 R-smooth gaps already declared there.
  - Both are earlier than this roadmap, and the dependency check is unchanged.
  - The second gap makes explicit an input that §§3.4, 3.9 and 3.10 already used implicitly through KPZ Proposition 7.1.14.
- **Ownership.** I searched main, the open heads (`roadmaps grep`) and the board's packages for the two objects: stable lattices for full fixers, and the R-smooth central quotient of fixers (KZ Proposition 2.4.13, KP Lemma 4.6.2). Nobody owns either.
- **Ids.** No section, layer or target id of this roadmap changed, and no name another roadmap cites changed. `Suggested.lean` is unchanged.
- **Sources.** `sources.toml` gains locators only: KZ Propositions 2.4.13, 4.3.6 and 5.3.5; KP Lemma 4.6.2; and "Exact supplier contracts" in KP's `cited_for`. No source was fetched, and no `needs-references.toml` was written.
- **Untrusted text.** The review contained no instruction-like text.

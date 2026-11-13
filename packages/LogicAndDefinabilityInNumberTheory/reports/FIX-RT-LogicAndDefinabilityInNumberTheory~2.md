# FIX-RT-LogicAndDefinabilityInNumberTheory~2

Repair round for red-team round 2 (reviews `~2a` and `~2b`). There are 8 findings in 8 sections: seven are applied and one is not actionable in this package (`2a/F01`). The reviews' "For the human reviewers" sections (licences) and "Source issues" lists are not findings, so nothing was changed for them. Files changed: `packages/LogicAndDefinabilityInNumberTheory/README.md`, `sources.toml` and `design/plan.json` (top-level `gaps` only). `Suggested.lean` is unchanged, because no headline statement changed.

## RT-LogicAndDefinabilityInNumberTheory~2a/F01 (P2) — not actionable in this package: it asks for #2276 to be synchronized with this package, which is a branch operation on another pull request

Confirmed. The #2276 head (`roadmaps show`) differs from this package in 161 lines. It has one gap, the pre-repair §§2.9, 2.10, 4.29 and 7.7, and its own §6.2 import from ShimuraVarieties §3.5a and ComplexComparisonPartII scope line. The roadmap is not on main, so this is no second copy. Direction: rebuild #2276 from this package, then reapply #2276's distinct §6.2 and ComplexComparisonPartII passages there. They are not restated here.

## RT-LogicAndDefinabilityInNumberTheory~2a/F02 (P2) — applied

Verified at `ax_lindemann_for_a_g` lines 811–820: the correspondence is finite-to-one, and finiteness comes from maximal orbits ↔ isolated special points of V′.

§7.1 (I-ws)(d): "identifies … with the special points of V′" → finite-to-one correspondence; each special T′⊆V′ gives a special subvariety of V; maximal orbit images ↔ isolated points.

§7.3: induction on the components of V′ gives finitely many T′_j covering its special points. The A₁×A₁ example (V′=A₁, infinitely many CM points, none isolated) is added.

## RT-LogicAndDefinabilityInNumberTheory~2b/F01 (P2) — applied

The witness holds. `on_the_algebraic_points_of_a_definable_set` lines 390–398 also cover the projected family Z^π and then push it forward.

§6.16 proof: "apply the covering in coefficient space and push blocks through root branches" → for each root-branch tuple φ_i:U_i→ℝⁿ, cover the pullback family {(ξ,s): ξ∈U_i, (φ_i(ξ),s)∈X}; φ_i carries the blocks into X_s, and the count is (2^kT^k)^(ε′)≤2^εT^ε.

New negative Check: t²−1 with X=(0,∞).

## RT-LogicAndDefinabilityInNumberTheory~2b/F02 (P2) — applied

Verified. `le_compl_mentaire_des_puissances_n_i_mes_dans_un_corps_de_nombres` lines 511–515 assert a model smooth over A. Resolution of the total space gives smoothness over A only generically. ResolutionOfSingularitiesCharacteristicZero §6.2 (main) is stated over a field.

§4.29(c): drop 𝒳. Since v↦wv gives U_(uw^p)≅U_u, choose X_u fibrewise, one model of U_(u₀) per class of k×/k×p. In the proof, C: z^p=QR embeds in every U_u by Ξ=z. In the first Check, "fibre of 𝒳" → "fibre U_u of 𝒰". §4.30 uses 𝒰 only.

## RT-LogicAndDefinabilityInNumberTheory~2b/F03 (P2) — applied

Verified. ShimuraVarieties §3.5a (#933 head) has only continuous cells. `roadmaps grep` finds no other owner. van den Dries–Miller (`geometric_categories_and_o_minimal_structures` line 510, refs [7] line 1597) and Pila–Tsimerman (line 860, ref [11] line 906) attribute the result to van den Dries–Miller 1994, the paper §3.5a itself cites.

The new gap `ran-exp-analytic-cells` (ShimuraVarieties §3.5a) is added to the README contracts and `plan.json`, the Scope paragraph, §6.3, the *Needs* of §§6.3 and 6.10, and the Layer 6 Dependencies. A C^p negative witness is added to §6.10. The misattribution to van den Dries–Macintyre–Marker is removed (README References and its `sources.toml` entry).

## RT-LogicAndDefinabilityInNumberTheory~2b/F04 (P3) — applied

Verified: §4.29(d)'s proof uses Chebotarev, and §4.30 does not (its *Needs* lists §§4.17 and 4.29 only).

"Section 4.30 applies this to the auxiliary cyclic extensions." → "Section 4.29(d) applies this to the choice of the auxiliary primes a and b." Scope (README:11) already named §4.29.

## RT-LogicAndDefinabilityInNumberTheory~2b/F05 (P3) — applied

Verified: §1.3 covers residue characteristic zero only, and the transfer of fixed formulas to local fields is §1.5(b).

§2.2: the clause gains "(by §1.5(b), applied to the sentence saying that the fixed formulas define a partition into presented cells)", and *Needs* gains §1.5. §1.5 needs only §1.4 and Layer 1, so there is no cycle. Layer 2's Dependencies already list §1.5.

## RT-LogicAndDefinabilityInNumberTheory~2b/F06 (P3) — applied

Added a **Checks.** block to §2.12 with four bullets:
- the projection gives θ=dy (iterated integral 1);
- ω_Y=π·dx forces θ=π⁻¹dy (densities q⁻¹·q=1; the wrong division gives q⁻²);
- r=2 gives densities q and q⁻¹, against q²/q⁻² for the reading |f|;
- for a=xy, base-first order gives −dx/x and fibre-first gives +dx/x.

All values were recomputed (see table).

## Checks run

- **Elaboration.** `lake env lean packages/LogicAndDefinabilityInNumberTheory/Suggested.lean` from the content checkout exited 0 in 18 s. The output is 11 warnings "declaration uses `sorry`" (lines 40, 50, 66, 73, 84, 92, 100, 118, 126, 160, 176) and no errors. The imported Tau Ceti object file was present.
- **`#check @name` comparison.** A scratch copy of the file with `#check @…` for all 16 declarations was elaborated once. The types are identical to `signatures.md`; no binder was lost. The headlines touched by this round's README changes, `bounded_degree_counting` (§6.16) and `nonpowers_diophantine` (§§4.29–4.30), keep their statements: only proof routes changed. The family order `Fin.append x t ∈ X` matches the pullback family (φ_i(ξ),s)∈X.
- **Dependency check:**

```
depcheck: 239 roadmaps, 2175 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. It was run again after the last edit, with the same output.

- **`roadmaps resolve`** finds no cross-roadmap citation and no Lean name missing.
- **Gap consistency.** README and `plan.json` carry the same four slugs: `neron-pairing-perfect-finite-residue`, `block-family-covering`, `definable-remmert-stein` and `ran-exp-analytic-cells`.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §2.2 transfer of fixed cell formulas via §1.5(b) | S=pt, set {z : z²=1+t}, cells z=±(1+t)^(1/2) | κ((t)), char κ=0: two 0-cells, ac=±1. ℚ₃ (t↦3): 1+3=4, roots ±2, ac 2≡−1 and 1. ℚ₂ (t↦2): 3≢1 mod 8, empty set, so the center formula is not total. | The bound N is genuinely needed (N≥2), exactly as §1.5's x²=1+t Check says | Clause and *Needs* now cite §1.5(b) |
| §2.12 projection | ω_X=dx∧dy, ω_Y=dx on O_F² | θ=dy; 1·1=1=vol(O_F²) | holds | Check added |
| §2.12 rescaled base | ω_Y=π·dx | θ=π⁻¹dy; q⁻¹·q=1; wrong θ=π·dy gives q⁻² | holds | Check added |
| §2.12 r=2 | ω_Y=π²(dx)^⊗2 | θ=π⁻²(dy)^⊗2; |π⁻²|^(1/2)=q, |π²|^(1/2)=q⁻¹; the |f| reading gives q², q⁻² | holds | Check added |
| §2.12 sign | a=xy, x≠0 | (y·dx+x·dy)∧(−dx/x)=−dy∧dx=dx∧dy; (dx/x)∧(x·dy)=dx∧dy | both orders agree after absolute values, as stated | Check added |
| §4.29(c) class identification | p=2, k=ℚ, w=3 | K_(9u)→K_u, v′↦3v: (3v)²=9du ✓ | holds | Restated |
| §4.29(c) split class | u=d⁻¹, p=2 | du=1∈ℚ×², K_u≅ℚ×ℚ, U_u: Ξ₁Ξ₂=P(x)≠0, dim 2, rational | holds; it is the first Check | "fibre of 𝒳" → "fibre U_u of 𝒰" |
| §4.29(c) field class | u=1 | du=d∉k×p by (d), so K_u=k(d^(1/p)) is a field | holds | none |
| §4.29(c) curve in each fibre | C: z^p=QR, Ξ=z | z∈k⊂K_u, N(z)=z^p=P(x); split p=2: (z,z), product z² | holds; S is independent of u | Proof restated |
| §4.29(c) model over A | ℙ¹_A blown up at (u=1,x=0) | k-smooth and projective over A, but the fibre at u=1 is reducible | A model over A with integral smooth fibres is not given by resolution | 𝒳 removed |
| §6.16 pullback route | n=1, k=2, X=(0,∞), t²−1=(−1,0,1) | Projected family contains it (root 1). The smaller-root branch gives −1∉X; the larger-root branch gives 1∈X. | Push-forward fails; pullback holds | Route restated; Check added |
| §6.16 count | √2, T=√2 | Coefficient vector (−2,0,1), height 2≤2²·2=8; the larger-root branch gives √2; (2^kT^k)^(ε′)≤2^εT^ε for kε′<ε, T≥1 | holds | none |
| §6.16 degenerate | n=0; degree-1 coordinate 3/2 with k=2 | (ℝ³∖0)⁰ is a point; (−3,2,0) has one real root, branch j=1 | holds | none |
| §6.10 with analytic cells | X=ℂ=V₁ in ℝ² | One cell ℝ²; Baire gives interior; the identity theorem gives ℝ²⊆V₁ | holds | gap cited |
| §6.10 with C^p cells | graph of max(0,x)^(p+1) on (−1,1) | C^p at 0 (derivatives of order ≤p vanish on both sides); it lies in {y=0}∪{y=x^(p+1)} but in neither; y=0 on (−1,0) only | Continuous or C^p cells are insufficient | Witness added to §6.10 |
| gap ran-exp-analytic-cells, n=1 | definable subsets of ℝ | Cells are points and open intervals, which are analytic | Consistent with §3.4c | new gap |
| §7.3 with N(F)_sh=G | V=A₁×A₁⊂A₂, F the second SL₂ | V′≅A₁ has infinitely many CM points and 0 isolated ones; {x}×A₁⊆V; 1 maximal special subvariety (V) | Old text ("special points of V′ … finiteness") fails; the new text holds | (I-ws)(d) and §7.3 restated |
| §7.3 degenerate | V′=∅; V′ finite | No orbits; each point of V′ is isolated, so T′_j={x′} | holds | none |
| §7.3 isolated ⇒ zero-dimensional T′_j | x′ isolated, x′∈T′_j | T′_j positive-dimensional would contradict isolation, so T′_j={x′} | holds | none |
| Chebotarev consumer | §4.29(d) and §4.30 | "by Chebotarev and class field theory" occurs in the §4.29(d) proof only | holds | sentence fixed |

## Ownership and sources

- **Ownership.** Analytic cell decomposition of R_an,exp: `roadmaps grep -i 'analytic (cell )?decomposition|analytic cells'` over the open heads and main finds only this roadmap (#2276 and this package) and an unrelated clopen decomposition in TropicalAndBerkovichArithmetic. ShimuraVarieties (#933 head, earlier in the merge order) owns R_an,exp and cites van den Dries–Miller 1994 for it, the paper that proves analytic cell decomposition. The new gap therefore names ShimuraVarieties §3.5a, and no notion moves down.
- **`sources.toml`.** The `vd_dr_macintyre_marker` entry is removed. Its only use was the attribution in §6.3, which both cached sources contradict: van den Dries–Miller §4.2 cites their refs [7] and [19], and van den Dries–Macintyre–Marker is their ref [5]. No new source was added, because the new text cites only cached locators.
- **`needs-references.toml`** was not created; no text is missing.

## Notes for the maintainer

- **ShimuraVarieties (#933).** It gains a supplier gap, `ran-exp-analytic-cells` on §3.5a, alongside the existing `definable-remmert-stein` on §3.5d.
- **#2276.** It should be rebuilt from this package before either merges (2a/F01). Its own §6.2 and ComplexComparisonPartII passages should be reapplied there, not here.
- **Source gaps found while repairing.** These are for human reviewers, not edits:
  - Pila 2009, proof of Theorem 5.3, should cover the pullback family of each root branch.
  - Colliot-Thélène–Van Geel §4, p.14, should take fibrewise models, or an equivariant compactification twisted by the torsor, instead of a model smooth over k[u,1/u].
- **Names.** No Lean name changed, and no section id moved.

<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2088#issuecomment-6640013220 -->
Red team round 2 pass b (claude) of 4fa6941

Verdict: needs_changes

1. **F01** (P1) `Conj(G)` and its geometric-point classification already belong to ArithmeticGaloisRepresentations §1.11

   Location: `packages/ReductiveGroupsPartIII/README.md:40–42` ("Owned here. The conjugacy quotient
   `Conj(G)` with its universal property, base change and functoriality; … the classification of geometric
   semisimple classes by the quotient"), §0.2 (387–435, parts (ii), (iv), (v)), §0.4 (470–500), Layer 0
   Examples 598–600, and `Suggested.lean:80–104` (`isConj_iff_classFunctions`,
   `exists_isSemisimplePoint_classFunctions`).

   Claim: this roadmap owns `Conj(G)=Spec C(G)`, `χ_G`, its base change, the bijection between semisimple
   `G(Ω)`-classes and `Conj(G)(Ω)`, `χ_G(x)=χ_G(x_s)`, finite generation, and the `GL_n` instance.

   Witness: ArithmeticGaloisRepresentations (earlier in the merge order), its README at its open head,
   lines 1323–1332: for `H` connected reductive over a field it writes `Conj_H=H//H=Spec O(H)^H`,
   `χ_H`, proves that for every algebraically closed `K` the points `Conj_H(K)` are the semisimple
   `H(K)`-conjugacy classes with `χ_H(h)` the class of `h_s`, constancy of `χ_H` on classes over every
   field, flat base change, finite generation over fields, and `GL_n→𝔸^{n−1}×G_m` by the characteristic
   polynomial; it needs Mathlib `AlgHom.equalizer` for the coaction invariants. ShimuraVarieties §7.0i.1
   (its line 1895) already imports "the conjugation instance of ArithmeticGaloisRepresentations §1.11".
   Two owners of one object.

   Repair: add to the supplier list "The conjugacy quotient `Conj(G)=Spec O(G)^G` with `χ_G`, its flat base
   change, its finite generation over a field, the identification of `Conj(G)(Ω)` with the semisimple
   `G(Ω)`-conjugacy classes with `χ_G(x)=χ_G(x_s)`, and the instance `GL_n→𝔸^{n−1}×G_m` are
   **ArithmeticGaloisRepresentations** §1.11; this roadmap identifies that algebra with
   `classFunctions` (§0.1) and adds the categorical-quotient and functoriality statements (§0.2(i),(iii)),
   group Chevalley restriction (§0.3), separation by characters (§0.5), finiteness (§0.6) and `Conj′`
   (§0.7)." Rewrite §0.2 to cite ArithmeticGaloisRepresentations §1.11 for the definition and for (ii),
   (iv), (v); replace §0.4's statement by the import "ArithmeticGaloisRepresentations §1.11 gives the
   bijection; §0.3 reproves it through `T/W`" or delete §0.4 and fold the `T/W` lifting into §0.3; drop
   "the conjugacy quotient `Conj(G)` with its universal property, base change" and "by the quotient" from
   "Owned here" (lines 40–42) and the `GL_n` example from Layer 0 Examples; delete
   `isConj_iff_classFunctions` and `exists_isSemisimplePoint_classFunctions` from `Suggested.lean` and from
   the docstring list (lines 22–24), keeping `classFunctions` (needed by `isConj_iff_trace_eq` and
   `finite_classFunctions_map`). Tested on the instance that refuted the original: with `GL₂`,
   `diag(1,2)∼diag(2,1)`, `diag(1,3)` separate — the imported §1.11 statement gives exactly this.

2. **F02** (P1) §5.3 restates ShimuraVarieties §7.0i.1

   Location: `packages/ReductiveGroupsPartIII/README.md:1439–1451` (§5.3 "Prove that this condition does not
   depend on `ℓ`, and that there is one finite extension `E′/E` over which it holds for every `ℓ`"), with the
   route "choose finitely many rational Hodge tensors with scheme-theoretic stabilizer `G`"; also "Owned
   here" line 48–49 ("simultaneous factorization of the `ℓ`-adic representations") and §5.5's use of
   `χ_G(ρ_ℓ(Fr_v))` (1510–1512).

   Claim: this roadmap owns Deligne's `ℓ`-independent factorization of `ρ_ℓ` through `G(ℚ_ℓ)` after a finite
   extension, and the description of `G` by finitely many Hodge tensors.

   Witness: ShimuraVarieties (earlier in the merge order), README at its open head, `### 7.0i.1
   Mumford–Tate-valued ℓ-adic Galois representations and Frobenius classes` (its lines 1892–1896): it
   proves `𝐆` is the fixer of finitely many untwisted rational Hodge tensors, proves "Deligne's theorem:
   `Γ_E^𝐆=ρ_ℓ⁻¹(𝐆(ℚ_ℓ))` is an open subgroup of `Γ_E` and does not depend on `ℓ`", defines `E^𝐆`,
   `ρ_ℓ^𝐆`, the Frobenius class `γ_ℓ(v)=χ_𝐆(ρ_ℓ^𝐆(Frob_v))∈Conj_𝐆(ℚ_ℓ)` (geometric Frobenius), and records
   that a change of `E⊂ℂ` replaces `𝐆` by an inner form leaving `Conj_𝐆` and `γ_ℓ(v)` unchanged. Its line
   14 says "Section 7.0i.1 owns … the open subgroup … independent of `ℓ`".

   Repair: replace §5.3 by an import paragraph: "ShimuraVarieties §7.0i.1 supplies the field `E^𝐆`, the
   Mumford–Tate-valued representations `ρ_ℓ^𝐆:Γ_{E^𝐆}→G(ℚ_ℓ)` for every `ℓ`, and the Frobenius classes
   `γ_ℓ(v)=χ_G(ρ_ℓ(Fr_v))∈Conj(G)(ℚ_ℓ)` at places of good reduction prime to `ℓ`, with their independence
   of the decomposition group and lift; Layer 5 assumes `E=E^𝐆`." Add ShimuraVarieties §7.0i.1 to the
   supplier contract and to §5.4, §5.5, §5.7, §5.9 *Needs* in place of "assume `ρ_ℓ` takes values in
   `G(ℚ_ℓ)` for all `ℓ`"; in §5.2 cite §7.0i.1 for the inner-form change of `G` under `τ′=α∘τ` and keep only
   the torsor `P` and the independence of the trivialization as owned here; remove "simultaneous
   factorization of the `ℓ`-adic representations" from "Owned here" and delete the §5.3 Checks (the CM
   and `GL₂` Checks are §7.0i.1's first two Checks). Tested on the CM elliptic curve over `ℚ`: `E^𝐆=K`,
   the value §5.3's first Check gives.

3. **F03** (P3) AutomorphicBundles has no §B1.1

   Location: `packages/ReductiveGroupsPartIII/README.md:86`, `285`, `1413`, `1417`, `1445`, `1451`, `1651`
   ("AutomorphicBundles §B1.1, `finiteTensorStabilizer`").

   Claim: the finite tensor stabilizer is AutomorphicBundles §B1.1.

   Witness: AutomorphicBundles README at its open head has `## Layer 1: canonical principal bundles of Hodge
   and abelian type` (line 806) and `### 1.1 Reductive groups as tensor stabilizers` (line 814) with
   "Prove `finiteTensorStabilizer`" (816); the string "B1" occurs nowhere in that README. The worker's
   `roadmaps resolve` flagged the same.

   Repair: replace every "AutomorphicBundles §B1.1" by "AutomorphicBundles §1.1" (seven occurrences,
   lines above). Note that §1.1 states the connected case in Lean and the disconnected case in prose only
   (its lines 822–824); this roadmap uses the connected case.

4. **F04** (P3) LanglandsParameterStacks §LP3.25 no longer exists

   Location: `packages/ReductiveGroupsPartIII/README.md:96–98` ("the integral restriction isomorphism
   `ℤ[M]^M≅ℤ[T]^W` for split standard dual Levi groups over `ℤ` in **LanglandsParameterStacks** §LP3.25").

   Claim: the section is LP3.25.

   Witness: LanglandsParameterStacks README at its open head: `### 4.26 Integral Chevalley restriction for
   Levi groups` (line 1210), "restriction gives an isomorphism `ℤ[M]^M ≅ ℤ[T]^{W(M,T)}` with no good-prime
   hypothesis"; "LP3.25" occurs nowhere in the file.

   Repair: write "**LanglandsParameterStacks** §4.26".

5. **F05** (P3) The Weil estimate is attributed to AbelianSchemesAndArithmeticModuli §A6.21, which does not state it

   Location: `packages/ReductiveGroupsPartIII/README.md:1535` ("with roots of absolute value `√q`
   (AbelianSchemesAndArithmeticModuli §§A6.11 and A6.21)"), `1567–1569` and `1572` (§5.7 route and *Needs*:
   "the eigenvalues of `Fr_v` on `H¹` have absolute value `√q` under every complex embedding"), Conventions
   `146`.

   Claim: §A6.21 supplies `|α|=√q` for the Frobenius eigenvalues.

   Witness: AbelianSchemesAndArithmeticModuli §A6.21 at its open head (lines 3344–3352) proves
   `frobeniusSemisimple`: centrality of `π`, `π^†π=q`, semisimplicity; it does not state the absolute value.
   The Riemann hypothesis is DeligneWeightsAndPurity `### 1.4. The Weil estimate for abelian varieties over
   𝔽_q` (its line 960–962): "Every root of the characteristic polynomial `P_{π_A}∈ℤ[X]` is a Weil
   `q`-number of weight `1`", with the geometric Frobenius on `H¹` pure of weight `1`.

   Repair: in the Check at 1535 and in §5.7 (route and *Needs*) cite "DeligneWeightsAndPurity §1.4 (the
   Weil estimate: the Frobenius eigenvalues on `H¹` are Weil `q`-numbers of weight `1`)" for the absolute
   value, keeping §A6.21 for semisimplicity; add "§1.4: the Weil estimate for abelian varieties over
   `𝔽_q`" to the "From TauCetiRoadmap.DeligneWeightsAndPurity" contract (line 232–235) and to the Layer 5
   Dependencies. Instance: non-CM elliptic curve, `X²−aX+q` with `a²≤4q` (§5.7 Check 2) is the §1.4
   statement for `g=1`.

6. **F06** (P3) ReductiveGroups Layer 8 is cited for a statement it does not make

   Location: `packages/ReductiveGroupsPartIII/README.md:206–208` ("Layer 8: the inner/outer and pinned
   automorphism interfaces; an automorphism fixing a maximal torus pointwise preserves every Borel subgroup
   containing it, so its outer class is trivial and it is conjugation by an element of that torus") and
   `1194–1195` (§4.1 *Needs*: "an automorphism fixing a maximal torus pointwise is conjugation by an element
   of it").

   Claim: Layer 8 of ReductiveGroups supplies this statement.

   Witness: `TauCetiRoadmap/ReductiveGroups/README.md:1023–1092` (Layer 8 on main) states the isomorphism
   and existence theorems, relative reductive groups, the automorphism sheaf and "inner/outer and
   pinned-automorphism interfaces" (line 1056); the words "pointwise", "fixing a maximal torus" and the
   conclusion "conjugation by an element of that torus" occur nowhere in Layers 7–8. The step is used at
   `README.md:1189` ("`g⁻¹σ` fixes `T₀` pointwise, so it is conjugation by an element of `T₀`").

   Repair: in the ReductiveGroups contract write "Layer 8: the isomorphism theorem and the inner/outer and
   pinned automorphism interfaces" only, and in §4.1's route add the derivation: "an automorphism of the
   connected reductive `I₀` fixing `T₀` pointwise acts trivially on `X^*(T₀)`, hence preserves every root
   subgroup and every Borel containing `T₀`; by the isomorphism theorem (ReductiveGroups Layer 8) it is
   `Int(t)` for `t∈T₀(Ω)` after lifting from `T₀/Z(I₀)` over the algebraically closed `Ω`." Instance: for
   `I₀=GL₂`, `T₀` diagonal, such an automorphism fixes `diag(a,b)` and so preserves both root groups
   `U_{±}`, and is `Int(diag(1,c))`.

7. **F07** (P3) §5.4 uses an undefined, unowned "Hodge group `Hdg`"

   Location: `packages/ReductiveGroupsPartIII/README.md:1479–1481` ("`H` is connected, since `G=w_s(G_m)·Hdg`
   with the Hodge group `Hdg` connected, contained in `ker ν` and containing `−1=h(−1)`, so `ker(ν|_G)=Hdg`").

   Claim: a connected group `Hdg` with `G=w_s(G_m)·Hdg` is available.

   Witness: "Hodge group" and "Hdg" occur nowhere else in the README, in ShimuraData (its README has no
   "Hodge group"), nor in the supplier contracts; ShimuraData §§1.2–1.3 define and prove connected only the
   Mumford–Tate group of `h`. The property used, connectedness of `ker(ν|_G)`, needs an argument.

   Repair: replace the sentence by "`H` is connected: `G=w_s(G_m)·ker(ν|_G)` because `ν∘w_s(z)=z²` is
   surjective, and `ker(ν|_G)` is connected because `G` is (ShimuraData §1.3), `w_s(G_m)∩ker ν={±1}` and
   `−1=h(−1)` lies in the connected image `h(U(1))⊂ker ν`; so `ker(ν|_G)` is geometrically connected and
   §1.5 applies to the whole fibre product." Instance: non-CM elliptic curve, `ker(det|_{GL₂})=SL₂∋−1`,
   connected.

8. **F08** (P3) §5.4: the "`I`-fixed line spanned by a diagonal cocharacter" need not exist

   Location: `packages/ReductiveGroupsPartIII/README.md:1483–1485` ("`X_*(H_ab)` is the direct sum of its part
   killed by `ν_*` and the `I`-fixed line spanned by a diagonal cocharacter; so both … `X_*(H_ab)_I` are
   torsion free").

   Claim: there is an `I`-fixed diagonal cocharacter `(y,…,y)` spanning a complement of `⊕_τ ker ν_*`.

   Witness: `A=E_CM×E′` with `E_CM` of CM field `K` ramified at `p` and `E′` without CM:
   `G={(t,g)∈Res_{K/ℚ}G_m×GL₂ : N(t)=det g}`, `G_ab≅Res_{K/ℚ}G_m`, `X_*(G_ab)=ℤe₁⊕ℤe₂` with inertia
   swapping `e₁,e₂`, `ν_*(e_i)=1`. The `I`-fixed cocharacters are `ℤ(e₁+e₂)`, with `ν_*=2`; the sum of
   `⊕_τ ker ν_*` and the diagonal of `e₁+e₂` has index `2` in `X_*(H_ab)`, and the diagonal of `e₁` is not
   `I`-fixed. The conclusion still holds: `ν_*` is onto `ℤ` because `ν∘μ_h(z)=z^{−1}`, so for `y₁` with
   `ν_*(y₁)=1` the element `Σ_{g∈Γ_{ℚ_p}/Γ_{F_w}} g⊗y₁` of `X_*(H′_ab)|_{Γ_{ℚ_p}}=⊕_w Ind(X_*(G_ab))` (a
   permutation module since `G_{F_w}` is split) is `Γ_{ℚ_p}`-fixed, lies in `X_*(H_ab)` with common
   `ν_*`-value `1`, and `X_*(H_ab)=(⊕_w ℤ[Γ_{ℚ_p}/Γ_{F_w}]⊗ker ν_*)⊕ℤ·(that element)` as `I`-modules.

   Repair: replace the quoted sentence by "`ν_*:X_*(G_ab)→ℤ` is onto, since `ν∘μ_h(z)=z^{−1}`; choose
   `y₁` with `ν_*(y₁)=1`. Because `G_{F_w}` is split, `X_*(H′_ab)` restricted to `Γ_{ℚ_p}` is the
   permutation module `⊕_{w|p}ℤ[Γ_{ℚ_p}/Γ_{F_w}]⊗X_*(G_ab)`, and `X_*(H_ab)` is the direct sum of
   `⊕_{w|p}ℤ[Γ_{ℚ_p}/Γ_{F_w}]⊗ker ν_*` and the `Γ_{ℚ_p}`-fixed line spanned by
   `Σ_{w}Σ_{g}g⊗y₁`; coinvariants of a permutation module are free, so both `X_*(H′_ab)_I` and
   `X_*(H_ab)_I` are torsion free." Instance: the witness above gives `X_*(H_ab)_I≅ℤ³/ℤ(−1,−1,2)`,
   torsion free.

Pins used: Mathlib `f6090c70`, Tau Ceti `358314d4` (the content checkout's `lake-manifest.json`; the
Tau Ceti pin moved since round 1, so every library declaration was re-read at the new pin). Suppliers
were read on main (ReductiveGroups, ReductiveGroupsPartII, Chebotarev, GlobalNumberFields) or at
their open heads through the roadmap index (all others). No Lean was run (no Lean command is given to
this pass, and the worker's own elaboration attempt failed on a missing build object); signatures were
checked by reading the pinned definitions binder by binder.

## Round 1: each earlier finding at this head

| Finding | Status | Witness at 4fa6941 |
|---|---|---|
| a-F01 (§1.3 `ℚ̄→Ω`) | repaired | `README.md:668–672`: "factors through a closed point of `X_y` whose residue field `K` is a finite extension of `ℚ`, followed by a `ℚ`-embedding `K→Ω`"; new Check `X=Y=Spec ℚ`, `Ω=ℚ` at 682–684. |
| a-F02 = b-F01 (§1.2 sextic) | repaired | `README.md:655–660`: `(x²−2)(x²−17)(x²−34)`; recomputed: `17≡1 mod 8` (2-adic square), `6²=36≡2 mod 17`, product of the three Legendre symbols is `1` at odd `ℓ∤34`; old sextic kept as negative control at `2`, `3`. |
| a-F03 (§3.5 diagonalizable) | repaired | `README.md:1061–1062`: "of multiplicative type over `F` and diagonalizable over `F̄`, not in general over `F`"; Check `(3+4i)/5` at 1078–1081. |
| a-F04 (§0.3 char 2) | repaired | `README.md:463–466`: "In characteristic two it is `s↦s²`, the Frobenius: bijective on points … but not an isomorphism of schemes". |
| a-F05 (`GL₀`) | repaired | `README.md:598–600`: "`n≥1` … For `n=0`, `GL₀` is trivial, `Conj(GL₀)=Spec k`". |
| a-F06 (§1.5 connectedness) | repaired | `README.md:711–715`: identity component, and the whole fibre product when `ker ν` is geometrically connected; Checks 727–732. §5.4 proves `H` connected (line 1479–1481). |
| a-F07 (§5.4 `H` vs `H′`) | repaired | `README.md:1465–1470`: `H′=Res_{F/ℚ}G_F`, `𝓗(ℤ_p)=H(ℚ_p)∩𝓗′(ℤ_p)`; Check `8`, `7`, `6` dimensions at 1503–1506. KZ25 lines 2571–2581 agree. |
| a-F08 (§5.1 `h` matrix) | repaired | `README.md:1395–1399`: `(a²+b²)⁻¹[[a,−b],[b,a]]`, eigenvalues `z⁻¹,z̄⁻¹`, `(1/2)·id` at `z=2`. |
| a-F09 (RG2.3.3) | repaired | `README.md:216–218`, `1476`; on main `ReductiveGroupsPartII/README.md:4477` is under `### RG2.3.3` (line 4151); RG2.3.4 starts at 4530. |
| a-F10 (parahoric gap) | repaired (differently) | `README.md:222` and `design/plan.json` carry `gap:parahoric-intersection-same-derived`; RG2.3.4 *associated-parahorics* (main 4532) is for central surjections only, so the gap is needed; *fixer-versus-parahoric* (5) (main 4357–4359) has the hypotheses §5.4 checks. |
| a-F11 (`g≥1`) | repaired | `README.md:137–139` Conventions; §5.1 negative Check 1400–1401 (`ν(w_s(2))=1≠4`). |
| a-F12 (§0.2/§0.3 order) | repaired | `README.md:400–403` build order; §0.3 *Needs* at 453–454 names §0.2(i)–(iii) only. |
| a-F13 (two headlines) | repaired | `Suggested.lean:127–135` `finite_classFunctions_map`, `:144–147` `finrank_eq_one_of_embeddings_padic`; both named in the docstring (27–30) and README (§0.6, §1.2). Both checked below. |
| a-F14 (A5.7 restriction) | repaired | `README.md:293–300`: A5.7 "used only under that restriction"; A3.7, A3.9, A4.1 cited for every `ℓ`. Supplier head A5.7 (its line 2722–2723) indeed assumes `ℓ` prime to the polarization degree; A3.9 has the rational inverse, A4.1 `dualPairing`. |
| a-F15 (`hasseCases`) | repaired | `README.md:304–307`, `1325`, `1337`; supplier M3.2 (its line 2843–2845) states (A) with the centre bijection. |
| a-F16 (KMPS22 inputs for (b)–(d)) | repaired | `README.md:1296–1302`; KMPS22 lines 1095–1105, 1122–1123, 974–981 say what is attributed. |
| a-F17 (§4.2 Check) | repaired | `README.md:1223–1227`; recomputed `(X−3)(X²+3X+4)≡X³−2 mod 5`, discriminant `3` non-square; `2` not a cube mod `7`. |
| a-F18 (Shin numbering) | repaired | `README.md:1333`: "author-version numbering, published as Lemma 3.1.1"; Shin11 line 696 is "Lemma 3.1". |
| a-F19 (rank form) | repaired | `README.md:934–936` and Check 957–959. |
| b-F02 (no-`E₈`) | repaired | `README.md:1598–1600` and gap sentence at 268; `plan.json` gap text identical. Kottwitz86 line 706 has the `E₈` clause. |
| b-F03 (LP3.25) | repaired, then drifted | `README.md:96–98` cites LanglandsParameterStacks §LP3.25; at the supplier's open head the target is `### 4.26 Integral Chevalley restriction for Levi groups` and no "LP3.25" occurs (S04 below). |
| b-F04 (three files) | repaired | `README.md:187–190`; at the pin `Torus/Existence.lean:99`, `Torus/Conjugation.lean:49`, `Torus/Maximal.lean:50`. |
| b-F05 (Steinberg 6.11(d)) | repaired | `Suggested.lean:95–96`, `README.md:482–485`; Steinberg65 line 623 (6.4), 674–675 (6.11 d). |

No repair introduced a new error that I found, except the drift recorded as S04 and the two
proof-route sentences of §5.4 recorded as S07 and S08 (the §5.4 rewrite of a-F07/a-F10 added them).

## Verified sound

Counts: declarations read 7 of 7 (`classFunctions`, `isConj_iff_classFunctions`,
`exists_isSemisimplePoint_classFunctions`, `isConj_iff_trace_eq`, `finite_classFunctions_map`,
`finrank_eq_one_of_embeddings_padic`, `exists_isMaximalTorus_conjugate`); README targets read 41 of 41
(§§0.1–0.7, 1.1–1.6, 2.1–2.5, 3.1–3.8, 4.1–4.6, 5.1–5.9) with all 41 `*Needs:*` lines, every API bullet
and every Check (all 1715 lines; the Lean file in full, 176 lines); source locators verified against
the cached texts 51 (Steinberg65 ×7: 6.1 line 592, 6.2 599, 6.3 602, 6.4 623, 6.5 626, 6.6 628–642,
6.11(d) 674–675; KMPS22 ×16: 1.2.1 596–624, 1.2.2 625–629, 1.2.5 648–683, §2.1.3 974–981, §2.1.8
1079–1094, 2.1.9 1095–1105, §2.2.1 1107–1118, 2.2.2 1122–1123, §2.2.3 1125–1128, 2.2.4 1129–1146,
2.2.10 1301–1322, 2.2.11 1323–1331, §2.2.12 1332–1338, 2.2.13 1339–1371, 2.2.14 1372–1393, 2.3.16
1647–1655; KZ25 ×17: §5.1.3 2091–2098, 5.1.4 2104–2106, §5.3.2 2367–2380, 5.3.3 2381–2388, 5.3.5
2392, §5.3.6 2428–2439, 5.3.7 2440, §6.1.1–6.1.3 2445–2469, 6.1.4 2472, 6.2.4 2559–2582, §6.2.5
2583–2591, 6.2.6 2592–2618, 6.2.7 2619–2621, 6.2.8 2622–2626, §6.3.2 2664–2672, 6.3.3 2673–2693, 6.3.4
and 6.3.5 2694–2718; Kottwitz86 ×3: 2.6 line 491, 6.6 706, §6.7 757–760; Kottwitz90 p.188 lines
6779–6803; LR87 5.6 lines 2907–2923; Borovoi98 5.6.3 lines 1448–1451; Deligne82 ×4: 2.11 line 848,
Remark 3.3 1001–1010, 3.8 1116–1122, 3.9 1124–1161; Shin11 ×2: 3.1 696–721, 3.2 724–727); Checks
recomputed 46 (table below and the round-1 table); cross-roadmap citations resolved 49 (list below);
pinned declarations read 22; gate run once.

**Dependency gate** (command of the brief, from the board checkout):

```
depcheck: 209 roadmaps, 1818 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Position 233 in `merge-order/ORDER.txt`; every cited supplier is earlier
(ReductiveGroupsPartII 23, IntegralHeckeAndGaloisDeterminants 27, AdelicAlgebraicGroups 34,
SchemeKTheoryOperations 37, AbelianSchemesAndArithmeticModuli 46, LanglandsParameterStacks 73,
MotivesAndAlgebraicCycles 82, DeligneWeightsAndPurity 91, ShimuraVarieties 114, PELModuli 128, ShimuraData
130, EndoscopicTransferAndUnitaryTraceComparison 162, AutomorphicBundles 229) or on main; the two owners
found by S01 and S02 (ArithmeticGaloisRepresentations, ShimuraVarieties) are also earlier, so the repair
repoints downward and creates no cycle. BunGAndNewtonStrata (241) appears only as a consumer.

**Declarations, context and values (namespace `TauCetiRoadmap.ReductiveGroupsPartIII`; no `variable`
block, so no binder can drop; every hypothesis sits in the declaration's own signature).**

| Declaration; section | Binders and pinned carriers | Instances tried; values on each side | Result |
|---|---|---|---|
| `classFunctions k H`, §0.1 | `[CommRing k] [CommRing H] [HopfAlgebra k H]`; `AlgHom.equalizer` (`Subalgebra/Basic.lean:1030`) of `conjugationAlgHom` (`Hopf/Conjugation.lean:68`, first factor conjugates, `productMap_comp_conjugationAlgHom` :93 evaluates to `(g*x*g⁻¹).ofConv`) and `includeRight` (`TensorProduct/Basic.lean:277`, `h↦1⊗h`) | `G_m`: `c*(t)=1⊗t`, equalizer `k[t,t⁻¹]`; trivial group: both maps `id_k`, equalizer `k`; `GL₂`, `g`=swap, `x=diag(2,3)`: `(gxg⁻¹)₁₁=3≠2`, `tr`: `5=5`; zero ring: one element | real body; member iff `f(gxg⁻¹)=f(x)` on all `A`-points |
| `isConj_iff_classFunctions`, §0.4 | `[Field Ω] [IsAlgClosed Ω]`, `H : FiniteTypeCommHopfAlgCat.{u,u} Ω`, `hH : reductiveCommHopfAlgProperty Ω H` (`Reductive/Basic.lean:70`: smooth, geometrically connected, no connected normal smooth unipotent geometric subgroup), `IsSemisimplePoint` (`SemisimplePoint.lean:80`, all `FGComoduleCat.{u,u,u}`), `IsConj` in `WithConv (H →ₐ[Ω] Ω)` | `GL₂`: `diag(1,2)∼diag(2,1)` (`tr 3`, `det 2` both), `diag(1,3)`: `tr 4`; `𝔽̄₂`, `SL₂`: `diag(a,a⁻¹)∼diag(a⁻¹,a)` by the Weyl element; unipotent `[[1,1],[0,1]]` vs `1`: equal on `C`, excluded by `hx,hy`; trivial group: one class, one point | true as typed; owned by ArithmeticGaloisRepresentations §1.11 (S01) |
| `exists_isSemisimplePoint_classFunctions`, §0.4 | same context; `φ : classFunctions Ω H →ₐ[Ω] Ω` | `G_m`: `φ` is evaluation at `φ(t)∈Ω^×`; `SL₂`: `φ(s)=c`, lift `diag(a,a⁻¹)` with `a+a⁻¹=c` (exists, `Ω` algebraically closed); trivial group: one point | true; owned by §1.11 (S01) |
| `isConj_iff_trace_eq`, §0.5 | `endOfPoint M x.ofConv : Ω⊗M→Ω⊗M` (`PointsAction.lean:78`, `A=R=Ω`), `LinearMap.trace Ω _` (`Trace.lean:75`) | `G_m`, `t↦diag(t,t⁻¹)`: `2` and `1/2` both `X²−(5/2)X+1`, separated by the comodule `t`; `M=0`: `0=0`; trivial comodule: `1=1`; `SL₂`: the standard trace already separates | both directions hold; quantifier over all comodules needed |
| `finite_classFunctions_map`, §0.6 | `H G : FiniteTypeCommHopfAlgCat.{u,u} k`, `hG` reductive, `f : H.obj →ₐc[k] G.obj` surjective, `q` with `hq : val∘q = f∘val` (determines `q`, `val` injective), `AlgHom.Finite` (`Finiteness/Defs.lean:193`) | `G=H`, `f=id`: `q=id`; `G=1`: `C(G)=k`; `G_m→GL₂`: `t` root of `X²−sX+1`, `t⁻¹` root of the reciprocal, `O(T)=k[t^{±1}]` finite over `k[s,d^{±1}]`; `T⊂B` (Borel, `H` not reductive): `C(B)→C(T)=O(T)` | finite in every case; image of `C(GL(V))` in `C(G)` lies in the image of `C(H)`, so finiteness over the smaller ring transfers |
| `finrank_eq_one_of_embeddings_padic`, §1.2(a) | `[NumberField K]` (gives `CharZero`, so `Module ℚ K`), `S : Finset ℕ`, `∀ ℓ [Fact ℓ.Prime], ℓ∉S → Nonempty (K →+* ℚ_[ℓ])` | `K=ℚ`, `S=∅`: `1=1`; `ℚ(i)`: no embedding at `ℓ≡3 mod 4`; `ℚ(∛2)`: none at `7`; non-prime `ℓ`: no `Fact` instance, clause vacuous | hypothesis fails exactly for `K≠ℚ`; Chebotarev + Jordan route sound |
| `exists_isMaximalTorus_conjugate`, §2.2 | `[NumberField F]`, `IsMaximalTorus k H I` (`Torus/Maximal.lean:50`: `Minimal` among Hopf ideals with torus quotient), `baseChange` (`CommHopfAlgCat/BaseChange.lean:65`, `K ⊗[k] H`), `baseChangeHopfIdeal` (`HopfIdeal/BaseChange.lean:102`), `conjugate` (`HopfIdeal/Conjugation.lean:66`, `gKg⁻¹`), finite places `HeightOneSpectrum (𝓞 F)`, archimedean `InfinitePlace F` | `S=S'=∅`: `exists_isMaximalTorus` (`Existence.lean:99`); `G=T` torus: only `T_{F_v}` admissible; `GL₂/ℚ`, `S={p}`, `S'={∞}`, split at `p`, `ℂ^×` at `∞`: `Res_{E/ℚ}G_m`, `E` imaginary quadratic split at `p`; data at `v∉S` unused | true at the README's generality (Borovoi98 over a number field) |

Imports: `import Mathlib` plus ten `TauCeti.*` modules, all present at `358314d4` (checked file by file);
`theorem` throughout; no `set_option`, `lemma`, `#eval`, `True` placeholder, sorry'd data.

**Adversarial pass on the README (values on each side).**

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions: conjugation orientation | pin docstring `Hopf/Conjugation.lean:63–67` | "first tensor factor is the conjugating variable" | matches README |
| Conventions: cocycle `a_σ=g⁻¹σ(g)` | composite | `a_σσ(a_τ)=g⁻¹σ(g)σ(g)⁻¹στ(g)=a_{στ}` | consistent |
| Conventions: `ν(ρ_ℓ(Fr_v))=q` | `χ_ℓ⁻¹` on `V_ℓ^*`, geometric Frobenius | `χ_ℓ(Fr_v)=q⁻¹` ⇒ `q` | consistent with §5.7 |
| §0.1 flat base change | `K⊗C(H)→C(K⊗H)` | equalizer = kernel of a difference; flat base change preserves kernels | holds |
| §0.2 `Conj(GL₂)` | `tr,det` | `k[s,d,d⁻¹]`, `d=0` absent | holds |
| §0.2 `SL₁(D)`, point `5/2` | `(x−2)(x−1/2)` | would give `ℚ×ℚ⊂D` | no rational lift |
| §0.3 `SL₂→PGL₂` | `s=a+a⁻¹`, `α=a²` | `α+α⁻¹=s²−2`; `±5/2↦17/4`; char 2: `s²` | holds |
| §0.3 characters span `k[X]^W` | any field | orbit sums are a basis of `ℤ[X]^W` and of `k[X]^W`; simple characters unitriangular | holds (SKO §6.3.1 at head, its line 2281) |
| §0.6 reciprocal polynomial | weight `χ` of `diag(t,t⁻¹)` | `t` root of `X²−sX+1`, `t⁻¹` of `X²−sX+1` | integral over `k[s]` |
| §0.7 Check 4 | `SO(8)`, 8 distinct eigenvalues | `Z_{O(8)}(t)`=torus of `SO(8)` ⇒ `sts⁻¹≁t`; eigenvalue `1` twice: `O(2)⊂Z` | holds |
| §0.7 extension of improper conjugation to `H` | centre of `SO(2n)` | `±1` fixed by `O(2n)`-conjugation, so the central kernel is preserved | well defined |
| §1.1 Burnside | `S₃`, `Δ=⟨(12)⟩` | fixed cosets `3,1,1,1,0,0`, sum `6=|Γ|` | 3-cycles missed |
| §1.2 Check 1 | `ℚ(∛2)` | `ℓ≡2 mod 3`: `X³−2` has a root (cubing is a bijection); `ℓ=7`: `2∉{1,6}` | holds |
| §1.2 Check 3 | `ℓ=2,3,5,7,17` | `17≡1 mod 8`; at `3`: `2≡2` no, `17≡2` no, `34≡1` yes; `5`: `34≡4`; `7`: `2≡9`; `17`: `6²` | root at every `ℓ` |
| §1.3 count | finite `ℚ`-algebra `A` | `|Hom_ℚ(A,Ω)|≤dim A` (`A_red=∏K_i`) | holds |
| §1.4 Check 3 | `U(1)` vs `G_m` | units `ℚ^×` vs `ℚ^×t^ℤ` | not isomorphic |
| §1.5 `ν=t²`, `[F:ℚ]=2` | `{x²=y²}` | `G_m×μ₂` | disconnected, identity component diagonal |
| §1.5 connected case | `ker ν` connected | `H` extension of `G_m` by `∏ker ν` ⇒ connected reductive | holds |
| §1.6 | `(SL₂×G_m)/μ₂` | `≅GL₂`; `[(h′xh′⁻¹,1)]=[(y,1)]⇒z=1` | injective |
| §2.1 Check 2 | norm-one torus, imaginary `E` | `H¹(ℝ,T)=ℤ/2`, `(X_*)_Γ=ℤ/2`, split `ℓ`: `H¹=0`, inert: `ℤ/2` | auxiliary `ℓ` inert |
| §2.4 Check 2 | `n=diag(i,−i)` | normalizes `SO(2)` by inversion; `n⁻¹c(n)=−1`; cocycles reals, coboundaries positive reals | nontrivial class |
| §2.4 Check 3 | `GL₃`, `c=(12)`, `w=(13)` | `(12)(13)(12)=(23)≠(13)` | `n⁻¹c(n)∉T` |
| §2.5 (i)–(iii) | `c(g)=gt⁻¹n⁻¹c(n)c(t)`, `u=gt⁻¹n⁻¹` | `c(u)=u`; `uTu⁻¹=gTg⁻¹`; `Int(u)μ_h=Int(g)μ`; `σ(gt_p⁻¹)=gt_p⁻¹` for `σ∈Γ_p` | holds; source cocycle `gσ(g)⁻¹` converted correctly |
| §3.1 | `V=X_*⊗ℚ` | complement of `V^Γ` is `c=−1` part; dual statement on `X^*` | `χ+cχ` is `Γ`-fixed and kills `T_c` |
| §3.1 Checks | `ℚ(√3)` norm-one; CM degree `2d` | ranks `1≠0`; `d≠1` | fail as stated |
| §3.2 Checks 3–4 | `a,b` | `aⁿ=[[1,n/q],[0,1]]` bounded; `tr(ab)=2+1/q²`, `v_q=−2` | `ab` not an `l`-unit |
| §3.3 Check 2 | `(2+i)/(2−i)` | `=(3+4i)/5`, norm `1`, unit away from `5`, not integral | 5-Weil weight 0 only |
| §3.5 | `γ^m`, `m=#μ(L)` | torsion of a f.g. subgroup of `L^×` killed by `m` | `γ^m` neat |
| §3.6 same weight under `σ` | Serre `T` | `c` central in the image of `Γ` on `V` ⇒ `σχ+cσχ=χ+cχ` | `|σχ(γ)|=l^{w/2}` |
| §3.7 route | `x∈y^{m₀}K_T` | `v_l(χ(x))=m₀v_l(χ(y_l))>0`; `χ(K_{T,l})⊂ℤ_l^×` | `x∉T′` |
| §3.7 Check 2 | `l` inert in `E` | `2v_λ(x)=0` ⇒ unit ⇒ root of unity | finite |
| §3.8 | `k[ε]/ε²`, doubled line | `ε↦2ε` fixes the point; swap fixes the punctured line | both hypotheses needed |
| §4.1 route | `g⁻¹σ` on `I₀` | fixes `T₀` pointwise ⇒ `Int(t)` (S06 for the owner) | conclusion `Aut′`-conjugacy |
| §4.1 Check 2 | `SO(8)`, improper `s` | `s|_{T₀}`: one sign change `∉W(D₄)` | not `G(Ω)`-conjugate |
| §4.1 Check 3 | `Sp₄`, `diag(−1,1,−1,1)` | `Sp₂×Sp₂`; Levi derived groups `1,SL₂,SL₂,Sp₄` | not a Levi |
| §4.2 Check 2 | `ℚ(√2)` | fixed point iff `ℓ≡±1 mod 8` | hypothesis fails |
| §4.4 anisotropic place | `X_*(T*_sc)^{Γ_v}=0` | `N_v=0` ⇒ `Ĥ⁻¹_v=(X_*)_{Γ_v}↠(X_*)_Γ⊇Ĥ⁻¹` | `ξ_v` onto |
| §4.4 Check 2 | `D` ramified `{p,∞}`, `E` inert at `p` | `E_p`, `E_∞` fields ⇒ `E↪D` | holds |
| §4.6 `Z≅T₁` | `(e,λ)` | `⟨ex,ey⟩=N(e)⟨x,y⟩=λ⟨x,y⟩` | holds |
| §4.6 `H¹(k,T₁)` | long exact sequence | `H¹(Res_FG_m×G_m)=0` ⇒ `(F⁺⊗k)^×/(N·k^×)` | holds |
| §4.6 Check 2 | Shin11 717–719, `r=1` | order `2` iff `2|d` or `2|n`; `1` otherwise | matches |
| §5.1 Check 4 | `z=2`, `z=i` | `(1/2)id`, multiplier `1/4`; eigenvalues `−i,i` | matches `z^{-p}z̄^{-q}` |
| §5.1 Cartan | `h(i)∈T` | `Int(h(i))` trivial on `T/w_s(G_m)` ⇒ in the compact form | elliptic |
| §5.4 `H` connected | `ker(ν|_G)` | `{±1}·(ker ν)°`, `−1=h(−1)∈h(U(1))⊂(ker ν)°` (S07 for the wording) | connected |
| §5.4 `X_*(H′_ab)_I` | `G_{F_w}` split | `⊕_w Ind` of a trivial `Γ_{F_w}`-module = permutation module | torsion free |
| §5.4 `X_*(H_ab)_I` | witness of S08 | `ℤ³/ℤ(−1,−1,2)` | torsion free; stated reason repaired by S08 |
| §5.5 fibre | finite `ℚ`-scheme, one `ℚ̄`-point, a `ℚ_ℓ`-point | reduced = `Spec K`, `[K:ℚ]=1` | `γ_v` rational and unique |
| §5.6 | `χ∘w_s=z^m` | `(χ+cχ)(w_s(z))=z^{2m}=mν(w_s(z))`; difference `c`-fixed on anisotropic torus ⇒ `0`; `χ(ct₀)=χ(t₀)` | `t₀` real |
| §5.7 Check 2 | `a²=4q` | semisimple with `(X∓√q)²` is scalar `±√q` | in every torus |
| §5.8 Check 2 | `SL₂`, elliptic | invariants in `ℤ/2` at nonsplit places, sum zero | holds (Kottwitz86 §6.7) |
| §5.9 adelic family | Galois image compact | lies in a product of compact opens, hyperspecial a.e. | holds (KZ25 2635–2638) |

Every "iff" was tested in both directions where an instance exists (§§0.1, 0.4, 0.5, 3.1, 3.5, 3.6, 0.7,
3.2 torus criterion); degenerate cases `G_m`, trivial group, `GL₀`, `SL₂`, `S=∅`, `F=ℚ`, `w=1`, `τ=τ′`,
`Z_H=1`, `n=1`, `F⁺=ℚ`, `g=0`, `a²=4q`, char 2 all gave the stated values.

**Cross-roadmap citations resolved (49), with what the supplier states.** IntegralHeckeAndGaloisDeterminants
§0.7 (its line 1114–1131: invariant coordinate algebra in every arity, invariants over every coefficient
algebra); SchemeKTheoryOperations §6.3.1 (line 2281: ring isomorphism onto `ℤ[X]^W` for split connected
reductive groups over a field using §§10A–10B); DeligneWeightsAndPurity §0.1 (561), §0.2 (601, with the
reciprocal conjugation formula (iii)); AdelicAlgebraicGroups §3.4 *class-number-finite* (3240), §4.1 "Local
H¹ vanishing" and "Hasse kernel and injectivity" (Kneser, Hasse principle), §4.3 (4571–4600: tensor
subquotients, `Neat.IsNeatAut`, independence, `√2` remark); EndoscopicTransferAndUnitaryTraceComparison
§1.1, §1.2 (a) local `H¹(F,S)≅(X_*(S)_Γ)_tors`, (b) global, §1.3 (reductivity of connected centralizers),
§1.5, §1.6 (inner twists, composition, torus transfer from the inner form to `G*`), §1.9 (a) Kneser, (c)
Hasse principle, §1.11 (a)/(b), §1.14 (b), (d), §1.15 (stated with `G₀=G`, so the gap is needed as declared;
its hypothesis line 154 records the `E₈` removal); ShimuraData §1.2 (`mumfordTateGroup`, minimality), §1.3,
§1.4, §4.2 (line 807: Hodge-type data satisfy `SV2*` by restriction from `GSp`), §4.3 (`SV2*` defined);
ShimuraVarieties §P.5 (198: regular semisimple open, centralizer tori, local conjugacy of real tori), §5.8
(1494), §7.0i (1877–1879: `TauCeti.Shimura.abelian_absolute_hodge`); MotivesAndAlgebraicCycles §6.8 (1228:
torsor, twist, no rational point); AbelianSchemesAndArithmeticModuli §A1.3a (793), §A3.7 (1629), §A3.9
(1684, rational inverse), §A4.1 (1822, `dualPairing`), §A5.1 (2511), §A5.7 (2720, with its coprimality
hypothesis), §A6.11 (3026), §A6.21 (3344); PELModuli §M3.1 (2781), §M3.2 `hasseCases` (A) (2843–2845);
AutomorphicBundles §1.1 (S03); GroupSchemesOverABase GS8.2 (534); LanglandsParameterStacks §4.26 (S04);
Chebotarev Layer 10 (Completed, line 410, `hasDirichletDensity_frobeniusPrimeSet`); GlobalNumberFields
Layer 1 (Completed, line 259, `weakApproximation_denseRange`); ReductiveGroups Layers 0 (descent, line
170–172), 1 (closed immersions, 191–201), 2 (227), 3 (234), 4 (432), 6 (466), 7 (627–629: conjugacy of Borels
and maximal tori), 8 (1023–1057, S06), 10B (1759), 11C (2057); ReductiveGroupsPartII §§RG2.0.1 (463),
RG2.0.2 (590, inverse function theorem, no regular-centralizer openness, so that gap is minimal),
RG2.0a.1–RG2.0a.3 (963, 1128 with `Res(G′)(R)≅G′(k′⊗R)`, 1379), RG2.1.1 (1467), RG2.1.5 (2446), RG2.3.3
(4151; *compact-elements-in-hyperspecial-subgroups* 4477, *fixer-versus-parahoric* 4353), RG2.3.4 (4530),
RG2.5.1 (6724). The two Lean names the resolver flagged (`Neat.IsNeatAut`, `abelian_absolute_hodge`) are
roadmap-declared names of AdelicAlgebraicGroups §4.3 and ShimuraVarieties §7.0i, not library names: false
positives.

**Pinned declarations read (22):** the Tau Ceti ones in the declaration table plus
`tensorProduct_map_comp_conjugationAlgHom` (`Hopf/Conjugation.lean:136`), `FGComoduleCat`
(`Finite/Basic.lean:96`), `FiniteTypeCommHopfAlgCat` (`FiniteType/CommHopfAlgCat.lean:70`, `CoeSort` :77),
`exists_finite_subcomodule_exteriorPower_line_stabilizer` (`ExteriorStabilizer/Character.lean:101`),
`hasDirichletDensity_frobeniusPrimeSet` (`Chebotarev.lean:51`), `infinite_frobeniusPrimeSet` (:74),
`hasDirichletDensity_iff_of_finite_symmDiff_frobeniusPrimeSet` (:83), `weakApproximation_denseRange`
(`Weak.lean:204`); Mathlib `productMap` (`TensorProduct/Maps.lean:804`),
`sum_card_fixedBy_eq_card_orbits_mul_card_group` (`GroupAction/Quotient.lean:267`), `IsConj`
(`Group/Conj.lean:32`), `AlgebraicGeometry.IsReduced` (`Properties.lean:68`), `Scheme.IsSeparated`
(`Morphisms/Separated.lean:331`), `IrreducibleSpace` (`Topology/Irreducible.lean:170`), `ℚ_[p]`
(`PadicNumbers.lean:536`), `InfinitePlace.Completion` and `adicCompletion` (used as field instances at
`Completion/InfinitePlace.lean:106`, `AdicValuation.lean:633`), `→ₐc[R]` (`Bialgebra/Hom.lean:25`).

**Gaps.** The five declared gaps are precise, minimal and declared identically in `plan.json` and the README
(same slugs, same `needs`): RG2.0.2 on main has no regular-centralizer openness; RG2.3.4 on main treats
central surjections only; EndoscopicTransfer §1.2(b) lacks the compatibility with the sum of local maps,
§1.6 lacks Kottwitz82 Corollary 2.2, §1.15 is stated with `γ₀∈G(F)`. None is raised.

**Policy.** The pull request changes only `packages/ReductiveGroupsPartIII/` (README, Suggested.lean,
metadata, sources, the `gaps` of `design/plan.json`, two reports). No `lemma` keyword (the word occurs only
as "Jordan's lemma"), no pull-request number, no process narrative, no `set_option`, no algorithm; every
target has a locator; each definition has at least three discriminating Checks (§0.1: 4, §0.2: 7, §0.7: 4,
§3.1: 4, §3.2: 4, §3.3: 4, §3.4: 4, §3.5: 5); `sources.toml` has one key per work, `Noot09` and
`Kottwitz82` waived, no local path. The headline list of the README agrees with the module docstring;
of the seven stated declarations, two restate a supplier's target (S01) and the rest are headlines or
the one definition they need; no example, boundary case or one-tactic statement is in the file.

## Not verifiable

- Elaboration of `Suggested.lean` at the new pin: no Lean command is given to this pass, and the worker's
  signature extraction failed on a missing Tau Ceti build object (`…/Representation/Se…`), not on the
  file; the binder-by-binder reading above stands in for it. The round-1 repair reports six `sorry`
  warnings and no error, at a pin it does not name.
- Kottwitz82 Corollary 2.2 and Noot09 §1.5, Theorem 2.4, Lemmas 2.5–2.6, §3: waived; cited by locator.
- Langlands, Lemma 7.15 (torus-transfer obstruction) and Harder 1966, Lemma 5.5.3: not in the manifest;
  read through LR87 Lemma 5.6 and Borovoi98 Lemma 5.6.3, which cite them.
- §4.6 for CM fields without an imaginary quadratic subfield: KMPS22 lines 1647–1651 assert it "by the
  proof of" Shin's lemma; Shin's displayed parity (lines 717–719) and the `F⁺=ℚ` case were checked, the
  general permutation computation was not.
- "BunGAndNewtonStrata consumes the global elliptic tori of §2.3": BunGAndNewtonStrata at its head
  does not cite this roadmap (its §1.6 is the local statement over a nonarchimedean field); the claim is
  about a future consumer and is not a dependency.
- Ownership against open pull requests not carried by the roadmap index (if any) was not checked; the
  index of 449 pull requests and main were searched by object (conjugacy quotient, `O(H)^H`, `H//H`,
  class functions, Harder, Serre condition, `l`-unit, Weil point, `ker¹(ℚ,G)`, independence of `ℓ`,
  Mumford–Tate-valued representation), which is how S01 and S02 were found.

## Source issues

- **Error** in KZ25 at §5.1.3, printed p.47 (lines 2094–2096): the source says the `F`-points of `Conj_H` are the semisimple `H(F)`-conjugacy classes for every field `F` of characteristic zero; it should say for `F` algebraically closed (trace-zero elements of `SL₂(ℚ)` give one point and two classes); affects nothing.
- **Misprint** in KZ25 at §6.1.1, printed p.55 (lines 2447–2448): the source says `H¹_B(A(ℂ),ℚ)` has Hodge types `(0,−1),(−1,0)`; it should be `(1,0),(0,1)`, the stated types being those of `H₁`; affects nothing once the convention is fixed.
- **Misprint** in KZ25 at Lemma 6.2.6(2) proof, printed p.58 (lines 2603–2609): the source says `h⁻¹gh=g` and then `h₁gh₁⁻¹=g′`; it should read `h⁻¹gh=g′` with one orientation; affects nothing.
- **Gap** in KZ25 at Lemma 6.3.3 proof, printed p.60 (lines 2683–2685): the source says any lift `γ̃₁∈G(ℂ)` has eigenvalues of absolute value one and lies in a maximal compact subgroup; it should take a semisimple lift, a unipotent one having unbounded powers; affects the proof, not the statement.
- **Error** in KMPS22 at §2.2.3, printed p.25 (lines 1126–1128): the source says an `l`-unit is bounded at every place `v∤l`; it should say every finite place, since `l∈G_m(ℚ)` is an `l`-Weil point and unbounded at `∞`; affects a stated result (Lemma 2.2.4 as printed).
- **Error** in KMPS22 at Lemma 2.2.11, printed p.29 (lines 1323–1331): the source says an irreducible finite-type scheme with a dense set of rational points suffices; it should add reduced and separated (`Spec k[ε]/ε²` with `ε↦2ε`; the affine line with doubled origin); affects a stated result.
- **Error** in KMPS22 at Proposition 2.2.13 proof, printed p.29 (lines 1345–1347): the source says the connected centralizer of a semisimple element is a Levi subgroup; it should say a connected reductive subgroup of full rank (`diag(−1,1,−1,1)∈Sp₄` has centralizer `SL₂×SL₂`); affects the proof only.
- **Misprint** in KMPS22 at Remark 2.3.16(2), printed p.36 (lines 1653–1655): the source says two points of `G(k)` have the same image in `Conj′(G)` iff they are `G′(k)`-conjugate; it should say two semisimple points; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4fa694139d380577a96a547253c9f45e566b629b", "job": "RT-ReductiveGroupsPartIII~2b", "model": "fable", "worker": "chris-x10"} -->

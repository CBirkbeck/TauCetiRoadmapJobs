# Review of SatoTateGroups (pull request #1725 at bdf1332)

**Verdict:** needs changes

Source ids used below (worker cache, line-numbered texts): `FKRS12` = Fité–Kedlaya–Rotger–Sutherland, arXiv 1110.6638v2 (cache d5e70f9e); `FKS23` = Fité–Kedlaya–Sutherland, arXiv 2106.13759v5 (cache 3130e9d0); `SUT19` = Sutherland, arXiv 1604.01256v6 (cache df0f036c); `BK15` = Banaszak–Kedlaya, arXiv 1109.4449v2 (cache 7e1d038d); `MZ99` = Moonen–Zarhin, arXiv math/9901113v2 (cache 66de41ca); `SerreNX` = Serre, *Lectures on N_X(p)* (Collège de France copy, cache bdba7daa).

## R01 (P1) — Supply cycle with AdelicImagesAndModularCurves

Location: `TauCetiRoadmap/SatoTateGroups/README.md` line 238 ("Serre's open image theorem … (`AdelicImagesAndModularCurves`)") and line 1563 (9.9: "Serre's open image theorem (`AdelicImagesAndModularCurves`) gives `G_ℓ^{1,Zar} = SL_2`"), with line 1593 in 9.9's *Rests on* line.

Claim: AdelicImagesAndModularCurves is a supplier of 9.9.

Witness: AdelicImagesAndModularCurves at its head (#1727), README line 1885: `*Needs:* 7.1; AGR §§6, 7.5, Layer 7; JC; HyperellipticCurves; SatoTateGroups.` and lines 1948–1949 ("Endomorphism algebras and Sato–Tate groups (`USp(4)` as the hypothesis of 7.2): `SatoTateGroups`"). Each roadmap names the other as supplier. The dependency check on this README reports nothing only because its edges are written as `*Rests on:*` (R09); on a scratch copy with those lines spelled `*Needs:*` it prints `CYCLE among: AdelicImagesAndModularCurves, SatoTateGroups` (`depcheck: 204 roadmaps, 1618 edges, 1 problem(s)`).

Repair: break the cycle by moving ownership of the only thing 9.9 takes from the sibling. `ST(E) = SU(2)` for non-CM `E` does not need the open image theorem: Faltings (already consumed in 9.1) gives `End(E_k̄) ⊗ ℚ_ℓ = End_{G_L}(V_ℓ)` for every finite `L/k`, so `V_ℓ` is absolutely irreducible on every open subgroup, hence `(G_ℓ^{1,Zar})⁰` is a connected reductive subgroup of `SL_2` acting irreducibly with a Hodge circle: `SL_2` itself (a torus is excluded by irreducibility of the restriction to the connected component, the trivial group by the Hodge circle). State this as the route of 9.9, delete `AdelicImagesAndModularCurves` from *Consumed, not redefined* and from 9.9's dependency line, and list it under *Downstream consumers* (it consumes `USp(4)` for its 7.2). Re-run the dependency check with `*Needs:*` lines (R09) and show no CYCLE line.

## R02 (P1) — `endField (A × B) = endField A · endField B` is false; the roadmap's own worked example refutes it

Location: `README.md` line 1265 (8.2): "`endField (A × B) = endField A · endField B`".

Claim: the endomorphism field of a product is the compositum of the factors' endomorphism fields.

Witness: `README.md` line 1879 (worked examples, products table): `11.a × 11.a^{(d)}` with `d` a non-square has `Gal(K/ℚ) = C_2`, while `endField 11.a = endField 11.a^{(d)} = ℚ` (both non-CM, 8.2's elliptic clause). Computed: `End(E_ℚ̄) = ℤ = End(E^{(d)}_ℚ̄)` so both factors have `K = ℚ`, but `Hom(E_ℚ̄, E^{(d)}_ℚ̄) ∋` the twisting isomorphism, defined over `ℚ(√d)` and not over `ℚ`, so `K(E × E^{(d)}) = ℚ(√d)`. A worked example of this roadmap refutes a theorem of 8.2.

Repair: replace the equality by `endField (A × B) ⊇ endField A · endField B`, with equality iff `Hom(A_k̄, B_k̄)` is defined over that compositum (equivalently `endField (A × B)` is the fixed field of the kernel of the action on `End(A_k̄) ⊕ End(B_k̄) ⊕ Hom(A_k̄, B_k̄) ⊕ Hom(B_k̄, A_k̄)`), and add the quadratic twist `E × E^{(d)}` as a negative-control Check of 8.2 (tested on the instance above: `K = ℚ(√d) ⊋ ℚ`).

## R03 (P1) — The push gate fails its build check

Location: `TauCetiRoadmap/SatoTateGroups/Suggested.lean` line 1 (`import Mathlib`).

Claim: the gate passes.

Witness: the worker's gate at bdf1332 reports `build=1 FAIL` with the single line "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". Elaboration itself is clean: `lake env lean` on a scratch copy of the file reports only `declaration uses 'sorry'` warnings (see *Verified sound*). The gate's build counter is nonetheless authoritative for acceptance.

Repair: prepend the line `module` before `import Mathlib` (the form `module` + the existing plain `import` lines builds clean and passes the gate; `TypeAHeckeAlgebras/Suggested.lean` on main uses the module form).

## R04 (P2) — Supplier declarations cited by name that do not exist where they are cited

Location: `README.md` lines 198–202, 209–210, 193–194, 928, 1237, 1569, 1716, 1272, 1283, 1372, 1590.

Claim: the named declarations exist in the cited roadmaps.

Witness, checked at the heads the brief gives:

- *Modularity and Langlands extensions* (#1180 at e3a0748): its `Suggested.lean` declares only `satoTate_elliptic`, `goodReductionPrimes`, `frobeniusAngle` (namespace `TauCetiRoadmap.ModularityAndLanglandsExtensions.SymmetricPower`); its README §4.39 describes the determinant kernel `{g ∈ U₂ : det(g)^a = 1}` in prose ("Construct the determinant kernel on `Matrix.unitaryGroup (Fin 2) ℂ` …") and names no Lean declaration; §4.42 names none. `TauCeti.SymmetricPower.SatoTateGroup`, `SatoTateGroup.isCompact`, `orderOne`, `orderZero`, `satoTateClass`, `bianchi_satoTate` occur nowhere in that roadmap and nowhere in Tau Ceti at the pin (grep of `TauCeti/` for `SatoTateGroup`, `satoTateClass`, `bianchi_satoTate`: no file). 5.5 (line 928) says `SU(2)[C_n]` "is not redeclared; prove here, against that declaration's membership law": there is no declaration to prove against.
- *Complex multiplication and explicit reciprocity* (#1254 at 615f9de), Layer 4, 4.1: its targets are the bold paragraphs "The algebraic Hecke character of a CM abelian variety", "One-dimensional CM components of the Tate module", "Frobenius and infinity-type identities"; `cmHeckeCharacter`, `cmTateComponents`, `cmFrobeniusIdentities` occur nowhere in it.
- *Abelian varieties of GL₂-type* (#1036 at bf5759f): names `End0`, `IsSimpleOverQ`, `totallyRealOrCm` (§1.5), `IsGeometricQCurve` (§5.1); `GL2Type.endField`, `endField_finrank`, `totally-real-or-cm`, `EllipticCurve.IsQCurve` occur nowhere in it.
- *Abelian schemes and arithmetic moduli* (#849 at e77dd51): A6.3 is `abelianImage` (scheme-theoretic images of homomorphisms), not the injectivity of `End A → End (A_k̄)` cited for it at line 1237.

Repair: cite by section and target title (the brief's rule), not by invented names: MLE §4.39 "the determinant kernel on `U(2)` and its class `[π_v]`" and §4.42; CM 4.1's three titled targets; GL₂-type §1.5 `totallyRealOrCm` and §5.1 `IsGeometricQCurve` (or drop the ℚ-curve sentence, which carries no mathematics); for injectivity of base change cite A6.2 (faithfulness on Tate modules) or state it as part of 8.1. In 5.5, either consume MLE §4.39's target as the carrier of `SU(2)[C_n]` by section, or own a definition `{g ∈ U 2 | det g ^ n = 1}` here and say in *Scope* why the two do not collide (MLE's is the Sato–Tate group of a representation; this roadmap's Layer 5 object is a closed subgroup of `U(2)` with its statistics).

## R05 (P2) — Three Lean statements are false at `d = 0` through the junk value `(1 : Fin (d+1))`

Location: `Suggested.lean` line 535 (`traceMoment_eq_aMoment_one`), line 685 (`aMoment_one_prodClosed`), line 400 (`traceLaw_eq_map_coeffLaw`).

Claim: `traceMoment G m = aMoment G 1 m` (odd weight, Hodge condition); `aMoment (prodClosed G₁ G₂) 1 m = ∑ C(m,j) aMoment G₁ 1 j · aMoment G₂ 1 (m−j)`; `traceLaw G = (coeffLaw G).map (fun a => −a 1)`.

Witness: `aMoment` takes `i : Fin (d+1)`, and `(1 : Fin (0 + 1)) = 0` (probe: `example : (1 : Fin (0+1)) = 0 := rfl` elaborates). Instances computed:
- `d = 0`, `G = ⊤ ≤ U 0`, `H : HodgeNumbers 1 0` with `h = 0`: the trivial homomorphism is a Hodge circle (both sides of `charpoly_eq` are `1`) and the Hodge condition holds; `traceMoment G 1 = ∫ 0 = 0` but `aMoment G 1 1 = aMoment G 0 1 = E[a_0] = 1`.
- `g₁ = g₂ = 0`, `m = 1`: left side `aMoment _ 0 1 = 1`, right side `1·1·1 + 1·1·1 = 2`. (For `g₁ = 0`, `g₂ = 1`, `G₂ = su2`, `m = 1`: left side `0`, right side `aMoment su2 1 1 + aMoment su2 1 0 = 0 + 1 = 1`.)
- `d = 0`: `traceLaw G = δ_0` (empty trace), `(coeffLaw G).map (fun a => −a 1) = δ_{−1}`.

Repair: index `aMoment` by `i : ℕ` as `coeff` already is (`aMoment G i m := ∫ g, coeff (g : U d) i ^ m ∂haar G`, with `aMoment_eq_coeffMoment` for `i ≤ d` if wanted), and state `traceLaw_eq_map_coeffLaw` as `traceLaw G = (haar G).map (fun g => −coeff (g : U d) 1)` or add `(hd : 0 < d)`. Tested on the instances above: with `i : ℕ`, `aMoment G 1 1 = ∫ coeff g 1 = 0` at `d = 0`, and the binomial law reads `0 = 0`.

## R06 (P2) — Two rows of FKRS Table 6 are wrong and the README copies them into the engine of 6.7 and into a worked example

Location: `README.md` 6.7 ("For the split `G⁰`, the component laws are the rows of FKRS Table 6 (`a_1 ∈ {a + a', a, 0}`, …)") and line 1883 ("Table 6: on `aG_{1,3}`, `a_1 = a_{1,U(1)}`").

Claim: on the non-identity component of `N(U(1) × SU(2))`, `a_1` has the law of `a_{1,U(1)}`; on `(ac)² G_{1,1}`, `a_1` has the law of `a_{1,U(1)}`.

Witness: `FKRS12` lines 2049–2050 (Table 6: `aG_{1,3}`: `a_{1,U(1)}`, `2`) and 2045 (`aG_{1,1}, bG_{1,1}, (ac)²G_{1,1}`: `a_{1,U(1)}`, `2`). Computed in the split coordinates of `FKRS12` lines 895–909: `a = diag(J_2, I_2)` acts on the `U(1)` factor, so an element of `aG_{1,3}` is `(J_2 · diag(u, ū)) ⊕ B` with `B ∈ SU(2)`; `J_2 diag(u, ū)` has trace `0` and characteristic polynomial `T² + 1`, so `a_1 = a_{1,SU(2)}(B)` and `a_2 = 2`. Table 9 (`FKRS12` line 2563) confirms: `N(G_{1,3})`: `½(c_n b_{n+2}/2 + c_n)`, whose second summand is the `SU(2)` moment; with the `U(1)` law the second moment of `N(G_{1,3})` would be `½(3 + 2) = 5/2`, not the integer `2` of Table 8 (line 2504), contradicting rationality. For `(ac)²`: `ac = [[0, J_2], [−I, 0]]`, `(ac)² = diag(−J_2, −J_2) = −ab ∈ ab·G⁰`, so `(ac)²G_{1,1} = abG_{1,1}` has law `(0, 2)` (line 2046); Table 8's `z_1 = 3` for `F_{ac}` (line 2499) needs `a_1 ≡ 0` on all three non-identity cosets. The README's sentence at line 1883 asserts the false law and then uses the value `1 = E[a_{1,SU(2)}²]`.

Repair: in 6.7 state the split-component laws explicitly rather than "the rows of Table 6": `aG_{1,3}`: `(a_{1,SU(2)}, 2)`; `aG_{1,1}, bG_{1,1}`: `(a_{1,U(1)}, 2)`; `abG_{1,1} = (ac)²G_{1,1}`: `(0, 2)`; `cG_{1,1}`: `(0, a_{1,U(1)})`; `acG_{1,1}, (ac)³G_{1,1}`: `(0, 0)`; `JG_{3,3}`: `(0, a_{1,SU(2)})`; and rewrite line 1883 as `E[a_1²] = ½·3 + ½·1 = 2` with "on `aG_{1,3}`, `a_1 = a_{1,SU(2)}`", deleting the false start "`½(2 + 1) + ½·1`…". Record the errata (see *Source issues*).

## R07 (P2) — Statable headline theorems absent from `Suggested.lean`

Location: `Suggested.lean` module docstring lines 16–28; `README.md` 6.6, 6.8, 10.2, 10.4.

Claim: the fifty-five groups and the degree-4 classification "need objects that neither Mathlib nor Tau Ceti has, or the stored tables of FKRS"; Serre's criterion and Hecke equidistribution are not mentioned either way.

Witness: the roadmap's headline (its opening paragraph: "proves the classification of the fifty-five groups in degree 4") is FKRS Theorem 3.4 (`FKRS12` line 635). Its carrier is `degree4Group : Fin 55 → ClosedSubgroup (U 4)`, each group the closure of the subgroup generated by one of the six connected groups already declared (`degree4Connected`) and at most three explicit matrices of 6.3 (`ζ_n = diag(e^{πi/n}, e^{−πi/n})` and `j` in the quaternion embedding, `J`, the scalars `e^{πi/n}`, `a`, `b`, `c`, `diag(J_2, I_2)`, `J'`, two generators of `2T`, one of `2O ∖ 2T`): a few dozen distinct `4 × 4` matrices over `Complex.exp`, no stored table. The stored tables enter only the certificate 6.7, the lattice 6.9 and 7.4. Serre's criterion 10.2 is statable at the pins (`IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`, a bijection `ℕ ≃ primes` with nondecreasing norm, `ConjClasses` of the closed subgroup with `conjLaw`, Tau Ceti's continuous finite-dimensional representations and characters, the Euler product as `∏'`, the continuation hypothesis as `∃ F, DifferentiableOn ℂ F {s | 1 ≤ s.re} ∧ …`), and the docstring neither states it nor names it.

Repair: add the generator table and `degree4Group`, state `degree4_classification` (`IsSatoTateGroup (weightOne 2) G → ∃ i, IsConjIn (USp 4) G.toSubgroup (degree4Group i).toSubgroup`) and `degree4_pairwise_not_conj`; state `serre_equidistribution_criterion` for a closed `G ≤ U d` and a sequence of classes indexed by the primes of a number field ordered by norm, or, if the author judges the Euler-product carrier too heavy for the acceptance test, say so in the docstring for 10.2 and 10.4 naming the missing carrier. The docstring's reason for 6.3/6.6/6.8 must in any case stop invoking stored tables.

## R08 (P3) — Dependency lines in a form the dependency check does not read; two deferrals listed as suppliers

Location: every `*Rests on:*` line (e.g. `README.md` 0.1–10.8); *Consumed, not redefined* lines 238–240 (`ArtinRepresentations`, `HyperellipticCurves`).

Witness: `gate --depcheck … --movable` on this README: `depcheck: 204 roadmaps, 1615 edges, 0 problem(s)`; on a scratch copy with `*Rests on:*` replaced by `*Needs:*`: `1618 edges, 1 problem(s)` (the cycle of R01). The README shape requires `*Needs:*`. No milestone's dependency line names `HyperellipticCurves` (merge order line 370, after this roadmap at 255) or `ArtinRepresentations` (not in the order); both READMEs treat this roadmap as the owner of the Sato–Tate objects (HyperellipticCurves at #1707 lines 114–116, ArtinRepresentations at #1711 lines 238–241), so these are scope deferrals, not supplies.

Repair: rename `*Rests on:*` to `*Needs:*` throughout; move the `ArtinRepresentations` and `HyperellipticCurves` bullets from *Consumed, not redefined* to *Not owned here* (they already appear there at lines 263–265 and 1801) and list both under *Downstream consumers*.

## R09 (P3) — Padding: `Suggested.lean` is an API catalogue

Location: `Suggested.lean`, 157 declarations.

Witness (one-tactic probe on a scratch copy): `bSeq_two_mul` (line 749) closes by `simp [bSeq, cSeq, Nat.centralBinom, catalan_eq_centralBinom_div]`; `mem_USp_iff` (line 136) is `Iff.rfl`; `coeff_one_eq_neg_trace` (line 222) is one library lemma. Declarations that restate definitions, compute small values or mirror README Checks: `coeff_zero`, `coeff_eq_zero_of_lt`, `coeff_degree`, `coeff_im_eq_zero_of_mem_USp`, `coeff_sub_of_mem_USp`, `charpolyRev_reverse_of_mem_Od`, `det_eq_one_of_mem_USp`, `uSpTorus_le_USp`, `even_degree`, `realDimension_USp`, `realDimension_Od`, `realDimension_uSp4`, `realDimension_degree4Connected`, `realDimension_degree6Connected`, `lieAlgebra_identityComponent`, `realDimension_eq_zero_iff`, `componentMeasure_coset`, `haar_eq_sum_componentMeasure`, `isProbabilityMeasure_coeffLaw`, `traceLaw_eq_map_coeffLaw`, `charpolyRev_blockProd`, `charpolyRev_su2DiagHom`, `blockProd_mem_USp`, `degree2_invariants`, `traceMoment_su2`, `traceMoment_u1`, `traceMoment_nu1`, `traceZeroDensity_degree2`, `nu1Mu_one`, `nu1Mu_invariants`, `mu_invariants`, `isMulCommutative_componentGroup_nu1Mu`, `isProbabilityMeasure_semicircleAngle`, `continuous_coeff`, `coeff_conj`; carriers no stated theorem uses: `STRecord`, `IsGeneratingSet`, `HasRealPlaceCondition`, `RealEndTypeSurface`, `GeomEndAlgSurface`, `EndAlgSurfaceQ`, `GaloisEndType` and `GaloisEndType.IsIsomorphic`.

Repair: delete them from `Suggested.lean` (the README keeps each as a target or Check); keep the headline set: `weyl_integration_USp`, `exists_conj_mem_uSpTorus`, `isConj_USp_iff_charpolyRev_eq`, `isOpen_identityComponent`/`finite_componentGroup`, `exp_smul_add_mem`, `not_hodgeCondition_of_finite`, `neg_one_mem_identityComponent`, `exists_int_integral_prod_coeff`, `isRational_of_connectedSpace`, `traceMoment_eq_aMoment_one`, `coeffMoment_eq_zero_of_odd`, `componentProb_eq_zero_or_one`, `componentProb_eq_one_iff`, `coeffProb_eq_zCount_div`, `aMoment_one_prodClosed`, `aMoment_one_uSp4`, `aMoment_two_uSp4`, `isSatoTateGroup_degree2`, `degree2_classification`, `degree4_identityComponent`, `finite_satoTateGroups`, `degree6_identityComponent`, `realGeomEnd_surface`, `tendsto_empiricalMeasure_semicircleAngle_iff`, `map_haar_uSpTwoEquivSU2`, plus the definitions these need and the additions of R07. The seven proved `example` bridge checks are at the limit of "a handful".

## R10 (P3) — 3.3: an "iff" whose "pairwise inequivalent" clause does not follow

Location: `README.md` line 716.

Claim: `E[χ_i²] = 1` for all `i` iff the restrictions to `G` are irreducible and pairwise inequivalent.

Witness: `G = SO(3) ≤ O(3)` (even weight, `d = 3`): the irreducibles `std` and `std ⊗ det` of `O(3)` restrict to the same irreducible of `SO(3)`, so `E[χ²] = 1` for both while they are equivalent on `G`. Computed: `E[χ_std χ_{std⊗det}] = 1 ≠ 0`.

Repair: "`E[χ_i²] = 1` iff the restriction of `V_i` is irreducible; the restrictions are pairwise inequivalent iff moreover `E[χ_i χ_j] = 0` for `i ≠ j`".

## R11 (P3) — 5.6: the `counts` of `μ(n)` for odd `n` are stated for the trace, against the pinned convention

Location: `README.md` line 965.

Claim: `counts = [(1, 1)]` for odd `n`.

Witness: *Pinned conventions*: `counts` are pairs `(x, zCount G i x)` with `a_i ≡ x`; on the identity component `{1}` of `μ(n)`, `a_1 = −trace = −1`. Computed for `n = 1`: `a_1 ≡ −1`, so `counts = [(−1, 1)]`; the same section's `(convention)` Check for `μ(1)` already distinguishes the trace row from the `a_1` row.

Repair: write `[(−1, 1)]` for odd `n` and `[(1, 1), (−1, 1)]` for even `n` (or state that the stored `counts` of weight `0` are trace counts, if that is the convention meant, and say so in *Pinned conventions*).

## R12 (P3) — Locators: the Mumford–Tate conjecture for `g ≤ 3` is not in Moonen–Zarhin; `FKS18` is cited but absent from the references

Location: `README.md` lines 1605 and 1053, 1929; the reference list.

Witness: `MZ99` contains no statement of the Mumford–Tate conjecture (the string occurs only in its bibliography entry for Pink, `MZ99` line 889); its Theorem 0.1 (`MZ99` lines 30–67) computes the Hodge group, which is exactly what `BK15` Theorem 6.10 uses for condition 1 (`BK15` lines 562–564). `BK15` lines 565–577 obtain the Mumford–Tate conjecture (condition 2) from Serre's open image theorem (`g = 1`), Chi's concluding remark (simple of prime dimension), Imai (products of elliptic curves) and its Lemma 6.9 (`E × B`). "FKS18, Remark 2.3" (6.4 and the boundary checks) is the reference `FKS23` line 618 cites for excluding `U(2)`; the README's reference list has no `FKS18` entry (Sutherland's [26] is Fité–Kedlaya–Sutherland, *Sato–Tate groups of some weight 3 motives*, Contemp. Math. 663, 2016, `SUT19` line 1924).

Repair: in 9.10 cite Moonen–Zarhin Theorem 0.1 for `Hg(A) = L(A)` only and Banaszak–Kedlaya Theorem 6.10 (with Serre, Chi, Imai as there) for the Mumford–Tate conjecture; add the `FKS18` entry to the references.

## R13 (P3) — 10.2's converse lacks its meromorphy hypothesis; 9.5 overstates "unconditional"

Location: `README.md` line 1669; line 1485.

Witness: `SUT19` lines 758–761 (Theorem 2.12): the equivalence assumes `L(ρ, s)` meromorphic on `Re s ≥ 1` with no zeros or poles except possibly at `s = 1` for every irreducible `ρ`; without it "equidistribution implies nonvanishing" has no content. `SUT19` lines 1346–1349 (Theorem 3.12) give unconditionally a field `L` with `ST(A_L)` connected and `Gal(L/k) ≅ ST(A)/ST(A)⁰`; that `L` is the endomorphism field `K` is Remark 4.13 (`SUT19` lines 1546–1547), for `g ≤ 3` or under `AST = TL`.

Repair: state the converse under the meromorphy hypothesis; in 9.5 write "the field over which `ST` becomes connected exists unconditionally (Sutherland Theorem 3.12) and equals `K` when `AST(A) = TL(A)`".

## R14 (P3) — `lieAlgebra` is defined on every subgroup while 1.3 and its route are for closed subgroups

Location: `Suggested.lean` lines 329–346; `README.md` 1.3.

Witness: the `def` takes `G : Subgroup (U d)` and its `add_mem'` is `exp_smul_add_mem`, whose docstring invokes Yamabe's theorem for non-closed `G`; 1.3 routes closure under addition through the closed-subgroup theorem (LieGroups Layer 2), which that roadmap states for closed `H` (its "lieSubalgebraOfSubgroup H" paragraph claims a Lie subalgebra for any subgroup, so the general statement has an owner there, but 1.3 does not cite it in that generality). README generality (closed) ≠ Lean generality (any subgroup).

Repair: either define `lieAlgebra` on `ClosedSubgroup (U d)` (and `realDimension` with it, using `uSpClosed` in the dimension statements), or keep the general carrier and cite LieGroups Layer 2's any-subgroup statement in 1.3 and in the docstring instead of Yamabe.

## Verified sound

**Gate and build.** The worker's gate at bdf1332: every text scanner `0`, `depcheck=0`, `build=1` (the `module` advisory only, R03). `lake env lean` on a scratch copy of `Suggested.lean` (with review probes appended): only `declaration uses 'sorry'` warnings from the roadmap's own declarations; the probes behaved as reported in R05 and R09. The pinned Tau Ceti is 358314d4 in both the worktree manifest and the content checkout's manifest (no second pin to reconcile). No `set_option`, no sorry'd data (`sorry` occurs only in `theorem`s), `import Mathlib` plus eleven existing `TauCeti.*` modules, no `lemma`.

**Dependency check.** `gate --depcheck README.md --name SatoTateGroups --order merge-order-candidate.txt --movable --content <content>`: `depcheck: 204 roadmaps, 1615 edges, 0 problem(s)`. With `*Rests on:*` → `*Needs:*` on a scratch copy: `CYCLE among: AdelicImagesAndModularCurves, SatoTateGroups`, `1618 edges, 1 problem(s)` (R01). Merge order: SatoTateGroups at line 255, directly after ProbabilisticAndMetricNumberTheory (254); every other open-PR supplier cited is earlier (AbelianSchemesAndArithmeticModuli 40, NeronModels 46, MotivesAndAlgebraicCycles 69, DeligneWeightsAndPurity 75, PELModuli 101, Faltings 142, ComplexMultiplication 150, GL₂-type 154, ModularityAndLanglandsExtensions 178); LFunctions, ReductiveGroups, EllipticCurves, ModularForms, JacobianChallenge, the RepresentationTheory roadmaps are on main; Chebotarev, ArithmeticDirichletSeries, NumberFieldArithmetic, GlobalNumberFields are completed. FiniteGroupInvariants (#1708), AdelicImagesAndModularCurves (#1727), ArtinRepresentations (#1711) are not in the order (checked as placed after their last supplier); FiniteGroupInvariants names this roadmap only as its consumer (its README line 1061).

**Cross-roadmap citations resolved (found as cited).** PMNT §2.1 at #1421: `AsympEquidistributed` (README 2227, Lean 196), `asympEquidistributed_iff_integral_tendsto` (2280), `_complex` (2294), `asympEquidistributed_comp_add_iff` (2308), `AsympEquidistributed.unique` (2336), `.tendsto_frequency` (2350). FiniteGroupInvariants 10.5 at #1708: `jordanBound` (Lean 681, an `sInf`), `jordan_exists_abelian_normal_index_le` (Lean 686, `[Field F] [CharZero F]`). AbelianSchemes at #849: `simpleEndDivision` (A6.4, 2876), `homFreeFinite` (A6.7, 2939), `endQ_isSemisimple` (A6.8, 2959), `charpolyTate` (A6.11, 3028), `rosatiPositivity` (A6.14, 3066), `rosatiRegularRepresentation`/`realCentralDivisionAlgebra`/`realRosatiDecomposition` (A6.15, 3094–3187), `reducedTraceComparison` (A6.17, 3243), A3.2/A3.5/A3.7/A4.1/A5 headings. PELModuli at #966: `PositiveInvolution.center_classification` (M0.1, line 459), `albertTypes` (M0.2, 496–524, with the definite-quaternion and indefinite-quaternion Checks the README's 8.4–8.5 rely on). GL₂-type at #1036: `End0`, `IsSimpleOverQ` (142), `totallyRealOrCm` (§1.5), GT.1/primitive (§1.2). ModularityAndLanglandsExtensions at #1180: §4.28 (line 2874), §4.34 (2940, `satoTate_elliptic` in its Lean at line 65, with the non-CM hypothesis as surjectivity of `ℤ → Isogeny.Hom` over `ℂ`), §4.39 (3033), §4.42 (3135). LFunctions on main: `Grossencharacter K 𝔪` (Layer 6, line 1106), `unitaryWeight` (1112), `infinityType` (264), the boundary datum `Grossencharacter.exists_continuousOn_logDeriv` (243). CM at #1254: Layer 4, 4.1 titled targets (lines 635–700), stated for a CM field `E ⊂ End⁰_k(A)` with endomorphisms over `k` and reflex field in `k`, which covers 10.5's `k ⊇ F`. DWP at #929: §2.2 (1093), §8.14 (2563, reductive-closure criterion in its API), §10.5 (3246). Chebotarev (completed): `wienerIkehara` consumed in Layer 12 (lines 99, 515), Layer 14 natural density (612). LieGroups on main: Layer 0 (exponential chart), Layer 2 (closed-subgroup theorem and matrix groups), Layer 6 (maximal tori, Weyl group, Weyl integration `|W|⁻¹ ∫_T f |Δ|²`), Layer 9 (Cartan decomposition; "maximal compact subgroups of a complex reductive group" is read from Layer 9's Cartan decomposition — the README should name that paragraph). EllipticCurves on main: `EndOver`, `GeometricEnd`, `HasGeometricCM`, `CMAction` (lines 507–514). Tau Ceti at the pin: every name in *What Tau Ceti supplies* was found by grep in the listed files except the four MLE names of R04; in particular `haarProb` (Compact/Haar.lean 93), `eq_haarProb_of_isHaarMeasure_of_isProbabilityMeasure` (135), `unitaryTorusHom`/`unitaryTorus`/`exists_conj_mem_unitaryTorus` (UnitaryGroup/Torus.lean 60, 85, 111), `SU2.weylElement` (Weyl/Basic.lean 108), `normalizer_torus` (197), `weyl_integration_formula` (Weyl/Integration.lean 146), `Subgroup.connectedComponentOfOne_le_of_isOpen` (Ideles/IdentityComponent.lean), `empiricalMeasure` with `integral_empiricalMeasure`, `empiricalMeasure_apply_toReal` (Probability/Process/EmpiricalMeasure.lean), `HeckeRing.GL2.Newform.satakeParameters` (ModularForms/Newforms/Satake.lean 82). Mathlib at the pin: `Matrix.coeff_charpolyRev_eq_neg_trace` (Charpoly/Coeff.lean 334), `finProdFinEquiv` `(i, j) ↦ j + n·i` (Logic/Equiv/Fin/Basic.lean 330, so `su2DiagHom` is `[[aI, bI], [cI, dI]]` as pinned), no `TopologicalSpace (ConjClasses _)` instance (the roadmap's instances do not collide).

**Duplication by object.** No Hodge circle, Sato–Tate axiom, coefficient law, identity-component measure or Lie algebra of a matrix subgroup exists in Mathlib or Tau Ceti at the pin (grep for `exp (t •`, `HodgeCircle`, `SatoTate` in Tau Ceti: none); `USp(d)` and `O(d)` as closed subgroups of `U(d)` are new (Mathlib's `symplecticGroup` lives on `l ⊕ l` and `orthogonalGroup` over `ℝ`; 0.2–0.3 state the identifications). Ownership against the open pull requests the brief lists: the only overlaps are the deferrals of R08 and the MLE determinant kernel of R04.

**Seeded sample, at the locators.**

| target | source and locator | result |
|---|---|---|
| 0.1 Haar on closed subgroups | Tau Ceti `haarProb`, uniqueness lemma (Haar.lean 93, 135) | present; the two `example` bridge checks elaborate |
| 0.3 ambient of a weight | `FKRS12` lines 563–568 (Def. 3.1, ST1: `USp(d)` odd weight, `O(d)` even) | matches `ambient` |
| 0.4 coefficient map | `FKRS12` lines 104–108 (normalized L-polynomial), 716 (`T⁴ + a_1T³ + a_2T² + a_1T + 1`); Mathlib `coeff_charpolyRev_eq_neg_trace` | matches; `a_1 = −tr` elaborates |
| 1.2 finiteness of `G/G⁰` | LieGroups Layer 2 (closed-subgroup theorem, matrix groups) | owned as cited |
| 1.4 Haar on components | definitions only; `μ_H(C_H) = c · (1/c) = 1` | consistent |
| 1.5 laws on conjugacy classes | definitions; `conjLaw` elaborates as a `ProbabilityMeasure` | consistent |
| 4.6 degree-4 connected groups | `FKRS12` Table 8 lines 2453, 2485, 2495, 2503, 2505, 2507 | all six moment triples and dimensions `1,3,2,4,6,10` match; recomputed by the binomial/diagonal laws (see table below) |
| 4.7 degree-6 connected groups | `FKS23` Table 9 lines 3998–4013; §3.6 lines 607–662 | the fourteen groups match; dimensions match except FKS's `3` for `SU(2) × U(1)_2` (README's `4` is right: `3 + 1`); `U(1)_2 × SU(2)` vs `U(1) × SU(2)_2` nonconjugate, line 658–659 |
| 6.4 identity component one of six | `FKRS12` lines 684–698 (Lemma 3.7; proof excludes `g_2`, `sl_3` via `SO(5)`); `U(2)` excluded by `FKS23` line 618 citing [FKS18, Rem. 2.3] | matches (R12 for the missing reference) |
| 6.7 engine and certificate | `FKRS12` lines 2027–2056 (Table 6), 2086–2098 (`r^n b_n` on `s = 1`), Table 8 lines 2474, 2504, 2500, 2485, 2490, 2475, Tables 9–10 lines 2533, 2592 | all sample rows match (`J(O)`: `1, 6, 50, 525, 6426`; `1, 3, 7, 26, 96`; `z_2 = (1,0,6,8,9)`; etc.); two Table 6 rows wrong (R06) |
| 7.4 degree 6 as data | `FKS23` lines 89–97 (Thm 1.1: 410, 14 components, 33 maximal, `192, 432, 336`), 1930 (433 candidates), 1959 (Def. 6.2), 657 (`SO(3)`, `SU(3)` fail ST4) | matches; `USp(6)` moments recomputed below |
| 8.1 Galois action, descent | Milne's notes (not fetched); construction only | not checked against the text |
| 8.2 endomorphism field | `FKRS12` lines 165–166, 935 (Prop. 4.1 cites Silverberg); Silverberg Thm 2.4 paywalled | existence and finiteness as cited; one false claim (R02) |
| 8.5 rational types | `FKRS12` lines 1071–1098 (§4.3: over `ℚ` only `D[C_4]`), 1690–1719 (Prop. 4.11), Table 8 (`ℍ` only for `J(C_1)`) | matches |
| 9.10 Banaszak–Kedlaya for `g ≤ 3` | `BK15` lines 558–577 (Thm 6.10), 468–477 (Thm 6.1); `FKRS12` lines 497–501 (Thm 2.16 citing BK 6.1, 6.10); `FKS23` lines 467–490 (Props 3.3, 3.5, Lemma 3.7); `MZ99` lines 30–67 | statement matches; attribution of the Mumford–Tate conjecture wrong (R12) |

Other locators opened: `FKRS12` Remark 3.3 (610–629, finiteness via Jordan, 7.2), Theorem 3.4 and Table 1 (635–653: 32 + 10 + 8 + 2 + 2 + 1 = 55), Remark 3.5 (658–664: the fifteen groups of 6.10), Remark 3.6 (671–678: `Ω`), §3.4 (775–796: `n ∈ {1,2,3,4,6}`), §3.5–3.6 (860–920: `E_n`, `a, b, c`, normalizers), Def. 1.3 (167–173), Def. 2.4 (384–387, Bogomolov), Def. 2.6 (391–395), Lemma 2.8 (398–438), Def. 2.9 (443–449), Defs 2.14–2.15, Props 2.17, 2.19 (485–528), §4.1 types (1007–1025: the 34 ⋆ and the fifty-two/three), Table 11 (2634–2690: every curve of the worked examples with its field), (5.1) and Table 5 (1959–1998); `SerreNX` §8.2.3.2 (4093–4104, Hodge circle eigenvalues `u^{p−q}`), §8.2.3.4 (4126–4132, `γ`), §8.3.4 (4251–4282), §8.4.4.2 (4460–4474: finite level sets, analytic sets of empty interior are null); `SUT19` Def. 4.1 and Remark 4.2 (1394–1414; footnote 19: FKRS's ST2 omitted density), Thm 4.3 (1424), Prop. 4.4 (1429–1441: "ST3 plays no role when g = 1"), Thm 4.6, Remark 4.7, Thm 4.8 (1445–1463), Thm 3.2 (1122–1146), Thm 3.12 (1346–1360), Def. 4.10 and Example 4.11 (1495–1517), Prop. 2.9, Cor. 2.10 (661–686), Thm 2.12 (758–762), Lemma 2.15, Prop. 2.16 (798–824), the `(2n−1)!!` moments (1858–1863).

**Adversarial pass.**

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| 0.2 `Ω d`, `USp 2 = SU(2)` | `d = 2`: `Ω = [[0,1],[−1,0]]`; `d = 1` | `d=2`: `gᵀΩg = det g · Ω` (proved in the file); `d = 1`: `Ω = [1]`, `USp 1 = {±1}` (junk, unused since `even_degree`) | sound | none |
| 0.4 `a_d = (−1)^d det`, palindromy on `USp` | `d = 2`, `g = diag(u, ū)` | `charpolyRev = 1 − (u+ū)T + T²`: `a_2 = 1 = det`; `a_1 = a_1` | sound | none |
| 0.4 `Od` reversal | `d = 1`, `g = −1` | `charpolyRev = 1 + T`, reverse `= T + 1`, `(−1)^1 det = 1` | sound | none |
| 0.5 `uSpTorusFun` | `g = 1`, `u` | `(u, u⁻¹)`; `u⁻¹ = ū` on `Circle` | sound | none |
| 1.3 `lieAlgebra` for any subgroup | `G` non-closed | closure under `+` needs Yamabe; README says closed | generality mismatch | R14 |
| 2.1 `newform k` | `k = 2`: `Fin 2`, `h = (1, 1)`; `k = 1` excluded by `hk` | sum `2` | sound | none |
| 2.2 `IsHodgeCircle`, finite `G` | `G = μ(3)`, `artin 1`: trivial `θ`, `charpoly = X − 1 = (X − u⁰)¹` | Hodge condition holds; `weightOne g`, finite `G`: `θ(u)` would have eigenvalue `u` of infinite order | sound | none |
| 2.5(a) `−1 ∈ G⁰` | `d = 0`, `w = 1`, `h = 0` | `θ(−1) = ()` = `−1` (empty matrix) | sound (vacuous) | none |
| 2.5(c) connected ⇒ rational | `G = U(1) ≤ SU(2)`, `n = (0,2,0)` | `E[a_1²] = 2 = dim (V ⊗ V)^{U(1)}` | sound | none |
| 3.2 `traceMoment = aMoment 1` | `d = 0`, `G = ⊤`, `m = 1` | `0` vs `E[a_0] = 1` | **false at `d = 0`** | R05 |
| 3.3 `E[χ²] = 1` iff irreducible and pairwise inequivalent | `SO(3) ≤ O(3)`, `std`, `std ⊗ det` | both `E[χ²] = 1`, `E[χχ'] = 1` | false clause | R10 |
| 3.5 `coeffProb = zCount / c` | `nu1`, `i = 1`, `x = 0` | `zCount = 1`, `c = 2`, `Pr = 1/2`; `u1`: `0/1 = 0` | sound | none |
| 4.2 Weyl constant | `g = 1`: `(2/π)∫_0^π sin² = 1`; `g = 2`: `(8/π²)·π²/8 = 1`; `g = 3`: numerical mass `1.00000` | — | sound | none |
| 4.3 binomial law | `g₁ = g₂ = 0`, `m = 1` | `1` vs `2` | **false at `g₁ = g₂ = 0`** | R05 |
| 4.3 diagonal copies | `U(1)_2`: `a_1 = 2x`, `a_2 = x² + 2` | `E[a_1^{2,4,6}] = 8, 96, 1280`; `E[a_2^{1,2,3}] = 4, 18, 88` (Table 8 line 2453) | sound | none |
| 4.4 `bSeq`, `cSeq` | `n = 4` | `b_4 = 6`, `c_4 = 6/3 = 2 = catalan 2` | sound (and padding) | R09 |
| 4.5 joint density | `ρ` in angles | `(a_1² − 4a_2 + 8)(a_2 − 2a_1 + 2)(a_2 + 2a_1 + 2) = 64(c_1−c_2)²s_1²s_2²`; Jacobian `8|c_1−c_2|s_1s_2`; density `(2/π²)|c_1−c_2|s_1s_2 = √ρ/(4π²)` | sound | none |
| 4.5 `USp(4)` moments | `n = 2, 4, 6`: `c_nc_{n+4} − c_{n+2}²` | `1·5 − 4 = 1`; `2·14 − 25 = 3`; `5·42 − 196 = 14`; `a_2`: `n = 1, 2` → `1, 2`; numerical `1, 3, 14, 84, 594` and `1, 2, 4, 10, 27` | sound | none |
| 4.6 the six | all rows | `U(1)×U(1)`: `4, 36, 400`/`2, 8, 32`; `U(1)×SU(2)`: `3, 20, 175`/`2, 6, 20`; `SU(2)×SU(2)`: `2, 10, 70`/`2, 5, 14`; `SU(2)_2`: `4, 32, 320`/`3, 10, 37` (by the laws `x + y`, `xy + 2`) | sound | none |
| 4.7 the fourteen | dimensions | `1,3,2,4,4,6,3,5,7,9,11,13,9,21` recomputed as sums of `1, 3, 10, 9, 21` | sound | none |
| 5.1 LMFDB `gens` remark | `[[0,1],[1,0]]` with `U(1)` | reflections `[[0,u],[ū,0]]`: `det = −1`, trace `0` | sound | not verifiable against LMFDB |
| 5.5 `SU(2)[C_n]` moments | `n = 2`, `m = 2` | `(1/2)(1 + ζ^{2·1}) catalan 1 = (1 + (−1))/2 = 0` | sound | none |
| 5.5 `nu1Mu n` | `n = 2`: `JD`, `D = diag(1, ζ)` | `(JD)² = −diag(ζ, ζ) ≡ D²`; orders: `JD` order `n` (`n` even), `2n` (`n` odd); `2n` components; `E[t^m] = ½ C(m, m/2)[2n | m]` | sound | none |
| 5.5 rational iff `n ≤ 2` | `n = 2`, component `D·U(1)` | `a_1 = −(u − ū)`, `E[a_1²] = −2 ∈ ℤ`; `n = 3`: `E[a_2] = ζ_3` | sound | none |
| 5.6 `μ(n)` | `n = 3`: Hodge (trivial), `IsSelfDual 0` fails (`ζ_3 ∉ {±1}`), rational fails (`E[a_1] = −ζ_3`); `counts` odd `n` | `a_1 ≡ −1` on `{1}` | counts mis-stated | R11 |
| 6.1 `SU(2)_2 ∩ U(1)_2` | `diag(A, Ā) = diag(uI, ūI)` | `A = uI ∈ SU(2)` ⇒ `u = ±1` | sound | none |
| 6.3 `E_1 = SU(2)_2` | scalar `e^{πi}` | `= −1 ∈ SU(2)_2` | sound | none |
| 6.3 `C_5` non-example | `r = 2cos(π/5)` | `E[a_1²] = 2r² = 3 + √5`; `E[a_2] = r² = (3+√5)/2` | sound | none |
| 6.5 integrality bound | `n = 3, 4, 6, 5` | `4 + 4cos(2π/n) = 2, 4, 6, 3+√5` | sound | none |
| 6.7 split laws | `aG_{1,3}`, `(ac)²G_{1,1}` | `J_2 diag(u,ū)`: trace `0`, `T² + 1`; `(ac)² = −ab`; `N(G_{1,3})`: `E[a_1²] = ½(3 + 1) = 2` (Table 8), not `½(3 + 2)` | **source rows false** | R06 |
| 6.7 `(G_3, 1, r)` law | `E_1`: `r = 2` | `a_2 = a² + 2`, `E[a_2] = 3` (Table 8); Table 6 prints `a + r² − 2` | README right, source misprint | errata |
| 6.8 distinctness | all pairs with equal `(d, c, z_1, z_2)` in Table 8 | only `E_2` vs `J(E_1)`: `E[a_2] = 1` vs `2` | sound | none |
| 6.9 indices | Table 8 order | `F_c, F_{ab,c}, F_{a,b,c}` at positions 44, 48, 49 (0-based) | sound | none |
| 6.10 fifteen groups | Remark 3.5 | `5 + 4 + 2 + 3 + 1 = 15` | sound | none |
| 7.4 `USp(6)` | numerical Weyl integration | `a_1`: `1, 3, 15, 104, 909`; `a_2`: `1, 2, 5, 16, 62`; `a_3²= 2`, `a_3⁴ = 23`; `N(U(3))`: anti-block elements have `charpoly ∈ ℂ[T²]`, so `a_1 ≡ a_3 ≡ 0` | sound | none |
| 8.2 `endField(A × B)` | `E × E^{(d)}` | `ℚ(√d)` vs `ℚ` | **false** | R02 |
| 8.4 six real types | Table 8 column `End(A)_ℝ` over `K` | `ℍ` only for `J(C_1)` over `k`, never geometrically | sound | none |
| 8.7 elliptic types | `11.a`, `27.a/ℚ`, `27.a/ℚ(√−3)` | `[C_1, ℝ]`, `[C_2, ℂ]`, `[C_1, ℂ]` (SUT19 Example 4.11) | sound | none |
| 9.6 Frobenius classes | `11.a`, `p = 2`, `a_2 = −2` | `1 + √2T + T²`, trace `−√2`, angle `arccos(−1/√2) = 3π/4` | sound | none |
| 9.8 counts | `52 − 14 − 3 = 35`, `35 − 1 = 34` | FKRS Thm 1.5: 35, 34 | sound | none |
| 9.9 newform `7.3.b.a` | `n = 2`, `χ = χ_F` | `ST(f)` two components, `nu1Mu 2` four: `E[t^{4,8}] = 3, 35` vs `3, 35` for the subgroup only at `m` with `2 | m` | sound | LMFDB labels not verifiable |
| 10.2 converse | — | needs meromorphy (SUT19 Thm 2.12) | missing hypothesis | R13 |
| 10.4–10.6 | `27.a`, `p = 5, 7` | inert `5`: trace `0`; split `7`: `a_7 = −1`, class in `u1` | sound | none |
| worked table rows | Table 11 and Table 8 | every `(c, d, Pr[a_1=0], moments, End_ℝ)` entry of the eleven curves and six products matches | sound | none |
| product row 4 | `11.a × 27.a` | `½·3 + ½·1 = 2`; sentence says `a_{1,U(1)}` | text wrong | R06 |

**Headline theorems.** Stated: Weyl integration for `USp(2g)` (4.2), symplectic torus conjugacy (0.5), finiteness of the component group (1.2), Serre's component-counting theorem (3.5), the degree-2 classification (5.3), the degree-4 identity-component theorem (6.4), finiteness of the groups satisfying the axioms (7.2), the degree-6 identity-component theorem (7.3), the six real types of a surface (8.4), the `SU(2)` Weyl criterion (10.1). Absent though statable: the degree-4 classification (6.6) and distinctness (6.8), Serre's criterion (10.2) (R07). Named as not statable with a reason the brief accepts: 3.6, 6.7, 6.9, 7.4 (stored data), 8.1–8.2, 8.7's classifiers, Layer 9, 10.3, 10.5–10.6 (no `ℓ`-adic image or Zariski closure of an abelian variety's representation at the pin).

## Not verifiable

- The LMFDB claims: the stored `gens` of `1.2.B.2.1a`, the `w.2.3.cn`/`w.2.1.dn` moment rows and `component_group` strings of `sato_tate_groups/main.py`, the labels of every worked example, and the `real_dimension = 6` of the `1.6.L.*` rows (FKS Table 9 gives `2` for `U(1) × U(1)_2`, so the README's correction is right if the stored value is as claimed). No legal source in the service covers the database.
- Silverberg 1992, Theorem 2.4 (JPAA, DOI prefix 10.1016): paywalled; recorded as uncertified, cited by locator.
- Katz–Sarnak §5.0.4 (AMS book), Serre 1968 I.A.2 (book), Artin *Algebra* §6.12, Bump, Bröcker–tom Dieck, Shimura 1975, Ribet 1985 and 2004, Mumford §21, Milne's notes, Deligne–Milne I.6.2, Kedlaya–Sutherland 2009, Fité–Sutherland 2014, Johansson, Taylor, BLGHT, BCGNT: not fetched; the Weyl constant and the degree-4/6 moments were recomputed instead (above).

## Source issues

- **Error** in FKRS12 at Table 6, printed page 42: the source says that on the non-identity component of `N(U(1) × SU(2))` the coefficient `a_1` has the law of `a_{1,U(1)}`; it should be the law of `a_{1,SU(2)}` (its own Table 9 formula `½(c_n b_{n+2}/2 + c_n)` and Table 8's `E[a_1²] = 2`); affects a stated result.
- **Error** in FKRS12 at Table 6, printed page 42: the source lists `(ac)²G_{1,1}` with the law `(a_{1,U(1)}, 2)`; since `(ac)² = −ab` it is the coset `abG_{1,1}` with law `(0, 2)` (its own `z_1 = 3` for `F_{ac}`); affects a stated result.
- **Misprint** in FKRS12 at Table 6, printed page 42: the row `(G_3, 1, r)` prints `a_2 = a_{1,SU(2)} + r² − 2`; it should be `a_{1,SU(2)}² + r² − 2` (Table 8: `E[a_2] = 3` for `E_1`); affects nothing.
- **Misprint** in FKRS12 at §3.4, printed page 17: the source says the average over the component of the squared trace equals `|Trace(A)|² = (2cos(π/n))²`; it should be `2(2cos(π/n))²` (the trace is `2cos(π/n)(u + ū)` and `E[(u+ū)²] = 2`); affects nothing.
- **Misprint** in FKS23 at Table 9, printed page 83: the source gives `dim ST(A)⁰ = 3` for type K (`SU(2) × U(1)_2`); it should be `4`; affects nothing.

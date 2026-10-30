# Review of QWittVectors (pull request #1351 at 9d7d86f)

**Verdict:** accepted

Incremental re-review of the 53 lines changed since 85f99e7 (README only; `Suggested.lean` and `metadata.toml` are byte-identical to 85f99e7; no file changed outside the folder). The change withdraws the undeclared `gap:framed-skew-product` of the previous finding and owns the arbitrary-base skew product locally as §8.2a, built from the twisted Koszul product of AInfCohomology §AI.1.7. The new section, its supplier contract, and every passage that cites it (Scope lines 9, 11, 15; the AInfCohomology and PrismaticCohomologyPartII contracts, lines 80 and 120; §§8.3, 8.4, 9.4 and the Layer 8 and Layer 9 Dependencies lines) were reviewed in full. No blocking finding remains; the one note below is a P3 the author may take or leave.

## R01 (P3) — §8.2a naturality: the coordinate compatibility of the algebra map is implicit

**Location:** `TauCetiRoadmap/QWittVectors/README.md:1121` ("For a D-algebra map E→E′ between such framed algebras and an injection ι of coordinate sets intertwining the automorphisms and the divided differences …") and line 1124 ("the map sends hX_s to hX′_(ι s), so it commutes with ρ").

**Claim:** the induced map C→C′ commutes with the rescalings ρ, ρ′.

**Witness:** "intertwining the automorphisms and the divided differences" (f∘γ_s=γ′_(ι s)∘f, f∘D_s=D′_(ι s)∘f) does not by itself say f(X_s)=X′_(ι s); the proof's "sends hX_s to hX′_(ι s)" uses that. The conclusion (preservation of differential, product and unit) holds anyway by the displayed formula, since f(a)γ′_(ιI)(f(b))=f(aγ_I(b)) and D′_(ι s)(f(a))=f(D_s(a)), so nothing is false; only the ρ-route of the proof needs the extra clause.

**Repair:** in the bullet at line 1121 write "a D-algebra map f:E→E′ of such framed algebras lying over the coordinate injection, so f(X_s)=X′_(ι s), and intertwining the automorphisms and the divided differences". Tested on E=ℤ[X][[h]]→E′=ℤ[X,Y][[h]], X↦X: hX↦hX′, ρ′(f(dX))=hXx′_X=f(ρ(dX)).

## Previous findings

- R01 — repaired: README no longer declares `gap:framed-skew-product` (0 occurrences); seven `gap:` slugs remain and the plan's `gaps` lists the same seven; §8.2a (lines 1114–1131) now owns the product via AInfCohomology §AI.1.7.

## Verified sound

**Scope of this pass.** The diff (33 insertions, 20 deletions, all in README.md) was read in full with every passage that cites it: Scope (lines 9, 11, 15), the AInfCohomology contract (line 80), the PrismaticCohomologyPartII contract (line 120), §8.1 (lines 1073–1093, for the "every K=(h) realization of §8.1" claim), §8.2a in full (lines 1114–1131), §8.3 (lines 1137–1152), §8.4's `*Needs:*` line (1164), Layer 8 Dependencies (1179), §9.4 (lines 1245–1255) and Layer 9 Dependencies (1369). The outside-folder diff against `origin/main` is empty.

**Gate and mechanical checks.** The gate command on this head returned every scanner count 0 and `OK`, exit 0 (`set_option`, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material); the worker's gate adds `build=0`. The dependency command with `--movable` returned exactly:

```text
depcheck: 204 roadmaps, 1392 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge order: AInfCohomology line 53, PrismaticCohomologyPartII line 55, QWittVectors line 186, so the new §8.2a edges point downward. `roadmaps resolve`: cross-roadmap citations found nowhere, none; twelve Lean-name leads, of which the one new lead `AInf.koszul_products_and_cohomology` is resolved below and the other eleven are this roadmap's four declarations and supplier names resolved by the earlier reviews.

**Elaboration.** No other `lake build` was running. `lake env lean` on `Suggested.lean` at the pins: exit 0, two `sorry` warnings (lines 82 and 102), no other output. The file is unchanged since 65c0d99, so the elaborated signatures (worker's `signatures.md`, identical to the previous report), the `#check @name` comparison, the one-tactic probes and the padding audit of the earlier reviews apply unchanged; no declaration was added or removed.

**The new supplier import against AInfCohomology at its open head.** AInfCohomology README line 1476 (§AI.1.7, "Koszul products and integral cohomology", `AInf.koszul_products_and_cohomology`): for commuting A-algebra automorphisms γ_i of a possibly noncommutative A-algebra R, K_R(γ_i−1) has the DGA product x_ix_j=−x_jx_i, x_i²=0, x_ia=γ_i(a)x_i, d(x_i)=0, d(a)=∑(γ_i(a)−a)x_i, with the Leibniz rule; hypotheses "A commutative, R an A-algebra, γ_i commuting A-algebra automorphisms" and nothing else. Its Checks impose x_i²=0 separately in characteristic two. The complex itself (`Decalage.koszulComplex`, line 1442) has terms M⊗_AΛ^j(A^d), differential d(m⊗e_J)=∑g_i(m)⊗e_i∧e_J on the ordered exterior basis. README line 80 restates exactly this (B, E, γ_s; the five relations; "No flatness, torsion-freeness or regularity hypothesis") and Scope line 11 attributes it correctly. AInfCohomology is in the brief's list of permitted suppliers.

**§8.2a against PrismaticCohomologyPartII §5.0 and §5.18 at its open head.** §5.0 (README lines 1582–1619 of the printed roadmap): `QFraming.qDeriv` is defined for a D-algebra E with commuting D-automorphisms γ_s satisfying γ_s(X_u)=q^(δ_su)X_u and γ_s−1 divisible by tX_s, with tX_s regular, by tX_s∇_s(f)=γ_s(f)−f; `QFraming.qDeRhamComplex` for finite S has term E⊗_D∧^iD^S and differential ∑_s∇_s dX_s∧−; coordinate-injective naturality requires extra automorphisms to fix the image; and "the associative product is §5.18's skew product". §5.18 (lines 2043–2072) states `QDeRham.skewDGA` only for F=D_(J,q)(P) over D flat over ℤ_p[[q−1]], by the same basis rules dX_s·a=γ_s(a)dX_s, (dX_s)²=0, dX_s·dX_t=−dX_t·dX_s. So the product on an arbitrary `QFraming` is supplied nowhere earlier, §8.2a is its owner, and the overlap sentence at line 1122 (agreement with `QDeRham.skewDGA` in §5.18's range "by the displayed basis formula", E₁ comparison imported only there) is exact. `roadmaps grep` for `framed-skew-product|koszul_products_and_cohomology|γ_I(b)|skewDGA` over all open heads and main finds only AInfCohomology line 1475, PrismaticCohomologyPartII lines 2060–2061 and this README; no other roadmap constructs the arbitrary-base product.

**Seeded sample.** Of the fifteen seeded targets the diff touches only "8.2a The skew product on finite framed q-de Rham complexes" (new) and the `*Needs:*` line of "9.4 Product homotopy for framed cochains"; the others are unchanged and the previous reports' checks stand. §8.2a's locator: wagner lines 2858–2872 are §4.8 "Non-commutative multiplicative structure", the page footer "57" is at line 2873 (file page 125), and the passage gives the q-Leibniz rule q∂_i(fg)=f q∂_ig+γ_i(g)q∂_if, the product ω∧η=fγ_(i₁)(⋯γ_(i_k)(g)⋯)dT_I∧dT_J, the rule dT_i∧f=γ_i(f)∧dT_i and the DGA Leibniz law over A[[q−1]], exactly the formula, second Leibniz form and law the README states. Wagner's own setting (§4.7, lines 2830–2834) is an étale frame of a smooth A-algebra; the README's wider generality (arbitrary D, any framed E) is derived from §AI.1.7, not attributed to Wagner, and the citation says so.

**Adversarial table.** Rows for statements the diff leaves untouched are the previous reports' rows (132 in the first full review, 18 at 74b3029, 12 at 65c0d99, 9 at 85f99e7) and are carried forward by citation; the rows below are computed at this head for the changed statements.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Line 80: imported twisted DGA exists at the supplier with no flatness hypothesis | AInfCohomology #1044 line 1476 | README: B commutative, E a B-algebra, commuting automorphisms, x_sx_u=−x_ux_s, x_s²=0, x_sa=γ_s(a)x_s, d(x_s)=0, d(a)=∑(γ_s(a)−a)x_s; supplier: the same five relations, "A commutative, R an A-algebra, γ_i commuting A-algebra automorphisms" | Agree; contract is a subset of the supplier |
| §8.2a hypotheses equal §5.0's `QFraming` | PrismaticCohomologyPartII #1065 §5.0 | README: commuting D-automorphisms, γ_s(X_u)=q^(δ_su)X_u, hX_s regular, γ_s−1 divisible by hX_s; §5.0: the same, with tX_s∇_s(f)=γ_s(f)−f and terms E⊗_D∧^iD^S | Agree |
| ρ is injective | one coordinate, a e with a≠0 | ρ(a e)=a·hX·x; hX regular ⇒ a·hX≠0 | Holds |
| ρ is a chain map | s∉I, general a; s∈I | left: ρ(D_s(a)e_s∧e_I)=D_s(a)·hX_s∏_(u∈I)hX_u·x_s∧x_I; right: (γ_s−1)(a∏hX_u)x_s∧x_I=(γ_s(a)−a)∏hX_u·x_s∧x_I=hX_sD_s(a)∏hX_u·x_s∧x_I since γ_s fixes h and X_u (u≠s); s∈I: x_s∧x_I=0=e_s∧e_I | Holds |
| ρ multiplicative | I∩J=∅; I∩J≠∅ | ρ(ae_I)ρ(be_J)=a∏_(I)hX_s·γ_I(b∏_(J)hX_u)·x_Ix_J=aγ_I(b)∏_(I∪J)hX_s·x_I∧x_J=ρ(aγ_I(b)e_I∧e_J) because γ_I fixes hX_u for u∉I; otherwise 0=0 | Holds; associativity, unit, Leibniz transport along injective ρ |
| Two twisted Leibniz forms agree | f,g in commutative E | hX_s·[D_s(f)g+γ_s(f)D_s(g)]=(γ_s(f)−f)g+γ_s(f)(γ_s(g)−g)=γ_s(fg)−fg; difference of the two forms =D_s(f)(g−γ_s(g))+D_s(g)(γ_s(f)−f)=−hX_sD_s(f)D_s(g)+hX_sD_s(g)D_s(f)=0 | Holds as stated at line 1120 |
| D_sγ_I=γ_ID_s for s∉I | general f | hX_sD_s(γ_If)=γ_sγ_If−γ_If=γ_I(γ_sf−f)=γ_I(hX_s)γ_I(D_sf)=hX_sγ_I(D_sf); hX_s regular | Holds |
| Naturality: extra target directions | s′∉ι(S), a∈E | γ′_(s′)(f(a))=f(a) ⇒ hX′_(s′)D′_(s′)(f(a))=0 ⇒ D′_(s′)(f(a))=0 by regularity | Holds; coordinate compatibility f(X_s)=X′_(ιs) implicit (R01, P3) |
| Check 1 (𝔽₂[T][[h]]) | d(T²), untwisted rule, flatness | D(T²)=(q²−1)T/h=(1+q)T=(2+h)T=hT; d(T²)=hTe; untwisted 2Te=0; 2·D=0 so D not ℤ₂[[h]]-flat, §5.18 inapplicable | Holds |
| Check 2 (ℤ[X][[h]], one coordinate) | dX; d(X²); rescaling by X alone | ρ(e)=hXx=(γ−1)(X)x; ρ(d(X²))=(1+q)X·hX·x=(q²−1)X²x=(γ−1)(X²)x; X-rescaling gives Xx≠hXx (h not a unit) | Holds |
| Check 3 (ℤ[X,Y][[h]]) | (e_X·Y)·X vs e_X·(YX); d²(XY); no coordinates | Ye_X·X=qXYe_X; γ_X(YX)e_X=qXYe_X; d(Ye_X+Xe_Y)=e_Y∧e_X+e_X∧e_Y=0; C=E with E's product | Holds |
| Check 4 (merge X,Y↦T) | d(XY) vs d(T²) | Te+Te=2Te vs (1+q)Te=(2+h)Te; differ by hTe≠0 | Termwise merge excluded; agrees with §5.0's and §5.18's merge Checks |
| §8.2a applies to §8.1's realization | E=R[[h]], D=A[[h]], A arbitrary | q=1+h a unit; T_i regular on R by flatness of the étale frame, h regular on R[[h]], so hT_i regular; γ_i(T_j)=(1+h)^(δ_ij)T_j | Holds (§8.1 line 1073 states the same) |
| Degenerate: q=1 | h=0 | hX_s=0 regular only on E=0; excluded by §5.0's regularity, reduction mod h is §8.3's separate statement | No change |
| §5.18 overlap, two owners | F=D_(J,q)(P), D flat over ℤ_p[[h]] | §8.2a product on `QFraming.qDeRhamComplex` by basis formula; `QDeRham.skewDGA` by the same basis rules at #1065 lines 2056–2060 | Agreement by definition; E₁ comparison imported only there |
| `gap:` slugs README vs plan | counts | README 7 slugs (cohomology-completion, cyclotomic-contract, dga-bockstein, dga-quotient, ordinary-derham, pd-presentation, prismatic-frobenius); plan `gaps` the same 7; `framed-skew-product` 0 occurrences anywhere | Previous R01 repaired |
| §§8.3, 8.4, 9.4 and Dependencies cite §8.2a | lines 1137, 1145, 1164, 1179, 1245, 1255, 1369 | each former `gap:framed-skew-product` citation replaced by "Layer 8.2a" or "§§8.2a and 8.3"; gate layer-ids=0, target-ids=0 | Consistent |

**Library and sibling declarations opened at this head.** AInfCohomology #1044 README lines 1440–1490 (`Decalage.koszulComplex`, `AInf.koszul_products_and_cohomology`). PrismaticCohomologyPartII #1065 README lines 1582–1619 (§5.0) and 2043–2072 (§5.18, `QDeRham.skewDGA`). Board `packages/QWittVectors/design/plan.json` `gaps` (seven entries). Merge order lines 53, 55, 186. Source: wagner lines 2812–2880. No changed passage cites a new Mathlib or Tau Ceti declaration, so the 48-declaration table of the first full review stands.

**Ownership against open work.** The only new object is the skew product on an arbitrary finite `QFraming`; it is constructed nowhere on main or at the open heads listed in the brief (`roadmaps grep` above), its q-PD-envelope specialization stays with PrismaticCohomologyPartII §5.18 and its Koszul-side generality with AInfCohomology §AI.1.7, both cited. Open pull requests not listed with a path in the brief were read only through the roadmap index tools.

**Headline theorems and padding.** Unchanged file: the two statable headlines (§1.2 ghost-image criterion, §8.1 unique framed automorphism) are present; the module docstring names every other headline family and the carrier each lacks. §8.2a introduces no headline statable at the pins (`QFraming` does not exist in the pinned libraries).

## Not verifiable

- The KTheoryFiniteLocalFields half of the first review's R01 lies in pull request #1281 and is unchanged by this diff; it remains reported as data, as in the previous report.

## Source issues

- none

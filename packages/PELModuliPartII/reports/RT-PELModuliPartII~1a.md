<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13097#issuecomment-6907813222 -->
Red team round 1 pass a (claude) of 107b660

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §3.7 uses "vertex lattice", "type" and Λ^∨ undefined; with the roadmap's own dual the statement fails at n=2

   **Location.** `packages/PELModuliPartII/README.md:889` ("V_Λ for the closed Bruhat–Tits stratum of
   N^exo_red indexed by a vertex lattice Λ of V^exo … dimension t(Λ)/2−1"), `:893` ("orthogonal group of
   Λ^∨/Λ"), `:898` ("every vertex lattice has type 2 (types are even and positive)").

   **Claim.** The strata are indexed by vertex lattices of V^exo, of even positive type t(Λ), and at n=2
   there is exactly one, of type 2.

   **Witness.** The README never defines vertex lattice, t(Λ) or Λ^∨, and its only stated dual is the
   hermitian one, `{x : h(x,Λ)⊆O_L}` (README:104). LL22 Definition 2.10 (LL22 lines 518–523) uses the trace
   dual, `{x : h(x,Λ)⊆u⁻¹O_L}`. Computed at n=2, V^exo = ⟨1⟩⊥⟨−ε⟩ with ε a non-square unit (anisotropic;
   LL22 line 1401), Λ₀=O_Le₁+O_Le₂, v_K(h(x,x))=min(v_L(x₁),v_L(x₂)):

   | dual used | Λ₀^dual | Λ₀^dual/Λ₀ | type | dim t/2−1 | lattices Λ⊆Λ^dual, u·Λ^dual⊆Λ of type 2 |
   | --- | --- | --- | --- | --- | --- |
   | trace (LL22) | u⁻¹Λ₀ | length 2 | 2 | 0 | exactly Λ₀ |
   | hermitian (README Conventions) | Λ₀ | 0 | 0 | −1 | none: h(Λ,Λ)⊆uO_L forces Λ⊆uΛ₀, while Λ=uΛ^♯⊇Λ₀ |

   So under the convention the README states, "types are even and positive" is false (type 0 occurs) and
   "exactly one vertex lattice of type 2" is false (there is none).

   **Repair.** In §3.7, after the sentence ending "…is 0, respectively 1.", insert:

   > Lattice conventions in this target are those of LL22, not the hermitian dual of the Conventions: for an
   > O_L-lattice Λ of V^exo put Λ^∨={x : Tr_{L/K}h(x,y)∈O_K for all y∈Λ}={x : h(x,Λ)⊆u⁻¹O_L}, which is u⁻¹
   > times the hermitian dual Λ^♯ of the Conventions. Λ is a vertex lattice when Λ⊆Λ^∨ and uΛ^∨⊆Λ; its type
   > t(Λ) is the k-dimension of Λ^∨/Λ, which is even, and at least 2 because V^exo is nonsplit. (LL22,
   > Definition 2.10 and Remark 2.13, pp. 12–13; Definition 2.27, p. 22.)

   and replace the second Check's opening by:

   > At n=2 the space V^exo is two-dimensional and nonsplit, hence anisotropic, with an orthogonal basis
   > e₁,e₂ of unit norms. Λ₀=O_Le₁+O_Le₂ has hermitian dual Λ₀ and trace dual Λ₀^∨=u⁻¹Λ₀, so it is a vertex
   > lattice of type 2, and it is the only vertex lattice: a vertex lattice of type 2 satisfies Λ=Λ^♯, so
   > h(x,x)∈O_K on Λ, Λ⊆Λ₀ and Λ=Λ^♯⊇Λ₀. Read with the hermitian dual, Λ₀ would have type 0 and V_Λ₀
   > dimension −1, and no lattice would have type 2. Each V_Λ₀^ε is a point, …

   (the rest of the Check, from "Connectedness forces", is then a consequence and can be shortened to
   "so each N^ε_red is the single point V_Λ₀^ε and V_Λ₀ is two points, one in each component").
   Tested on the refuting instance: with the trace dual, t(Λ₀)=2, dimension 0, one lattice.

2. **F02** (P2) gap:zink-display-equivalence asks PELModuli for an equivalence of a functor it defines only in characteristic p

   **Location.** `packages/PELModuliPartII/README.md:39–40` ("Zink displays and the functor BT to formal
   p-divisible groups are PELModuli §M2.15; the equivalence over every ring in which p is nilpotent is the
   contract"), `:242` (the `needs` sentence), and the same entry in `packages/PELModuliPartII/design/plan.json`
   (`gaps`, slug `zink-display-equivalence`).

   **Claim.** The carrier (displays, BT) is supplied by §M2.15 over the rings this roadmap uses; only the
   equivalence is missing.

   **Witness.** PELModuli §M2.15 at its open head: "Define `Display`, Zink's displays over a ring `R` of
   characteristic `p`", with BT "an equivalence over complete local noetherian rings with perfect residue
   field". The bases here are p-nilpotent, not of characteristic p: R=O_L̆/(p²) (§0.2, §1.1). So displays,
   their base change and duals, and BT itself are unowned over such R; the `needs` sentence presupposes them.

   **Repair.** Replace the `needs` sentence at README:242, and identically in the `gaps` entry of
   `design/plan.json`, by:

   > For every ring R in which p is nilpotent, define displays over R with their base change and duals and
   > the functor BT to formal p-divisible groups over R (§M2.15 defines them over rings of characteristic p),
   > and prove that BT is an equivalence from nilpotent displays over R to formal p-divisible groups over R,
   > compatible with base change and with duality of biformal objects.

   and README:39–40 by: "Zink displays and the functor BT to formal p-divisible groups over rings of
   characteristic p are PELModuli §M2.15; their definition over every ring in which p is nilpotent and the
   equivalence there are the contract gap:zink-display-equivalence." Tested on R=O_L̆/(p²): the reworded
   contract covers the carrier and the theorem.

3. **F03** (P2) strict O_K-modules and their relative height have a second, earlier owner

   **Location.** `packages/PELModuliPartII/README.md:22` ("This roadmap owns: strict formal O-modules, …"),
   `:364` (§0.1, the definition of a strict O-module and of relative height), `:374` (API: "it is the
   p-height divided by [O:ℤ_p]").

   **Claim.** This roadmap is the owner of the strict-module carrier and of the height conversion.

   **Witness.** HilbertModularVarietiesAndShimuraCurves §R18.5.4, earlier in the merge order (line 162
   against 188): "Construct here the strict `O_K`-action, meaning that `O_K` acts on Lie through the
   structure map, and the `O_K`-relative group height h characterized by `rank X[π]=q^h`. Prove
   `height_p(X)=[K:ℚ_p]h`." Same object, same theorem, two owners.

   **Repair.**
   - README:22: replace "strict formal O-modules, the Witt O-frame over an arbitrary O-algebra, O-displays"
     by "the Witt O-frame over an arbitrary O-algebra, O-displays of strict formal O-modules".
   - Add to the "It leaves to other roadmaps" list: "The strict O_K-action of a p-divisible group, its
     O_K-relative height and the formula height_p=[K:ℚ_p]·h are HilbertModularVarietiesAndShimuraCurves
     §R18.5.4; §0.1 uses that carrier over O-algebras in which π is nilpotent and adds formality, O-displays,
     the relative isocrystal and relative duality."
   - Add under Exact supplier contracts: "### From TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurves —
     §R18.5.4 (strict O_K-action on Lie, O_K-relative height characterized by rank X[π]=q^h, and
     height_p(X)=[K:ℚ_p]h)."
   - §0.1 API bullet 3 becomes "The relative height is the rank of P; it agrees with the relative height of
     HilbertModularVarietiesAndShimuraCurves §R18.5.4, whose formula gives p-height = [K:ℚ_p]·(relative
     height)."; add the section to the §0.1 and §0.3 *Needs:* lines and to the Layer 0 supplier list.

   The dependency check stays clean (the supplier is earlier). Tested on the Check at README:425:
   [K:ℚ_p]=2, relative height 6, p-height 12 on both sides.

4. **F04** (P2) §8.1 misstates the special inert hypothesis; as written it forces F⁺=ℚ

   **Location.** `packages/PELModuliPartII/README.md:1609`: "p is odd, inert and unramified in F, and
   F⁺_𝔭=ℚ_p".

   **Claim.** This is the setting of LTXZZ22 Definition 3.3.4.

   **Witness.** LTXZZ22 lines 1293–1296: the prime 𝔭 of F⁺ is inert in F; the rational prime p under it is
   odd and unramified in F; F⁺_𝔭=ℚ_p. If p itself were inert in F, F⁺ would have one prime above p of degree
   [F⁺:ℚ], so F⁺_𝔭=ℚ_p gives F⁺=ℚ; but the same sentence takes V "definite at the others" (embeddings), and
   §7.7 needs F⁺≠ℚ.

   **Repair.** Replace the clause by: "𝔭 is a prime of F⁺ that is inert in F, the rational prime p below it
   is odd and unramified in F, and F⁺_𝔭=ℚ_p". In §8.1 Check 4 and in §§8.2–8.7 "at p" then means at 𝔭 (the
   other primes of F⁺ above p keep self-dual lattices, as in LTXZZ22 Definition 4.2.2). Tested: F⁺=ℚ(√2),
   p=7 splits in F⁺ as 𝔭𝔭′, F=F⁺(i), 𝔭 inert in F: admitted by the repaired clause, excluded by the original.

5. **F05** (P3) the References note on LTXZZ22 §5.2 reports a misprint that is an extraction artefact

   **Location.** `packages/PELModuliPartII/README.md:2030–2031`: "§5.2, p. 188, states the definite space V°
   in rank N>1 while Remark 5.2.4 and Theorem 5.2.5 treat N=1; §8.2 takes N≥1."

   **Witness.** The cached text has no "⩾" at all (0 occurrences, 85 of the pattern "letter> digit", while
   "⩽" is present): LTXZZ22 line 124 reads "with N> 1 is relevant", line 986 "Let N> 1 be an integer", line
   1678 gives the indefinite V of §4.2 "of rank N> 1", which README §8.1 itself reads as N≥1. Line 2608 is
   the same glyph loss; the source says N≥1.

   **Repair.** Delete that sentence from the LTXZZ22 entry of the References. §8.2's "rank N≥1" is the
   source's own range and needs no note.

6. **F06** (P3) three definitions have two Checks

   **Location.** §0.7 (README:499–502, the conjugation equivalence), §3.2 (README:802–805, the
   symmetrization σ), §5.9 (README:1202–1205, the evaluation map b).

   **Repair.** Add one Check to each (values computed):
   - §0.7: "At n=3, conjugation sends signature (1,2) to (2,1): det(T−i(a)|Lie X) changes from (T−a)(T−ā)² to
     (T−ā)(T−a)², while relative height 6, dimension 3, λ and the relation λi(a)=i(ā)^∨λ are unchanged; an
     operation changing λ or the height is not this equivalence."
   - §3.2: "The sign is forced by ū=−u: with σ^∨=σ and σi(a)=i(ā)^∨σ, λ^∨=(σi(u))^∨=i(u)^∨σ=σi(ū)=−σi(u)=−λ;
     an alternating σ would give λ^∨=+λ, not a polarization."
   - §5.9: "For n=1 and 𝕏=Y with x=id: b(id)=e and (b(id),b(id))_C=(e,e)_Y=h(id,id)·(e,e)_Y with h(id,id)=1;
     the formula with (e,e)_Y⁻¹ in place of (e,e)_Y fails whenever (e,e)_Y≠±1."

7. **F07** (P3) three page ranges do not match the cached texts

   - README:1343 (§6.7): "RSZ21, §§3.4, 4.1, pp. 14–19". RSZ21 line 621 puts §3.4 on p. 11, line 848 puts
     §3.5 on p. 15, line 940 puts §4.1 on p. 17. Write "§3.4, pp. 11–15; §4.1, pp. 17–19" (§6.6 already
     cites §3.4 as pp. 11–12).
   - README:435 (§0.4): "Propositions 3.4 and 3.6, Lemma 3.9 and Corollary 3.10, pp. 11–18". Proposition 3.4
     is on p. 12 (Mih19 line 539, after the page marker at line 512). Write "pp. 12–18".
   - README:1833 (§9.4): "Appendix B, pp. 59–60". Appendix B begins on p. 58 (RSZ20 line 3179). Write
     "pp. 58–60".

Four P2 findings (R01–R04) and three P3 findings (R05–R07). No P1. `Suggested.lean` states nothing and
that is correct at the pins (see "Headline theorems and padding" under Verified sound).

## Verified sound

**Counts.** Declarations read: 0 of 0 (`Suggested.lean`, 39 lines, read whole). Targets read: 75 of 75
(README read whole, 2063 lines). Locators verified against the cached texts: about 160 (Mih19 22, LZ22 20,
LL22 25, HLSY23 9, RSZ21 18, RSZ20 11, RZ96 16, Cho18 3, Howard19 2, Wu16 4, Kraemer03 3, LRZ26 1, RZ17 3,
LL21 4, Stacks 6; Zhang21 10 and LTXZZ22 12 by item number only). Checks tested by computation: about 60 (the instances are in the table below).
Sibling citations checked: 79 section ids in 16 roadmaps, all present at main or at the open heads; 14
read for content. Pinned declarations grepped: 17 (all present, in the files the README names).

**Headline theorems and padding.** Headlines (README:11–16): §§1.2, 2.2, 3.4, 3.7, 5.7, 6.6, 7.6–7.9, 8.4,
8.7, 9.5–9.10, and §9.1. Each is named in the module docstring with the carrier it lacks. At the pin Tau
Ceti has `TauCeti.FormalScheme.Spf.carrier` and `.structureSheaf` only (no formal-scheme category), no
p-divisible group, no abelian scheme (`TauCeti.AlgebraicGeometry.AbelianVariety (K) [Field K]`), no
Dieudonné module; so none is statable and the empty namespace is correct. No padding (no declarations).
The `#check @name` audit has nothing to elaborate; I ran no Lean and nothing changed.

**Dependency check.** Output: `depcheck: 248 roadmaps, 2338 edges, 0 problem(s)`. No UPWARD, CYCLE or
moved line. SelmerIwasawaCohomologyPartII (later in the order) is named only as a consumer.

**Declared gaps.** Four slugs, the same in `design/plan.json` and under Exact supplier contracts, each
with a named supplier and section that exists (PELModuli §M2.15, AdelicAlgebraicGroups §4.1,
ReductiveGroupsPartII §RG2.3.5, ShimuraCompactifications §§7.5, 7.18). Not raised, except the precision of
the first (R02).

**Ownership.** No other roadmap, on main or open, plans the unitary Rapoport–Zink spaces, the Krämer or
exotic models, the RSZ/LTXZZ integral models or their uniformization (`roadmaps grep` for the objects:
only citations of LZ22 as a source). HilbertModularVarietiesAndShimuraCurves §§R18.5.7, R18.5.12c build
the quotient and Θ for the quaternionic PEL datum only; §9.2 and §9.5 are for different data. The one
overlap is R03. `VectorBundlesAndIsocrystals` Layer 0 states `W_𝒪_E(A)` for any 𝒪_E-algebra with the ghost
polynomials README:260 quotes, and F, V on perfect algebras only, as the README says.

**Adversarial table** (statement; instances; values; result; change).

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 w_n(Vx)=π·w_{n−1}(x) | n=1,2 | w₁(Vx)=π·x₀; w₂(Vx)=π·x₀^q+π²x₁=π·w₁(x) | pass | none |
| §0.1 π↦−π gives V↦−V | q odd, coordinate change x_i↦(−1)^i x_i | (−π)^i((−1)^i x_i)^{q^{n−i}}=π^i x_i^{q^{n−i}}; w₁(V′x)=−π x₀ | pass | none |
| §0.1 biformal ⇔ no slope 0, 1 | height 1 dim 1; height 2 dim 1 | dual dim 0 (étale, excluded); dual dim 1, slopes ½ | pass | none |
| §0.2 parameter count | [K:ℚ_p]=1,2; n=1 | d(h−d)=1·(2−1)=1; 1·(4−1)=3; N₁ has 0 | pass | none |
| §0.4 μ-ordinary slopes | (r,s)=(1,0),(1,1),(2,1) | (½); (1,0); (1,½,0) each twice; supersingular iff rs=0 | pass | none |
| §0.4 P(r,s) degrees | e=2,f=1,n=2,(2,0) | deg P₁₀=2, deg P=4=n[K:K₀]; ranks 2 on ψ₀, ne−r=2 on ψ̄₀ | pass, equals Mih19 Lemma 2.10 | none |
| §0.6 clause (ii) Check | K=ℚ_p(√p), n=2, (2,0), k-point | F=x·D_{ψ₀}: x acts by 0; F=second copy: quotient k[x]/x², x≠0, charpoly (t−a₀)²(t−ā₀)² both | pass | none |
| §0.6 rs=0 | r=0; s=0 | Gr of rank-0 or rank-n quotients = base | pass | none |
| §1.6 dimensions | n=2,3,4 | relative (0,1),(1,3),(2,5); arithmetic (1,2),(2,4),(3,6) | pass | none |
| §2.3 split/nonsplit | W₂, x₀ of norm ϖ | det valuation even; +1 odd ⇒ V₃ nonsplit | pass | none |
| §2.4 deg α | q=3 | (deg α)²·1=9·9 ⇒ 9; 27²≠81 | pass | none |
| §3.2 kernels | relative height 2n | #X[i(u)]=q^n, #X[ϖ]=q^{2n} | pass | none |
| §3.6 hermitian symmetry | Rosati of λ₀⁻¹y^∨λx | λ₀⁻¹x^∨λ^∨yλ₀^{−∨}λ₀=λ₀⁻¹x^∨λy (two signs cancel), u⁻²∈K | pass | none |
| §3.7 vertex lattices | n=2, both duals | see R01 table | fails with the stated dual | R01 |
| §5.2 τ slope, norm of u·e | relative height 2 | ½−½=0; uū(e,e)=−u²(e,e), valuation 1 | pass | none |
| §5.4 trace recovery | A=⟨Πx,y⟩, B=⟨x,y⟩ | Tr(u⁻¹δ(A+uB))=2δB | pass, equals HLSY23 (2.2) | none |
| §5.1 against §7.4 labels | HLSY23 Def 2.2; HLSY23 §10.2(4) | local: F conjugate, quotient structural; global: F structural, quotient conjugate | pass, as README says | none |
| §5.6 n=2 chart | y(1+x²)=2u, p odd | d(1+x²)=2x unit at x²=−1; yz=u, 𝔪=(y,z), dim 2 | pass | none |
| Conventions item 4 | uv=t^e, e=2 | 𝔪/𝔪² of dimension 3 in dimension 2 | pass | none |
| §6.1 product isomorphism | (z,g)↦(z,z⁻¹g) | c(z⁻¹g)=Nm(z)⁻¹c(g)=1; inverse (z,u)↦(z,zu) | pass | none |
| §6.2 admissible type Check | F⁺_v=ℚ_p(√p), F_v inert | {(σ,+),(σ,−)} pulled back; {(σ,+),(σ̄,−)} a CM type, not pulled back | pass | none |
| §6.6 Hodge filtration | R=k[ε], R[x]/(x²) | x²=(x+α)(x−α)+α² ⇒ α²=0, α=εc; Kottwitz fixes c | pass | none |
| §6.6 arrow Check | c=1+√2 | c²=3+2√2 totally positive, c⁴=17+12√2; ι(c)^∨λι(c)=λι(c²) | pass | none |
| §6.6 nonemptiness | F/F⁺ ramified at a finite place | RSZ21 Remark 3.7(i): nonempty for every a | pass | none |
| §6.8 parity exponent | n=3, r_φ=2 | 3·1−2=1; 0−2=−2 | pass | none |
| §7.7 Meyer | F⁺=ℚ, n=4 | trace form signature (6,2), 8 variables, isotropic | pass | none |
| §8.1 special inert | F⁺≠ℚ | "p inert in F" and F⁺_𝔭=ℚ_p ⇒ [F⁺:ℚ]=1 | fails as worded | R04 |
| §8.4 crossing ring | N=2 | W(k)[[x₁,x₂]]/(x₁x₂−p), x₁x₂−p∉𝔪² | pass | none |
| §8.7 tangent ranks | N=2,3 | rank ω_{A∨,τ∞}=1, quotient N−1 | pass, equals LTXZZ22 Thm 4.2.3 | none |
| §9.1 both directions | supersingular E, K=ℚ; ordinary E, K=ℚ; conjugated CM pair | 4=4; 2≠4 (hypothesis fails); 0≠2 (slopes 0, 1) | pass | none |
| §9.1 slopes of a basic pair | w banal | dim/height=|Φ_w|/[F_w:ℚ_p] for A₀ and n|Φ_w|/n[F_w:ℚ_p] for A | pass | none |
| §9.2 lattice Check | H=(0,1,0;1,0,0;0,0,3) over ℚ₉/ℚ₃ | duals (e,f/3,a/3),(e/3,f,a/3),(e,f,a/3); lengths 3,3,1; g*Hg=H; gΛ₋=Λ₊ | pass, LZ22 §2.6–2.7 conventions | none |
| §9.6 scalar | val_u(ϖ)=1, 0 | h′=(u²/ϖ)h^exo: unit; valuation 1 | pass | none |
| Stacks tags | 0B3G, 0C4M, 0B3H, 0C4N, 0BCL, 01WN | base change; composition over quasi-compact S; quasi-affine finite type; cancellation; projective ⇔ quasi-projective and proper (S qcqs); finite ⇔ proper with finite fibres | pass | none |

**Wording and arrangement.** Compared 22 passages with 9 sources at their locators (Mih19 Definitions 2.2,
2.7, 2.8, 2.11, Proposition 2.12, footnote 8; LZ22 §§2.1, 2.2, 10.1, 10.2, 13.4; LL22 Definitions 2.1,
2.59, Remark 2.2, Proposition 2.28; HLSY23 Definition 2.2, §2.2; Zhang21 Definition 6.1, Theorem 6.2;
LTXZZ22 Definition 4.2.2, Theorems 4.2.3, 5.2.5; RZ96 Lemma 6.28, Theorem 6.30; RSZ21 Theorem 6.7, Remark
6.8). Longest shared run: 8 words ("there is a unique … with λ=σ∘i(u)", LL22 line 426), forced by the
statement. No table, figure or list is taken over. LL22 has the largest share (34 of 218 locators). Its
contents (LL22 lines 15–40) against the layers: Layer 3 draws on §§2.1 and 2.3, Layer 4 on §2.8, §§7.3,
7.7 and 9.6 on §4.5; Layers 0–2 and 5–9 have no counterpart there. Within Layer 4 the order 4.1→4.2→4.3→4.4
and 4.5, 4.6 after 4.3, 4.4 is forced by the *Needs:* lines (README:941, 954, 975, 988, 1009, 1025).

Source independence: 22 passages compared with 9 sources, none shared; largest share LL22, 34 of 218 locators; contents compared with LL22: independent.

## Not verifiable

- Published page numbers of Zhang21 (Annals) and LTXZZ22 (Inventiones): the cached texts are the arXiv v3
  versions with their own pagination; item numbers were checked, pages were not.
- LTXZZ22 Remark 4.2.5 (the period line) and the LL22 §4.3/§4.5 misprint of A₀ for A reported in the
  References: not opened at the line.
- Content of the supplier sections beyond the 14 read (the remaining 65 ids were checked for existence
  and heading only).
- The n=2 Krämer chart of §5.6 is the README's own computation (Kraemer03 Theorem 4.5 assumes n≥3,
  Kraemer03 lines 95, 297); I checked the final equation, not the elimination from (4.3)–(4.7) at n=2.
- Ownership against open pull requests rests on `roadmaps grep` and `roadmaps show` at the indexed heads;
  PELModuli, VectorBundlesAndIsocrystals, IgusaVarietiesAndTorsionConcentration, ShimuraCompactifications
  and EndoscopicTransferAndUnitaryTraceComparison were read through that tool, not from checkouts.

## Source issues

- **Error** in LZ22 at §13.4, item (3), p. 82: the source says the global isogeny α has degree q at v₀; it should be q² at v₀, since both source polarization factors have degree q² there and the target is principal; affects nothing.
- **Error** in RZ96 at Corollary 6.29, p. 293: the source says the K-linear Hom comparisons hold for two objects each satisfying Lemma 6.28 separately; it should require the two 𝔭-parts isoclinic of one common slope (ordinary CM curve with conjugated action refutes it); affects a stated result.
- **Gap** in LL22 at §4.5, p. 66: the source says the integral models are smooth projective, citing RSZ20 Theorem 4.7; it should give a properness argument, since that theorem proves flatness and smoothness only; affects a stated result.
- **Gap** in LL22 at §4.5, the pairing on V, p. 66: the source says ϖ has prescribed valuations at the places of U only; it should also fix total positivity and valuation 1 at u for the stated definiteness and local isometry; affects a stated result.
- **Gap** in HLSY23 at Definition 2.2(2), p. 10: the source says the framing is an O_F-linear quasi-isogeny of height 0; it should also require it to respect the polarizations up to a unit, as Howard19 §2 does; affects nothing.
- **Error** in HLSY23 at §10.2, p. 78: the source says the model is regular and semistable at all places above ramified and almost self-dual places, citing RSZ20 Theorem 5.2; it should keep the unramifiedness hypotheses on E_ν of that theorem and RSZ21 Theorem 6.7(ii); affects a stated result.
- **Misprint** in LTXZZ22 at Definition 4.2.2, p. 37 of the arXiv version: the source says Hecke parameters lie in U(V) of the adeles of F; it should be the adeles of F⁺, U(V) being a group over F⁺; affects nothing.

## For the human reviewers

- **Licence.** RZ96 is read from an author-hosted scan of a Princeton University Press book (`sources.toml`, id RZ96, `licence_class = "author-page"`); LL21, LL22 and RSZ21 are author copies of published articles.
- **Not tested.** Published pagination of Zhang21 and LTXZZ22 (the README cites published pages; the cached texts are arXiv v3) was not compared.
- **Scope.** §9.9 states that no cited text contains the comparison of Krämer completions with the filtration (README:1920); §5.6 at n=2 is likewise the roadmap's own computation.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "107b660c6d25f5e30fb1bbb94b5e62f157f0c007", "job": "RT-PELModuliPartII~1a", "model": "fable", "worker": "chris-x91"} -->

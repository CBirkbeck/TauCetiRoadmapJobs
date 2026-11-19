# Review of ChevalleyGroups (pull request #2544 at 91fcf6f)

**Verdict:** needs changes

**Summary.** Changes are needed for two findings. First, §4.2–§4.3, §6.3 and §7.1 plan again over ℤ the big cell, smoothness and fibres, the comparison morphism and the scheme-level exceptional isogeny. §2.9 identifies this roadmap's group scheme with ReductiveGroups' pinned group, and ReductiveGroups §9B already owns all four for that group (R01). Second, `Suggested.lean` leaves out two headline cases that are statable on the pinned Geck carrier: smoothness over ℤ of relative dimension rank + number of roots, and the trivial centre (R02). Every Check and both Lean statements came out true when recomputed. There are three small corrections, three format notes and one question for the author, none blocking. The humans should note that Steinberg's *Lectures*, the source of most locators, could not be read legally.

## R01 (P2) — §4.2–§4.3, §6.3 and §7.1 re-plan objects that ReductiveGroups §9B owns for the same group scheme

Two roadmaps on main would each build the integral charts and the same two scheme morphisms, and an implementer cannot tell which plan to follow. ReductiveGroups also states the opposite contract: "ChevalleyGroups takes its group scheme from 9B through its C2 and is a consumer of these items, not a second supplier of them" (ReductiveGroups README, lines 94–95).

How I know: §2.9 (lines 429–436) identifies `G_D` with the §9B group scheme, matching root subgroups and tori, and transports §9B's certification that it is split reductive. On main, ReductiveGroups owns the following for that group:

- §9B.1 (lines 4592–4650) constructs over ℤ the open immersion `U⁻ × T × U⁺ → G`. Its inverse is built from the leading block minors in the weight basis, the same method §4.2 uses. §9B.1 also proves the Weyl-translated cover, smoothness, relative dimension `rank X + |Φ|` and geometrically connected fibres.
- §9B.2 (lines 4669–4731) constructs the central isogeny `G_E → G_D` for `Λ(D) ⊆ Λ(E)`, and an isomorphism when the lattices are equal.
- "Special isogenies in characteristics two and three" (line 5193) constructs τ on the pinned simply connected group over `𝔽_p` with `τ² = Frob_p`. It does so from carriers that Tau Ceti pins: `TauCeti.SpStd.specialIsogeny`, and the scheme morphisms `TauCeti.G2ShortRoot.PrimeField.specialIsogenyHom` and `TauCeti.F4ShortRoot.PrimeField.specialIsogenyHom` with their `specialIsogenyHom_comp_self` (pinned Tau Ceti, `Algebra/Lie/G2/ShortRoot/PrimeField/SpecialIsogeny.lean` line 635 and `Algebra/Lie/F4/ShortRoot/PrimeField/QuotientSpecialIsogeny.lean` line 297).

This README plans each of these again:

- §4.2 (lines 612–620) proves the isomorphism over ℤ by the same block-minor inverse.
- §4.3 (lines 636–638) proves smoothness and the fibres with *Needs:* §4.2 only, although §2.9 has already transported them.
- §6.3 (line 976) builds the scheme map from §4.2.
- §7.1 (lines 1005–1013) says to "construct the endomorphism `τ` of the `𝔽_p`-group scheme `G_sc(t)_𝔽p` … glue over the translates of the big cell", and only then compares it with §9B's.

Yet the README itself says that §9B "owns the exceptional isogenies as morphisms of group schemes" (lines 62–63, 1116–1117, 1139–1140). It also calls Layers 4 and 6 "the semisimple Chevalley-datum cases over fields" (lines 1119–1120), which §4.2, §4.3 and §6.3 are not.

Smallest change: keep the statements, since ReductiveGroupsPartII consumes "§C4 / The big cell" from here, but obtain the integral ones by transport along §2.9.

- §4.2's isomorphism over ℤ and the cover come from ReductiveGroups §9B.1.
- §4.3 comes from §9B's split-reductive certification, which §2.9 already transports.
- §6.3's scheme map comes from §9B.2.
- In §7.1, take τ from §9B's special isogenies and prove only that its map on points over a perfect field of characteristic `p` is the map of §5.4.

Add these sections to the *Needs:* lines and to the ReductiveGroups supplier contract. Keep as this roadmap's own work the field-level content: `E(k) ∩ GLₙ^LDU(k) = U⁻(k) T_D(k) U(k)` from the Bruhat decomposition, §4.4, and §§6.1–6.2. The sentence at lines 1119–1120 is then true as written.

## R02 (P2) — Smoothness over ℤ and the centre are statable on the Geck carrier but are absent from `Suggested.lean`

`Suggested.lean` is the acceptance test, and it states nothing about smoothness (first clause of headline 2, Summary lines 20–21) or the centre (headline 1, line 17). Both are statable for the very carrier on which it states §4.5 and §5.4.

How I know: with the file's own imports, both of the following elaborate with only the `sorry` warning:

- `AlgebraicGeometry.SmoothOfRelativeDimension (t.rank + t.numRoots) (t.geckGroupScheme ht).X.hom`;
- `Subgroup.center (t.geckPoints ht k) = ⊥`, for `k` any field.

Both are true. The Geck carrier is the adjoint form (§2.3), so `Λ = Q`, and §3.5 with §4.4 gives the centre `Hom(Q/Q, kˣ) = 1` over every field; for instance `PGL₂(𝔽₂) ≅ S₃` and `SO₅(𝔽₂) ≅ S₆` have trivial centre. For `E₈`, `F₄` and `G₂` both are also the simply connected statements. The module docstring (lines 33–40) lists "the centre" among statements that need root subgroups for every root, which neither of these needs, and it says nothing about smoothness.

Smallest change: state both as theorems, with docstrings pointing to §3.5 (together with §4.4) and §4.3. Alternatively, say in the docstring why they are left out.

## C01 — The adjoint form of §2.3 and the Geck datum of §2.2 are different toral closures, and no target says they agree

§2.2 (lines 306–309) makes the Geck module a datum whose `G_D` uses the weights in simple-root coordinates, and its Check (lines 319–325) warns against reading the weights in `P`. But §2.3 names as the adjoint form the pinned `TauCeti.DynkinType.geckGroupScheme`, which is `kostantToralGroupScheme … (t.geckWeightFin ht)` (pinned `GeckLattice/GroupScheme.lean`, line 148). That puts the weights in fundamental-weight coordinates: their span is everything exactly for `E₈`, `F₄`, `G₂` (`GeckLattice/WeightSpan.lean`, line 101).

The two schemes are equal. The torus comorphism lands in `ℤ[Q] ⊂ ℤ[P]`, so the largest Hopf ideal killed by the generators is the same. However, §4.5 ("§4.4 finishes"), §5.4 and §6.3 apply results proved for `G_D` to `geckPoints`, and nothing states the equality. Add to §2.3 that `geckGroupScheme` is the group scheme of the Geck datum, with this one-line reason.

## C02 — Several theorems from the literature carry no locator

The following have no source locator:

- §2.4, the Weyl conjugation of root vectors with its sign;
- §3.2, §3.3, §4.3, §4.4, §5.6, §5.7 (rigidity), §5.8, §6.2 and §6.3.

§4.2 cites "Jantzen … Part II, Chapter 1, and SGA 3" without naming a statement. A reader checking a hypothesis has nowhere to look. For the open cell over a general base, Conrad, *Reductive group schemes*, Theorem 5.1.13, p. 143, states the isomorphism `U⁻ × T × U → Ω` for a split reductive group over any nonempty scheme. The other targets would take their numbers in Steinberg's *Lectures* or *Memoirs*.

## C03 — The description's list of citing roadmaps is incomplete, and one quoted title changed

The description says "CFSGStatement, CFSGBasicProperties, ReductiveGroups and LieHighestWeight cite it that way". That omits ReductiveGroupsPartII, which cites `§C2`, `§C3` and `§C4` in thirteen places by section title.

The description also says "the section titles they quote … are kept", but one is not. ReductiveGroupsPartII (line 3985) quotes "The unipotent radical and Borel subgroup", which is now §3.2 "The unipotent radical and the Borel subgroup".

Right text: "(CFSGStatement, CFSGBasicProperties, ReductiveGroups, ReductiveGroupsPartII and LieHighestWeight cite it that way)". Then either restore the old title of §3.2 or mention the change.

## N01 — Each old milestone id needs its own line

The old ids are mapped only by Convention 9's general sentence. One line per id, such as "Milestone C4 is now Layer 4", would let a reader who searches for `§C4` follow each citation.

## N02 — Some sentences describe an earlier state of the text and library maintenance

Lines 1077–1078 and 1086–1087 ("Of milestone C0, only … is a target here") and lines 1103–1104 ("an alias is retired only once its transport … is proved") would read as timeless statements of what is a target here.

## N03 — A proposed name is written in code font

Line 980 writes the proposed name `DynkinType.adjointGroupScheme` in code font, while Convention 9 writes undeclared names in italics.

## Questions for the author

- The References cite the 2016 AMS edition of Steinberg's *Lectures* "whose chapter numbering is cited here". Do its chapter and theorem numbers coincide with the section and theorem numbers of the 1967 Yale notes? Publisher descriptions mention material added to the notes. What stopped me: I could open neither edition nor the publisher's contents page.

## Verified sound

| Statement | Instances tried | Values computed (README / computed) | Result | Change |
|---|---|---|---|---|
| 0.1 structure constants, B₂ Check | `Sp₄`, `e_α = E₂₄`, `e_β = E₁₂ − E₄₃` | `[e_β,e_α] = E₁₄+E₂₃`, `[e_β,e_{α+β}] = 2E₁₃`: `N = 1, 2` against `±(r+1)` with `r = 0, 1`; the q-variant gives 2, 1 | holds | none |
| 0.1 Chevalley relation (sl₃ example) | `E₁₂, E₂₃`, `e_{−γ} = E_{ji}` | `[E₁₂,E₂₃] = E₁₃`, `[E₂₁,E₃₂] = −E₃₁`: `N_{α₁,α₂} = 1`, `N_{−α₁,−α₂} = −1` | holds | none |
| 0.1 `r` = `chainBotCoeff` | Mathlib `Weights/Chain.lean` l.266–268 | largest `n` with `−iα+β` a weight, i.e. steps down, as README says | matches | none |
| 1.1 nilpotency on `V_sc` | Mathlib `Chain.lean` l.395; pin search | hypotheses char 0, finite-dim, triangularizable, `χ ≠ 0`; no nilpotency on `scModule` at pin | genuine target | none |
| 1.2 A₂ Check | weights of `L(ϖ₁)`, `L(ϖ₂)` | `μ∘σ⁻¹`: (1,0)→(0,1), (−1,1)→(1,−1), (0,−1)→(−1,0); `−μ` sends (1,0) to (−1,0), lowest of `L(ϖ₂)` | holds | none |
| 2.1 Serre via LieHighestWeight §7.1 | main l.1751, l.2073; Suggested l.251 | hypotheses Killing, finite-dim, Cartan, triangularizable, char 0; pinned instances exist for `lieAlgebra` | resolves | none |
| 2.2 Chevalley datum, adjoint A₁ Check | Geck weights `2ϖ, 0, −2ϖ` | coordinate torus `diag(s,1,s⁻¹)` injective; P-weights `diag(s²,1,s⁻²)`, kernel μ₂; char 2: `μ₂(k) = 1` | holds | none |
| 2.2/2.3 Geck carrier against datum | pin `GroupScheme.lean` l.148, `WeightSpan.lean` l.101 | pin uses P-coordinates; span = ⊤ iff E₈, F₄, G₂; ideals agree via `ℤ[Q] ⊂ ℤ[P]` | gap | C01 |
| 2.4 Weyl sign Check | `SL₂` | `n_α(1) = [[0,1],[−1,0]]`; `n x_α(u) n⁻¹ = [[1,0],[−u,1]] = x_{−α}(−u)` | holds | none |
| 2.5 torus Check | `PGL₂(ℚ)` | `det diag(2,1) = 2 ∉ ℚˣ²`; image of `SL₂(ℚ)` misses it | holds | none |
| 2.6 pinning Check | `SL₂` | `diag(t,t⁻¹) x_α(u) diag⁻¹ = x_α(t²u)` | holds | none |
| 2.7 torus generation Check | `SL₂` | `n_α(s) = [[0,s],[−s⁻¹,0]]`, `h_α(s) = diag(s,s⁻¹)`; without the inverse `−diag(s,s⁻¹)`, value −1 at s = 1 | holds | none |
| 2.8 Frobenius | pin | `kostantToralFrobenius`, `kostantElementaryFrobenius` exist; `geckFrobenius p k` needs `ExpChar`, used with `k = 1` | holds | none |
| 3.1 commutator Checks | exact rationals, 25 points `(u,v)` | A₂ `x(uv)`; Sp₄ (1,3) entry −1 and `(−1)^j` fails; G₂ `c₃₂ = 2/3 M`, `c₂₃ = 1/3 M` hold; negating any coefficient fails | hold | none |
| 3.4 Bruhat Check | `SL₂(𝔽_q)` | `q(q−1) + q²(q−1) = q(q²−1)`; `U ∩ U⁻ = 1` | holds | none |
| 3.5 centre, every field | Tits-system argument; `SL₂(ℚ)`, `SL₂(𝔽₂)` | `Z ⊆ B ∩ B⁻ = T`, `α(h) = 1` gives `Hom(Λ/Q,kˣ)`; {±1}; `S₃` trivial = `μ₂(𝔽₂)` | holds | none |
| 3.6 rank-one relation | `SL₂` | `n_α(s) x_α(u) n_α(s)⁻¹ = [[1,0],[−s⁻²u,1]]` | holds | none |
| 4.1 flatness | pin `ToralClosure/Flat.lean` l.53, `Basic.lean` l.76 | torsion-free instance; ideal is the largest Hopf ideal killed by the generators | holds | none |
| 4.2 big cell | `SL₂`; block argument | top-left entry `t`; leading minor of `l n_w u` is `det l₁₁ det(n_w)₁₁ det u₁₁`; integral part duplicates RG §9B.1 | true, re-planned | R01 |
| 4.3 dimension Check; statability | `SL₂`, `G₂`; probe | 1+2 = 3, 2+12 = 14, `rank + #Φ⁺ = 2`; smoothness on `geckGroupScheme` elaborates | true, absent | R01, R02 |
| 4.5 / `closure_geckRootSubgroupPoints_eq_top` | `PGL₂(𝔽̄_p)`, `PGL₂(ℚ)`, B₂ over 𝔽₂ | onto over alg. closed; fails over ℚ; `⟨x_a(1),x_b(1)⟩ ≅ D₈ ≠ U` (order 16) | holds; `simp` fails | none |
| 5.1 Checks | conjugation on `SL₂(ℂ)`; `Ẑ∖ℤ`; `𝔽_q` | `2̄ = 2^m` gives m = 1, `ī = −i`; `p^a = ±p^b` forces a = b; `s^q = s` | hold | none |
| 5.3 D₄ orientation | pin `DiagramAutomorphism.lean` l.424 | `ϖ_j ↦ ϖ_{σ⁻¹j}`; `(diagramAut σ)⁻¹.weightMap = funCongrLeft σ` | holds | none |
| 5.4 / `exists_specialIsogeny` | B₂ exponents; `IsLongSimpleRoot` B₂ | (1,2): 2 = 2; (2,1): `s⁻¹ = s⁻⁴` fails at `s` of order 7 in `𝔽₈ˣ`; node 0 long | holds | none |
| 5.4 B₂ transport | `G_sc(B₂) → geckPoints`, char 2 | kernel `Hom(P/Q,kˣ) = μ₂(k) = 1`; onto by §4.5 | holds | none |
| 5.5 Checks | `PGL₂(ℚ)`, `δ = v₂(det) mod 2` | agree on roots and `[diag(s²,1)]`; differ at `[diag(2,1)]` | holds | none |
| 5.6 route and Check | `Int(n)∘Frob_p` on `SL₂` | torus `s ↦ s^{−p}`, `F² = Frob_{p²}`; `(1+g)(1+1/g) = 1` gives `g²+g+1 = 0` | holds | none |
| 5.7 Lang | `Frob_q`; `r = 0`; pin `CharacterMap.lean` l.84 | `u^{1−q} = s` solvable; `F = id` misses all `s ≠ 1`; `x_β(c)x_{−β}(−c₋)x_β(c)` diagonal `1 − cc₋` | holds | none |
| 5.8 Steinberg maps | `τ³` on B₂; pin `Assembly.lean` l.184 | `τ⁶ = Frob_8`; `(γ_σ Frob_q)^{ord σ} = Frob_{q^{ord σ}}` | holds | none |
| 6.2–6.3 comparison | `SL₂ → PGL₂` over ℚ and 𝔽₂ | `res = s ↦ s²`, cokernel `ℚˣ/ℚˣ²`; both groups of order 6 over 𝔽₂ | true; scheme map duplicates RG §9B.2 | R01 |
| 7.1 Check; ownership | RG §9B l.5193; pin special isogenies | bijective on `𝔽̄_p` points, not an isomorphism; τ already built by RG/pin | true, re-planned | R01 |
| Headlines 1, 4 (Summary) | against §3.4–3.6, Layer 6 | centre `Hom(Λ/Q,kˣ)`; `Λ(D′) ⊆ Λ(D)` gives `G_D → G_D′` (`SL₂ → PGL₂`) | consistent | none |
| Centre on Geck carrier | `PGL₂(𝔽₂)`, `SO₅(𝔽₂)`; probe | `S₃`, `S₆` centreless; `Hom(Q/Q,kˣ) = 1`; `Subgroup.center … = ⊥` elaborates | statable, absent | R02 |

- Source locators checked against the text: 1 (Conrad, *Reductive group schemes*, proof of Theorem 1.1.19, p. 15, for §5.1: supports the claim as stated), plus Conrad Theorem 5.1.13, p. 143, read for C02; the 12 Steinberg locator sites are not verifiable.
- Library declarations opened at the pins: 32, among them Mathlib `LieModule.isNilpotent_toEnd_of_mem_rootSpace` (`Algebra/Lie/Weights/Chain.lean` l.395) and `chainBotCoeff` (l.268); Tau Ceti `geckGroupScheme` (`GeckLattice/GroupScheme.lean` l.148), `kostantToralDefiningIdeal` (`ToralClosure/Basic.lean` l.79), `exists_geckWeightTorusPoints_eq_mul_inv` (`GeckLattice/CharacterMap.lean` l.84), `diagramAut_inv_weightMap` (`DiagramAutomorphism.lean` l.424), `finiteDimensional_irreducibleQuotient_of_isDominantIntegral` (`HighestWeight/FiniteDimensional.lean` l.136, no `IsAlgClosed`); all 116 `TauCeti.*` names of the README exist at the pin.
- Cross-roadmap citations resolved on main (1b7b481): 9, namely ReductiveGroups Layer 9 (l.3868), §9B (l.4510), §9B.1–§9B.3 (l.4592, 4669, 4733), *Elementary generators and all ring points* (l.5148) and *Special isogenies in characteristics two and three* (l.5193); LieHighestWeight §7.1 with `serreLift_injective_of_base` (l.1751, l.2073; `Suggested.lean` l.251); RootSystems §6.2 (l.1448).
- Downstream citations of C0–C7 read: ReductiveGroupsPartII (13 lines), CFSGStatement (11), LieHighestWeight (2), ReductiveGroups (3); every quoted title exists except the one in C03.
- Automatic checks: all passed; dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`, no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 2 warnings, both `sorry`; a separate file of `#check @` lines gives types matching README §4.5 and §5.4, with no binder lost (the file has no section `variable`s).
- Padding probe: `simp` on the closure headline makes no progress; the pin has no generation theorem and no special isogeny for `geckPoints`, so 0 of 2 declarations are padding; the 3 removed declarations restated pinned ones and no other roadmap's Lean file uses them.
- Matrix Checks recomputed in exact rational arithmetic: A₂, Sp₄ in both orders, and G₂ in both orders, at 25 parameter points each, plus 4 sign-negation controls.

Overlap check: read CFSGStatement, ReductiveGroups and LieHighestWeight (and ReductiveGroupsPartII, which cites C2–C4). Shared with ReductiveGroups: the integral big cell, smoothness and fibres, the scheme-level comparison and the scheme-level special isogenies; owner ReductiveGroups §9B.1, §9B.2 and *Special isogenies* (R01). Serre's theorem for the pinned algebra: owner LieHighestWeight §7.1, cited here. CFSGStatement consumes Layers 2–7, nothing shared. Open pull requests: none changes this roadmap, none drops a cited id, and no open roadmap is close in vocabulary.

Source independence: 5 passages compared with 2 sources, none shared (§5.1 against Conrad's proof of Theorem 1.1.19, p. 15; §4.2 against Conrad's Proposition 1.4.11; the Layer 0 introduction against Geck 2017, Example 5.9; §2.3 with the module docstring, and the docstring of `closure_geckRootSubgroupPoints_eq_top`, against Geck 2017, §4.10). Largest share: Steinberg, *Lectures on Chevalley Groups*, 12 of 14 locator sites. Contents compared with Steinberg: not tested, since neither its text nor its contents page could be read. By the chapter topics the README itself lists, there is no one-to-one run: Layer 3 draws on Chapters 3 and 6, Layer 6 on Chapter 3 after Layers 4–5, and Layers 2, 4 and 7 carry integral scheme theory beyond the book. The order of Layers 3 to 7 is forced by the *Needs:* lines.

Research link: Layers 2–7 are the Chevalley–Steinberg theory of Chevalley groups and their endomorphisms (Steinberg 1967; *Memoirs AMS* 80, 1968), on which the finite groups of Lie type of the classification of finite simple groups rest; CFSGStatement and CFSGBasicProperties consume it, and Layer 0 follows Geck (2017). Rests on the README (Summary, Downstream consumers, References) and Geck 2017 §4.10.

## Not verifiable

- Steinberg, *Lectures on Chevalley Groups*: Ch. 1 Thm 1; Ch. 3 Lemmas 15, 19, 28(c),(d), Thms 4, 4′ and Cors 3–5; Ch. 5 Thm 7; Ch. 6 Thm 8; Ch. 10 Thms 28, 29. Where I looked: the sources service found no legal source, the publisher's book pages refused access, and a web search found no open copy.
- Jantzen, *Representations of Algebraic Groups*, Part II, Ch. 1, and SGA 3 (§4.2): cited without a statement to check; Jantzen is not openly available.
- Carter and Humphreys: listed in the References only, with no locator to check.

Automatic checks set aside as false positives: the extraction of declarations read the module docstring's phrase "a structure of `README.md`" (`Suggested.lean`, line 45) as a declaration named `of`. As a result, the computed change lists `of` as an added Lean declaration and the signature listing reports an unknown identifier. No such declaration exists.

## Source issues

- none

## For the human reviewers

- Not tested: Steinberg, *Lectures on Chevalley Groups* has the largest share of locators (12 of 14 README locator sites, and both docstrings of `Suggested.lean`), and it could not be read legally. Wording and arrangement were not checked against it.

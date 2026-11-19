# Review of DGAInfinity (pull request #2574 at 9f84816)

**Verdict:** accepted

**Summary.** This head repairs both findings and both small corrections of the previous review, and the repairs introduce no false statement. Each repaired passage was checked by computation or against its source:
- the §0.2 hypothesis that every tensor power is nonzero, and its `ℚ/ℤ` Check;
- the §8.3 hypotheses `x·y = 0 = y·z`, the route for the `n`-fold statement, and the new Check;
- the §2.4 construction for bimodules with strict right action;
- the §6.5 locators into Toën;
- the §9.1 comparison with Keller's notion of properness.

There are no small corrections and two format notes, neither blocking. Two ownership facts are still left to the human reviewers.

## N01 — §§10.3 and 10.4 still carry no locator at the claim

The Serre identity of §10.3 (line 1683) and the radical comparison of §10.4 (line 1699) cite no source at the claim. Bondal–Kapranov appear only in the Layer 10 introduction (line 1648). §6.5, the third target the previous note listed, now has its locators.

## N02 — In the Layer 8 introduction, "is proved there" could be read as pointing to Keller

Line 1378 reads "the precise comparison of §8.3 is proved there from the component equation of §2.2". Directly after the clause about Keller, Section 3.3, the word "there" can be read as Keller's section, which only remarks the lift. "is proved in §8.3" would say what is meant.

## Previous findings

- R01 — repaired: "not conilpotent as soon as every tensor power `M^{⊗n}` is nonzero (for instance `M ≠ 0` over a field, or `M` with a nonzero free direct summand)", with a new Check showing `M = ℚ/ℤ` over `ℤ` is conilpotent.
- R02 — repaired: "Over a field, when `x·y = 0` and `y·z = 0`, the `m₃` of the minimal model … lies in it", and the ring-level target says "whenever `x·y = 0 = y·z`". `Suggested.lean`'s docstring and a new Check (`⟨1, 1, 1⟩ = ∅` for `A = k`) agree.
- C01 — repaired: "Route: for the transferred inclusion `f : H → A`, evaluate the component equation of §2.2 on each consecutive sub-tuple of length `ℓ < n` …". The Layer 8 introduction now says Keller only "remarks" the lift (wording: N02).
- C02 — repaired: the Layer 5 introduction ends at "the compact objects are the perfect modules". Balmer–Schlichting are now credited in Scope and ownership, for the idempotent-completion caveat.
- N01 — partly repaired: §6.5 now cites "Toën, Definition 7.1 and Theorem 7.2(2), with the internal Hom of Theorem 6.1". §§10.3 and 10.4 still lack locators (N01 above).
- N02 — repaired: "This is the locally proper notion: Keller's survey (Section 4.7) calls `C` proper when it is Morita equivalent to a DG algebra whose underlying complex is perfect …".
- Question on §2.4 — answered: "call the right action … strict when `b_{i,j} = 0` for `j ≥ 2` and for `i ≥ 1, j = 1`". The comparison is now a one-way construction, "not an identification".

## Verified sound

| Statement | Instances tried | Values computed (README / source or library) | Result |
|---|---|---|---|
| §0.2 non-conilpotence (R01) | `M = k·x`; `V ≠ 0` over a field; `k = ℤ`, `M = ℚ/ℤ` | the `(1,…,1)` coordinate of `Δ̄^{(n)}((y_m)_m)` is `y_{n+1}`, nonzero when all `M^{⊗m} ≠ 0`; `ℚ/ℤ` fails the hypothesis | true |
| §0.2 Check `ℚ/ℤ` | `x = 1/3`, `y = 1/2` | `x = 2·(1/6)`, `x ⊗ y = 1/6 ⊗ 2·(1/2) = 0`; completed = `M`, `Δ̄ = 0`: conilpotent | true |
| §0.2 carrier | `ReducedCompleted.lean` line 35 | `∀ n : {n // 0 < n}, TensorPower R n M`, ungraded product over any commutative semiring | matches |
| §2.4 strict right action | bimodule identities `(0,2)`, `(0,1)`, `(i,1)`; Tau Ceti `b i j` (Components.lean 49: `i` left, `j` right) | `(0,2)`: associativity; `(0,1)`: Leibniz; `(i,1)`: `b_{0,1}(b_{i,0}(a,x),b) = ±b_{i,0}(a,b_{0,1}(x,b))` | true |
| §2.4 construction to `Aᵒᵖ ⊗ B` | arity-`n` module identity with §2.1's `m^C` | `B`-parts collapse to `b_1⋯b_{n−1}`; `d b_j` terms of `m₁^C` cancel those of `d_M(y·b)` by Leibniz | true; one-way |
| §6.5 Toën locators | Toen2007 lines 1220–1232, 1111–1113; `C = k` | Def 7.1(2) `RHom(Ĉ_pe, D̂_pe)`; 7.2(2) `h*` onto `RHom(C, D̂_pe)`; `C=k`: bimodules with `X(∗,−)` perfect | true |
| §8.3 triple (R02) | `A = k`, `x=y=z=1`; Massey.lean 60–61, Algebra/Massey.lean 228–229 | Tau Ceti assumes `hxy`, `hyz`; `⟨1,1,1⟩ = ∅` as `1·1 ≠ 0`; `m₃^H = 0` | repaired |
| §8.3 Check | `A = k` in degree 0 | contraction trivial, `h = 0`, `m₃^H(1,1,1) = 0`; nonempty iff `xy = 0 ∧ yz = 0` | true |
| §8.3 `n`-fold route (C01) | §2.2 component equation, DG target, `ℓ < n` and `ℓ = n` | `ℓ<n`: all `f_u(1⊗m_s⊗1)` (`2≤s≤ℓ`) vanish, `d f_ℓ = Σ ± f_a f_b`; `ℓ=n`: `Σ ± f_a f_b = ± f₁m_n(x) − d f_n` | true |
| Layer 8 example vs §8.3 | `⟨[a],[a],[b]⟩`, `Λ(a,b,c)`, `dc = ab` | `[a]² = 0`, `[a][b] = [dc] = 0`: new hypotheses hold; value `{[ac]}` | consistent |
| §3.4 (cited by §8.3) | over a field | minimal model, inclusion inducing identity on cohomology: the `f` of §8.3's route | consistent |
| §9.1 properness (N02) | finitely many objects; `⊔_{ℕ} k`; KellerICM2006 lines 905–909 | finite: Morita to `⊕ C(x,y)`, perfect; `⊔ k`: compacts finitely supported, `k` elsewhere orthogonal | true |
| Layer 5 intro (C02) | §5.5, Scope bullet line 1895 | §5.5 uses thick subcategory of `D(C)`; Balmer–Schlichting only in Scope | consistent |
| `Suggested.lean` docstring | Massey.lean line 60 | docstring "`x y = 0` and `y z = 0`" equals `hxy`, `hyz` | true |

The rows for statements this change does not touch stand as in the previous review, of `5328c9a`.

- Source locators checked against the text (6): Toen2007 Definition 7.1, Theorem 7.2(1)–(2), Theorem 6.1 (arXiv v7, the cached version); KellerICM2006 §4.7 (lines 905–909); KellerIntro2001 §3.3 (lines 293–297).
- Library declarations opened at the pins (6): Tau Ceti `TensorCoalgebra/ReducedCompleted.lean` 35, 131; `AInfinity/Algebra/Transfer/Massey.lean` 60, 97; `AInfinity/Algebra/Massey.lean` 126, 228; `AInfinity/Bimodule/Components.lean` 49.
- Cross-roadmap citations resolved: GeneralAlgebraicKTheory §§11.3, 11.4, 11.4a, 11.6, 11.7 (main). Consumers BordismFormalGroups and RationalHomotopyModels cite Layers 0 and 8, and both are present. The citation tool's one unresolved name, `InternalGrading.IsHomogeneous`, is declared at `Suggested.lean` line 81.
- Dependency check: `depcheck: 200 roadmaps, 2200 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).
- Gate on this head: every check passes (`OK`), with nothing outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` reports only the three `sorry` warnings (lines 101, 114, 125). The Lean statements are unchanged, and only the module docstring changed, so the `#check` comparison and the one-tactic probe of the previous review stand.
- Pull-request description against the head: 43 Checks in 30 blocks and 52 *Needs:* lines, as stated. The §8.3 and §2.4 entries describe this head.

Overlap check: read HochschildHomologyAndHKR, ZigzagPreprojective, RationalHomotopyModels and DerivedInfinityCategories (open heads), StablePeriodicCurved, GrothendieckEulerForms, HopfologicalAlgebra and BordismFormalGroups. The Morita bicategory of §6.5 is stated nowhere else. Massey products are owned here; RationalHomotopyModels and BordismFormalGroups consume Layer 8, and BordismFormalGroups' Toda brackets are a different object. One shared object remains, as before: the `K₀` sequence for a thick subcategory, owned by §7.4 here and also stated by HopfologicalAlgebra §6.1, which consumes this roadmap. It is left to the human reviewers.

Source independence: changed passages only. 6 passages compared with 3 sources (Toen2007, KellerICM2006, KellerIntro2001); none shared beyond the dozen-word definition of Keller's properness and the standard term "perfect Morita morphisms". No layer was added, removed or reordered, so the arrangement stands as in the previous review: largest share KellerIntro2001, about 19 of about 100 source mentions, independent of its contents.

Research link: Layers 3, 6 and 9 state Kadeishvili's minimal-model theorem (1982), Keller's derived Morita theorem (1994) and Keller's deformed Calabi–Yau completions (2011). ZigzagPreprojective builds its Ginzburg algebras (§6.1) and Koszul theory (§5.2) on these. This rests on the README (§§3.4, 6.4, 9.3, Downstream consumers) and on KellerDeriving1994 §8.1.

## Not verifiable

- The published Inventiones numbering of Toën was not compared. The README states that it follows arXiv v7, which is the version read.
- The texts the previous review could not open (Bondal–Kapranov, Shklyarov, May, Balmer–Schlichting, Schlichting, Thomason and others) are still unopened. No changed passage rests on them alone.

## Source issues

- none

## For the human reviewers

- Ownership: §7.4 states the `K₀` sequence for a thick subcategory of an essentially small triangulated category. HopfologicalAlgebra §6.1 states the same (main, `TauCetiRoadmap/HopfologicalAlgebra/README.md` lines 605–611) and says it "is proved in §6.1 and not imported" (lines 47–49). HopfologicalAlgebra consumes DGAInfinity. The choice is yours.
- `TauCetiRoadmap/StablePeriodicCurved/Suggested.lean` (main, line 2) imports this roadmap's Lean module. That is why `Suggested.lean` keeps three graded definitions that no headline here uses.

# Review of RationalAnalyticPrismatization (design, round 7)

**Verdict:** needs changes

Ten findings, four blocking (P2). All four round-6 findings are repaired. The blocking findings are in text no earlier round sampled with computed values (1.2, 9.2, 11.10); none re-raises a settled finding. Files reviewed: `packages/RationalAnalyticPrismatization/design/README.md` (1868 lines, 12 layers, 88 targets, 21 declared gaps), `packages/RationalAnalyticPrismatization/design/plan.json`, `packages/RationalAnalyticPrismatization/sources.toml`. No file of the design was changed and nothing was added to the manifest.

## R01 (P2) — 1.2 defines the norm rings without overconvergence, which its own Checks contradict

**Location.** `packages/RationalAnalyticPrismatization/design/README.md` line 252 (1.2) and the same `statement` in `plan.json`: "let ℚ_{p,■}⟨ℕ[S]⟩_{≤r} be the solid subring of ℚ_{p,■}⟦ℕ[S]⟧ of power series converging on the polydisc of radius r".

**Claim.** The ring that defines A_{≤r}, Nil†(A) = A_{≤0} and (through A_{≤1}) the uniform completion is the ring of series convergent on the closed polydisc of radius r.

**Witness.** ABLB line 686–691 (Definition 2.2.3): series Σ a_n for which some r′ > r has |a_n| r′^n → 0; ABLB line 694 calls them overconvergent. As written (|a_n| r^n → 0) the ring for r = 1 is the Tate algebra, so A_{≤1} = A° of 1.1, and for r = 0 it is all of ℚ_p⟦T⟧. For A = colim_n ℚ_p⟨T/p^n⟩ there is no map ℚ_p⟦T⟧ → A with T ↦ T (Σ p^{−n²}T^n has no image), so T ∉ A_{≤0}, against the Check at line 269; for A = ℚ_p⟨T⟩_{≤1} the series Σ p^n T^{n²} lies in ℚ_p⟨T⟩ and has p^{−n} r^{n²} → ∞ for every r > 1, so T ∉ A_{≤1}, against the Check at line 291 (A^u = ℚ_p⟨T⟩).

**Repair.** Replace the quoted clause, in README and `plan.json`, by "be the solid subring of ℚ_{p,■}⟦ℕ[S]⟧ of overconvergent power series on the polydisc of radius r: the series Σ_n a_n for which there is r′ > r with |a_n| r′^n → 0". Tested on the two instances: for the germ ring, T ↦ T extends to ℚ_p{T}† = colim_n ℚ_p⟨T/p^n⟩, so T ∈ Nil†(A); for ℚ_p⟨T⟩_{≤1}, the identity extends, so T ∈ A_{≤1}; for A = ℚ_p⟨T⟩ still A_{≤1} = ℤ_p⟨T⟩.

## R02 (P2) — 1.2 states the †-nilradical ideal, the †-reduction and the pullback square for every solid ℚ_p-algebra

**Location.** README line 252: "For a solid ℚ_p-algebra A define … Define the †-reduction A^{†-red} = A/Nil†(A), a static solid ℚ_p-algebra … Prove that A_{≤1} → A^{†-red}_{≤1} over A → A^{†-red} is a pullback square"; line 261: "Nil†(A) is an ideal of A".

**Claim.** Nil†(A) is an ideal, A/Nil†(A) is a ring and ABLB Proposition 2.2.20 holds for all solid ℚ_p-algebras.

**Witness.** ABLB line 972–975 and line 981: the ideal property, Definition 2.2.19 and Proposition 2.2.20 are for bounded A; `plan.json` 1.2 `hypotheses` says "A is a bounded solid ℚ_p-algebra", the README sentence does not. For A = ℚ_p⟦T⟧[1/T]: T ∈ Nil†(A) (the inclusion of germs into ℚ_p⟦T⟧), T is a unit, and 1 ∉ Nil†(A) (T ↦ 1 would send the unit 1 − T of the germ ring to 0). Nil†(A) is not an ideal.

**Repair.** In line 252 keep "For a solid ℚ_p-algebra A define A_{≤r}(S) …, A_{<r} … and Nil†(A) = A_{≤0}" and change the next sentences to "… For bounded A, Nil†(A) is an ideal (RC24 Proposition 2.6.9(3), as ABLB line 972 recalls); define the †-reduction of a bounded A as A^{†-red} = A/Nil†(A) … Prove that for bounded A the square … is a pullback"; in line 261 write "For bounded A, Nil†(A) is an ideal of A …"; add the negative-control Check "For the unbounded A = ℚ_p⟦T⟧[1/T], T lies in Nil†(A) and is a unit while 1 does not lie in Nil†(A): the †-nilradical is an ideal only for bounded algebras". Mirror in `plan.json` (statement, api, tests). Tested: ℚ_p⟦T⟧[1/T] is not bounded (p^n·T^{−1} never extends to ℤ_p⟨X⟩, the image of Σ p^k X^k being an infinite Laurent tail), so the repaired statements exclude it.

## R03 (P2) — 9.2 drops the hypothesis that T_{X/D} is a vector bundle

**Location.** README line 1255 (9.2) and `plan.json` 9.2 `statement`: "so that for X → D formally smooth X^{HT/D} → X is a gerbe banded by T^†_{X/D}{1}", and "For formally smooth X → D prove that the pushout of X^{HT/D} along BT^†_{X/D}{1} → BT_{X/D}{1} is the stack of square-zero lifts".

**Claim.** Formal smoothness of X → D suffices for the gerbe statement.

**Witness.** ALRS line 3548–3550 (Proposition 4.4.4(2)): "formally smooth with T_{X/D} a vector bundle". In 4.6 (README line 789; ALRS line 9586–9588) formally smooth means L is the dual of a connective perfect complex. X = D × BG_a has L_{X/D} = O[−1], T_{X/D} = O[1]: formally smooth, T not a vector bundle, T^† undefined, and the fibre of 0 and d̃_X into (O{1}[3])^† is a torsor under B²G_a^†{1}, not a gerbe banded by a group. 9.1 (line 1240) keeps the hypothesis ("formally smooth X with tangent bundle T_X").

**Repair.** In both sentences write "for X → D formally smooth with T_{X/D} a vector bundle, T^†_{X/D} its overconvergent neighbourhood of the zero section", in README and plan; add "T_{X/D} a vector bundle in the gerbe statements" to plan 9.2 `hypotheses`; add the Check "For X = D × BG_a the map X → D is formally smooth with T_{X/D} = O[1], not a vector bundle; X^{HT/D} → X is then a torsor under B²G_a^†{1}, not a gerbe banded by a group". Tested: the instance is excluded by the added hypothesis; for X = D (T = 0) and for a smooth curve over C (T a line bundle) the existing Checks are unchanged.

## R04 (P2) — 11.10 states ALRS Proposition 6.4.12 without its standing hypotheses

**Location.** README line 1716 (11.10) and `plan.json` 11.10 `statement`: "in the geometric and mixed cases, if θ^geo (resp. θ^mix) is surjective, then β_*O = O^la_{X̃̂^⋄} is static on a strict closed basis and X^HT ≅ GSpec_{|X̃|}(O^la_{X̃̂^⋄})/G^la", under "a p-adic Lie group G and a pro-étale G-torsor X̃^⋄ → X^⋄".

**Claim.** The description holds for every p-adic Lie group G and every pro-étale G-torsor.

**Witness.** ALRS line 8539–8544, the notation Proposition 6.4.12 keeps (line 8545): X̃^⋄ → X^⋄ is a profinite étale Galois extension with group a compact p-adic Lie group G, X̃ → X the associated G^sm-torsor, and the statement is about β̃: X^HT → |X̃|^Betti/G^la, with β̃_*1 = O^la. The space |X̃| over which GSpec is taken exists only for such a tower; no instance outside these hypotheses could be computed, the source proves none.

**Repair.** Replace the clause by "for G compact and X̃^⋄ → X^⋄ a profinite étale Galois extension with group G, with X̃ → X the associated G^sm-torsor and β̃: X^HT → X̃/G^la → |X̃|^Betti/G^la: if θ^geo (resp. θ^mix) is surjective, then β̃ is 0-affine, β̃_*O = O^la_{X̃̂^⋄}, the sheaf on |X̃| of locally analytic sections, static on a strict closed basis, and X^HT ≅ GSpec_{|X̃|^Betti}(O^la_{X̃̂^⋄})/G^la", in README and plan, and add "G compact and the torsor profinite étale Galois in the last clause" to plan 11.10 `hypotheses`. Tested: for K_∞ = K(μ_{p^∞}), d = 0, G = Γ ≅ ℤ_p^× compact, the clause reads K^HT = GSpec(K(μ_{p^∞}))/Γ^la, the first Check of 11.10.

## R05 (P3) — 10.1 cites EnhancedDerivedSheaves §E5:abstract.2 for monadicity, which is §E5:abstract.5

**Location.** README line 62: "algebras and modules with monadicity (§E5:abstract.2)"; line 1388 (10.1): "by monadicity of the conservative, limit- and colimit-preserving forgetful functor"; line 1390 `*Needs:*` "EnhancedDerivedSheaves §E5:abstract.2".

**Claim.** §E5:abstract.2 supplies the Barr–Beck–Lurie theorem.

**Witness.** `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` on main: line 1456 "### E5:abstract.2 Algebras, modules and the monoidal envelope" (`operadicAlgebras`, no monadicity); line 1570 "### E5:abstract.5 Monadicity", `barrBeckLurie`.

**Repair.** Line 62: "algebras and modules (§E5:abstract.2), monadicity (§E5:abstract.5)" and add §E5:abstract.5 to "Sections consumed"; add "EnhancedDerivedSheaves §E5:abstract.5" to the `*Needs:*` of 10.1, to the Layer 10 Dependencies, to plan 10.1 `prerequisites` and to the plan's EnhancedDerivedSheaves `sections`. Tested: for Π trivial the forgetful functor Mod_R(D(ℤ_■)) → D(ℤ_■) is conservative and preserves colimits, and `barrBeckLurie` returns LMod_R, the first Check.

## R06 (P3) — the Mathlib and Tau Ceti contracts record superseded pins and stale line numbers, and say nothing of `TauCeti.LocallyAnalytic`

**Location.** README line 35 "Use Mathlib pin 6b7abb3c…", line 44 "Use Tau Ceti pin a91d3aaf… The pinned library contains no Gelfand rings, prismatization, locally analytic vectors, …", lines 37, 39, 46–48; `plan.json` `baseline`.

**Claim.** The cited declarations are at the stated files and lines of the pinned libraries.

**Witness.** `lake-manifest.json` pins Mathlib `1b1ccf4b…` and Tau Ceti `2fd255d9…`. At these pins: `LightProfinite` Basic.lean:44 (not :42), `LightCondensed` :29 (:28), `WittVector.fontaineTheta` :166 (:165); `frobeniusHomeomorph` Y.lean:220 (:218); `IsRadiusLowerBound`/`IsRadiusUpperBound` Window.lean:102, :108 (:97, :103), `isRadiusLowerBound_comap_frobenius_iff` :149 (:144), `windowU`/`windowV` :260, :267 (:255, :262); `spaX` Quotient.lean:59 (:56), `compactSpace_spaX` :259 (:200), `t0Space_spaX` :271 (:212). `TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45` now defines `TauCeti.LocallyAnalytic`.

**Repair.** Update the two pin hashes (README and plan `baseline`) and the eleven line numbers above; the unchanged ones stand (`MulRingSeminorm` :61, `spectralNorm` :381, `WittVector` :52, `BDeRhamPlus` :75, `PadicComplex` :137, `spaY` Y.lean:116). After "no … locally analytic vectors" add "it contains `TauCeti.LocallyAnalytic` (TauCeti/NumberTheory/Padics/Distribution/LocallyAnalytic.lean:45), the algebraic direct limit of analytic stages of functions on ℤ_p with its evaluation into C(ℤ_p, E), without topology and without Amice's theorem; 10.4 for d = 1 is compared with it", and add that comparison as a Check of 10.4. Tested: every name resolves at the new pins at the lines given.

## R07 (P3) — 2.8 cites ABLB Proposition 4.5.4 for the perfectoidization functor

**Location.** README line 549 (2.8): "Construct the perfectoidization functor (−)^⋄ … with GSpec(A)^⋄ = Marc(A^u), and its left adjoint … (ABLB Proposition 4.5.4, p. 51, ABLB line 2729; ABLB Proposition 4.5.5, p. 52, ABLB line 2737; …)".

**Claim.** ABLB Proposition 4.5.4 constructs (−)^⋄.

**Witness.** ABLB line 2729–2731: Proposition 4.5.4 is X^DR(A) = X(A^u) for the big de Rham stack. The functor (−)^⋄, GSpec(A)^⋄ = Marc(A) and Marc(A^u) ≅ Marc(A) are ABLB Lemma 4.5.1, p. 51, ABLB line 2690–2693, which also gives the morphism of ∞-topoi cited at line 557.

**Repair.** Replace "ABLB Proposition 4.5.4, p. 51, ABLB line 2729" by "ABLB Lemma 4.5.1, p. 51, ABLB line 2690" in README, plan 2.8 `statement`/`locator` and the ABLB `locator` of the manifest if it lists it. Tested: Lemma 4.5.1(2) gives the first Check, GSpec(ℚ_p[ε]/ε²)^⋄ = Marc(ℚ_p).

## R08 (P3) — 7.3 defines T_{FF} on all δ-spaces

**Location.** README line 1041 (7.3): "the δ-stacks T_{Spc^δ}: (S, 𝒳) ↦ T(𝒳) and T_{FF}: (S, 𝒳) ↦ T(𝒳/φ^ℤ) for a Gelfand stack T".

**Claim.** T_{FF} is an analytic δ-stack on Spc^δ.

**Witness.** ALRS line 2655–2659: T_{FF} is defined on perfect δ-spaces and has its Frobenius automorphism trivialized. On a non-perfect δ-space φ_𝒳 is only an endomorphism (ALRS line 2398–2399) and 𝒳/φ^ℤ is not a quotient by a group action.

**Repair.** Write "the analytic δ-stack T_{Spc^δ}: (S, 𝒳) ↦ T(𝒳), its restriction T_{PerfSpc^δ} to perfect δ-spaces, and the perfect analytic δ-stack T_{FF}: (S, 𝒳) ↦ T(𝒳/φ^ℤ) on perfect δ-spaces", and in the fourth API bullet "the perfect analytic δ-stack T_{FF} has trivialized Frobenius automorphism". Tested: on the classical perfect δ-space (S, D^×_{FF,S}), 𝒳/φ^ℤ = FF_S, as 7.4 uses.

## R09 (P3) — 12.1 says "Smooth and rigid smooth maps are locally †-l.c.i."

**Location.** README line 1742 (12.1), last sentence: "Smooth and rigid smooth maps are locally †-l.c.i., hence locally †-finitely presented."

**Claim.** Smooth maps, unqualified, are locally †-l.c.i.

**Witness.** The roadmap's notions are rigid smooth and Berkovich-smooth (4.2). ALRS line 1351–1362 (Warning 2.6.13): classical smoothness of rigid spaces does not give Berkovich-smoothness; the closed unit disc GSpec(ℚ_p⟨T⟩) is neither. Its only strict closed piece containing the Gauss point is itself (1.6, first Check), and ℚ_p⟨T⟩ is not a †-rational localization of A¹ (that is ℚ_p⟨T⟩_{≤1}).

**Repair.** "Berkovich-smooth maps, in particular rigid smooth maps, are locally †-l.c.i., hence locally †-finitely presented (ALRS §2.1, p. 14, ALRS line 699): a †-rational localization A⟨f/g⟩_{≤1} = A⟨T⟩_{≤1}/L(gT_i − f_i) is a regular Zariski closed immersion into an overconvergent polydisc." Add the Check "The closed unit disc GSpec(ℚ_p⟨T⟩) → GSpec(ℚ_p), smooth as a rigid space, is not Berkovich-smooth (ALRS Warning 2.6.13) and is not covered by this sentence". Tested: the open unit disc is rigid smooth, an increasing union of †-rational localizations {|T| ≤ r}, r < 1, of A¹, and is covered.

## R10 (P3) — two wording slips in proof inputs: |p| in 10.4, and an unrecorded citation in 12.1

**Location.** README line 1444 (10.4): "for |p| ≤ 1/2 and 1 < r < 2, a Hopf Λ°-algebra" and "for 1 < r < 2 and |p| ≤ 1/2 the natural map f"; line 1744 (12.1 route): "as in the proof of Lurie's characterization of finitely presented animated rings".

**Claim.** |p| ≤ 1/2 is a condition; the Lurie result is a recorded source.

**Witness.** The Conventions (line 17) fix |p| = p^{−1} ≤ 1/2, which makes the condition empty; ALRS line 5411 and line 5492 have |p|_ϖ ≤ 1/2 for the ϖ-normalized norm (the route at line 1446 writes |p|_ϖ). ALRS line 8641 cites the characterization as Lur17 Theorem 7.4.3.18; `sources.toml` has no entry for it and the README gives no locator.

**Repair.** Write |p|_ϖ ≤ 1/2 in both places of line 1444 and in plan 10.4. For line 1744 either cite "(ALRS Definition 6.5.2(1), p. 160, ALRS line 8640, the equivalence of (a) and (b))", which needs no new source, or record Lurie's Higher Algebra, Theorem 7.4.3.18, in the manifest through the sources service. Tested: for Λ = ℚ_p(p^{1/2}) with ϖ = p^{1/2}, |p|_ϖ = 1/4 ≤ 1/2 holds; for ϖ = p², |p|_ϖ = 2^{−1/2} > 1/2 fails, so the condition is not empty.

## Verified sound

**Round-6 ledger.**

| Finding | State | Repaired passage read at the head |
|---|---|---|
| F01 (P2) 4.5 cited RefinedTraceMethods §1.10 for animated rings | repaired | README line 774: "RefinedTraceMethods §1.10 defines the filtration on commutative rings as the left Kan extension of the Postnikov filtration τ_{≥k}HH(P/ℤ) of polynomial ℤ-algebras P; the same left Kan extension from polynomial ℤ-algebras to animated ℤ-algebras (EnhancedDerivedSheaves §E5:animation.1) defines Fil^• on HH(A(S)/ℤ)"; "HH(A/ℤ) = S¹ ⊗ A … functorial in the space (RefinedTraceMethods §1.7)". `*Needs:*` (776), contract (62, 162), Layer 4 Dependencies and plan carry §1.7, §E5:animation.1, §E5:cotangent-export.2. Resolved: RefinedTraceMethods at its open head, "### 1.7 The commutative circle-tensor property" ("(or animated rings)") and "### 1.10 Derived HKR…" ("map of commutative rings"); EnhancedDerivedSheaves on main line 1900 (`animationExtension`, line 1927), line 2905 (`animatedExteriorPower`). |
| F02 (P3) 6.1 `*Needs:*` | repaired | line 930 ends "Tau Ceti `TauCeti.FarguesFontaine.spaY`; Tau Ceti `TauCeti.FarguesFontaine.isRadiusLowerBound_comap_frobenius_iff`"; both exist at the pin (Y.lean:116, Window.lean:149). |
| F03 (P3) AHLB locator in 9.7 | repaired | line 1334: "compare AHLB §1.3 and §2.1, where the integral Hodge–Tate stack of O_K is the classifying stack of a group G_π, isomorphic to G_m^♯ when e = E′(π) is a unit and to G_a^♯ when e lies in the maximal ideal". AHLB line 214, line 344, line 368–370 (Proposition 2.3), line 375 read: match. |
| F04 (P3) 10.4 milestone by reference | repaired | line 1444: "for 1 < r < 2 and … the natural map f … is 0-proper with f_*Λ = Λ, so that ∗-pullback along f is fully faithful (ALRS Lemma 5.2.21 …)"; ALRS line 5617–5618 read. The norm subscript is R10. |

The same-pattern repairs of 4.6, 4.7, 10.5, 10.7 and 10.11 were read against ALRS Lemma A.2.5 (line 9601–9617), §A.2 (line 9638–9654), Lemma A.2.11 (9732–9736), Proposition A.2.15 (9833–9848), Definition A.2.17, Remark A.2.18, Lemma A.2.19 (9917–9962), Lemma A.2.20 (10024), Lemmas 5.2.27–5.2.28 (5691–5726), Lemma 5.4.7 (5909–5932), §5.8 and Lemma 5.8.1 (7454–7480): every clause matches, with the corrected directions (base change X′ → X; g ∘ f).

**Renumbered supplier citations.** VectorBundlesAndIsocrystals at its open head has Layers 0–6; the six quoted subsection titles (“Relative period domain and analytic quotient”, “Slope-sensitive cohomology of standard bundles”, “V-descent of bundles and their derived cohomology”, “The fundamental untilt sequence and degree-one divisors”, “Lubin–Tate universal cover and sections of O(1)”, “Slope-zero bundles and E-local systems”) all exist there; its convention "O(d/h) is the image of D(−d,h)" agrees with O(λ) descending O ⊗ D_{−λ}. RelativeFarguesFontaine §1.2 at its head defines rad_ϖ = log|[ϖ]|/log|π| with rad_ϖ(φx) = q·rad_ϖ(x). AnalyticStacks is now an open new-roadmap pull request with the same numbering: §§0.5–0.13, 1.6–1.7, 2.1, 2.3 (items (1)–(7)), 2.11, 3.2–3.3, 3.6, 3.8, 4.1–4.5 (4.3(1)–(2); 4.4(1)–(7)), 5.1–5.3, 6.3–6.6 (6.5(1)–(6)), 7.2 (1)–(3), 7.5 (1)–(5), 7.6, 7.7 all exist; its Scope (line 22) assigns Gelfand rings and prismatization to this roadmap. EnhancedDerivedSheaves §E0.5, §E2.6, §E2.7, §E5:descent (`isDescendable_colimit_of_uniformIndex`), §E5:presentability.4, §E5:cotangent-export.1–2, §E5:animation.1 exist on main (R05 is the one slip).

**Gate.**

```
candidate: RationalAnalyticPrismatization is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCyclesPartII (the intake inserts it when its design is accepted)
depcheck: 229 roadmaps, 2081 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Overlaps: none listed (no other pull request changes this roadmap, no dropped id). The three `roadmaps resolve` leads (MotivesAndAlgebraicCyclesPartII §BM.0, LocallyAnalyticRepresentationsOfLocalGroups §LR.2, LocallyAnalyticDistributionsPartII §ND.0) are board packages earlier in the merge order; `Huber.GelfandSpectrum` is a name AdicSpacesPartIII §R3.9 plans, cited as such.

**Scripted structure.** 88 targets (16 definitions, 14 constructions, 58 theorems); every definition and construction has an API list and at least three Checks; every plan statement, API bullet and test occurs verbatim in the README (0 missing); 21 gaps with the same slugs in plan and README; manifest: 24 entries, all `certified`, equal to the 24 keys of References, each cited in the body. Policy grep (LaTeX delimiters, process words, pull-request numbers, machine paths, `set_option`): no hit; "lemma" twice, in a named source lemma and "Poincaré lemma". Page locators: all 284 "ALRS …, p. N, ALRS line M" and all 54 ABLB ones agree with the page markers of the cached texts.

**Gaps.** Nineteen gaps name a supplier whose section exists at its head (eighteen AnalyticStacks, one DiamondsAndVStacks §D6.5). `gestalten-affine-proper` and `gestalten-transmutation` still have supplier `none`: `roadmaps grep -i gestalt` finds only AnalyticStacks (Scope line 22 and its consumers bullet, which place them outside it) and this roadmap. They were settled in the round-4 repair report (F02, "not actionable in this package: Gestalten have no owner, and creating a Gestalten roadmap is a board decision"); the reason still holds, so they are not raised, and an acceptance stays conditional on that decision. For the maintainer: the AnalyticStacks consumers bullet (its README line 1305) still lists a contract `hypercover-inversion` this roadmap no longer declares.

**Sources, seeded sample** (no locator is flagged unverified by the author).

| Target | Read | Result |
|---|---|---|
| 1.2 | ABLB 686–698, 744–771, 972–990; ALRS 640–645 | R01, R02; the rest matches |
| 2.4 | ALRS 797–808; ABLB 2916–2925, 2641–2649 | match |
| 2.8 | ABLB 2023–2026, 2061–2069, 2686–2760; ALRS 990–1016 | match; locator R07 |
| 4.7 | ALRS 9638–9654, 9732–9736, 9833–9848, 9904–9962, 10024–10029 | match |
| 6.2 | ALRS 2352–2395; ABLB 2641–2649 | match |
| 7.3 | ALRS 2470–2489, 2569–2659 | match; R08 |
| 9.2 | ALRS 3496–3560, 9586–9588 | R03 |
| 9.3 | ALRS 4062–4075, 3631–3633 | match |
| 9.8 | ALRS 4233–4298 | match |
| 10.1 | ALRS 4810–4853 | match; supplier section R05 |
| 11.2 | ALRS 7795–7828, 7868–7872 | match |
| 11.4 | ALRS 7918–7935 | match |
| 11.10 | ALRS 8384–8401, 8404–8411, 8450–8485, 8529–8554 | R04; the rest matches |
| 12.1 | ALRS 688–701, 8628–8670, 1319–1362 | match; R09, R10 |
| 12.3 | ALRS 8873–8895, 8930–8937 | match (the README has the correct O_{X^{Div¹}}) |

**Adversarial table** (computed values).

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| 1.2 definition of ⟨ℕ[S]⟩_{≤r} | r = 0 germ ring; r = 1, A = ℚ_p⟨T⟩_{≤1}; A = ℚ_p⟨T⟩ | as written: Σ p^{−n²}T^n has no image, T ∉ A_{≤0}; Σ p^nT^{n²}: p^{−n}r^{n²} → ∞, T ∉ A_{≤1}; overconvergent: T ∈ both; ℚ_p⟨T⟩_{≤1} = ℤ_p⟨T⟩ either way | R01 |
| 1.2 Nil† ideal, †-reduction | ℚ_p⟦T⟧[1/T]; ℚ_p[ε]/ε²; ℚ_p⟨T⟩ | T ∈ Nil†, T unit, 1 ∉ Nil† (1 − T ↦ 0); Nil† = ℚ_p ε, quotient ℚ_p; Nil† = 0 | R02 |
| 1.2 API: p·A_{≤r} ⊆ A_{≤r/p} | A = ℚ_p⟨T⟩, r = 1 | p·ℤ_p⟨T⟩ = A_{≤1/p} | holds |
| 2.4 (1)–(3) | ℚ_p; 0; nilperfectoid A | ℚ_p → ℚ_p^cyc descendable into a perfectoid field; empty cover; identity | holds |
| 2.8 (−)^⋄ and X̂ | ℚ_p[ε]/ε²; Marc(ℚ_p) | Marc(ℚ_p); hat = GSpec(C_p)/Gal^cont ≠ GSpec(ℚ_p) (ABLB line 2747–2751) | holds |
| 4.5 new Check | A = ℤ_p ⊗_{ℤ_p[x]} ℤ_p | L_{ℤ_p/ℤ_p[x]} = (x)/(x²)[1] = ℤ_p[1]; L_A = A[1], π_1 = π_2 = ℤ_p | holds |
| 4.5 route completeness | Fil^k left Kan extended from τ_{≥k} | colimit of k-connective objects is k-connective, lim_k = 0 | holds |
| 4.7 Lemma A.2.20 against first Check | A = C(S, C_p), †-rational localization at closed Z ⊆ S | Z = ⋂ clopens U_i, B = colim C(U_i, C_p), each finite étale; B itself not finite étale when Z is not open | consistent |
| 4.7 conditions on τ | !-topology; †-quasi-pro-étale | neither condition (ALRS line 9908); both (line 9916) | not vacuous |
| 6.2 hat(FF^⋄_X) → FF_X | X = ∅; X = Marc(ℚ_p^{cyc,♭}) | iso of empty stacks; quotient by ℤ_p^{×,cont} of the completed object vs by ℤ_p^{×,sm} of the uncompleted | holds |
| 7.3 T_{FF} | non-perfect (S, 𝒳) | φ_𝒳 an endomorphism only; φ^ℤ does not act | R08 |
| 9.2 gerbe | X = D; curve over C; X = D × BG_a | T = 0, X^{HT/D} = D; band T_X^†{1}; T = O[1], torsor under B²G_a^†{1} | R03 |
| 9.3 | 0 → A¹; identity | L = ℚ_p[1], amplitude [−1,0], not an epimorphism: hypothesis needed; L = 0 | holds |
| 9.8 normalization | cyclotomic prism | φ(log q/(q−1)) = p·log q/(q^p−1) = p[p]_q^{−1}·log q/(q−1); φ(e⟨1⟩) = p^{−1}e⟨1⟩; φ(e) = [p]_q^{−1}e; Π_{n<N}[p]_{q^{p^n}} = (q^{p^N}−1)/(q−1), and (q^{p^N}−1)/p^N → log q | holds |
| 10.1 Λ_R(Π) | Π = 1; Π = ℤ/2 on ℚ_p × ℚ_p | R; twisted: dimension 4 with [g]e_1 = e_2[g], M_2(ℚ_p); untwisted ℚ_p⁴ | holds |
| 10.4, the condition on the ϖ-norm of p | ϖ = p^{1/2}; ϖ = p² | 1/4; 2^{−1/2} > 1/2 | R10 |
| 10.5, 10.7, 10.11 repaired clauses | A = B; H = 1; Y = X^la; Z = X^la/G^la | both sides M^la ⊗_{A^la} A; M^{G-la} = M^{N-la}; X ×_{X^la} X^la = X; both mapping spaces points | hold |
| 11.2 Tate | n = 0; n ≠ 0 | K →^0 K: H⁰ = H¹ = K; n invertible: 0 | holds |
| 11.4 | X = D | X^{Div¹/FF_D} = FF_D, α the identity | holds |
| 11.10 Proposition 6.4.10 | K_∞ = K(μ_{p^∞}) | K^{u,la}_∞ = K(μ_{p^∞}), X^HT = GSpec(K(μ_{p^∞}))/Γ^la as in 9.7 | holds |
| 11.10 Proposition 6.4.12 clause | compact G, d = 0 | reduces to the row above; non-compact G: the space of X̃ is not supplied by the hypotheses | R04 |
| 12.1 (3) | ℚ_p⟨T⟩ → ℚ_p; cusp; ℚ_p⟨T_n⟩ → ℚ_p | L = ℚ_p[1] perfect; L = k²[1] ⊕ k[2] perfect, not l.c.i.; I/I² infinite-dimensional, not finitely presented | holds |
| 12.1 last sentence | closed unit disc; open unit disc | not Berkovich-smooth; rigid smooth | R09 |
| 12.3 | d = 0; G_m; P¹ | O; O{1}[2], with 12.2 O{2}[4]; f_*O = O ⊕ O{−1}[−2], dual to ⊕_{k=0}^{1} O{1−k}[2−2k] | holds |
| Twists convention | O(1) on FF, O⟨1⟩ | O(λ) from D_{−λ}: D_{−1} = (ℚ_p, p^{−1}φ) = isocrystal of O⟨1⟩; H⁰(O(1)) ≠ 0, H⁰(O(−1)) = 0 | consistent |

The headline rows of round 6 (11.6, 11.7, 12.2–12.6) carry computed values and their text is unchanged except for the renumbered VectorBundlesAndIsocrystals citations in 11.7, resolved above.

**Principles.** No re-planned roadmap, no upward supply, no algorithm; the organisation is by the mathematics (the README does not say it follows a source; Layer 10 is placed by its dependencies on Layers 1–7). No Lean file exists at the design stage.

**Headline theorems** (Summary): 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6. None is statable at the pins (no analytic rings, Gelfand stacks or Fargues–Fontaine curves as stacks in Mathlib `1b1ccf4` or Tau Ceti `2fd255d`); the package stage states this in the module docstring.

## Not verifiable

- Lean elaboration, the `#check` pass and the one-tactic padding probe: not available (this lane does not elaborate, and the design has no `Suggested.lean`).
- Ownership against open pull requests was checked by object through `roadmaps grep` and by reading AnalyticStacks, VectorBundlesAndIsocrystals, RelativeFarguesFontaine and RefinedTraceMethods at their heads at the cited sections only; the other open roadmaps were not read.
- R04 has no computed counterexample: the witness is the source's hypotheses, which the statement drops.
- Targets outside the sample and outside the repaired passages rest on the rounds 1–6 tables; the Mathlib and Tau Ceti declarations were re-resolved at the current pins (R06), the non-AnalyticStacks supplier sections other than those named above were not re-read this round.
- The HM lemma used in the 12.3 route (HM Lemma 4.4.9(ii)) and the And21 argument of 1.7 without sheafiness were not re-read.

## Source issues

- **Misprint** in ALRS at Theorem 6.5.8(3), printed page 164 (ALRS line 8882): the source applies the upper shriek to the structure sheaf of Y^{Div¹}; it should be that of X^{Div¹}, as the end of the proof (ALRS line 8930) has; affects nothing.
- **Misprint** in ALRS at §3.2, printed page 45 (ALRS line 2352): the source cites ABLB Corollary 3.4.10 for arc-hyperdescent of Fargues–Fontaine discs; it should be Corollary 4.4.10 (ABLB line 2641) in the version read; affects nothing.
- **Misprint** in ALRS at §2.3, printed page 19 (ALRS line 1008, ALRS line 1016): the source cites ABLB Definition 4.5.1 with Proposition 4.5.4, and Proposition 3.3.3, for the perfectoidization functor and its morphism of topoi; it should be ABLB Lemma 4.5.1 (ABLB line 2690) for both; affects nothing.
- **Misprint** in ALRS at Lemma A.2.5(3), printed page 178 (ALRS line 9612): the source writes the base-change map as going from X to X′; it should go from X′ to X, with Y′ the fibre product; affects nothing.
- **Misprint** in ALRS at Proposition A.2.15(1), printed page 182 (ALRS line 9841): the source writes the composite in the order f after g; it should be g after f; affects nothing.
- **Gap** in ALRS at Remark 4.4.5, printed page 68 (ALRS line 3555): the source infers that the tangent complex is a vector bundle from formal smoothness; its own definition (ALRS line 9587) allows any perfect complex of non-positive amplitude, so the vector-bundle condition should be assumed as in Proposition 4.4.4(2); affects a stated result.

Verdict: design
Name: QuasicoherentSheavesOnPrestacks
Base: none
Owner: none

## Scope

The roadmap owns the functor-of-points theory of quasi-coherent sheaves. A prestack is a functor from test rings to large spaces. Its quasi-coherent sheaves are the limit of the module categories over its affine points, i.e. the right Kan extension of `R ↦ Mod_R` along the Yoneda embedding. This is the definition the spectral and derived literature uses (SAG Definition 6.2.2.1; GR-I Ch. 3, §1.1). No roadmap on main, no open roadmap pull request and no board package owns it. The amendment to EnhancedDerivedSheaves (pull request #1630, README line 41) says so explicitly: quasi-coherent sheaves on a prestack, as a limit over its affine points, are not owned there.

**Test contexts.** The theory is stated once for an *affine context*: a category `Aff` of test rings with a symmetric monoidal module functor `Mod : Aff → CAlg(Pr^L_st)`. It is then instantiated three times.

- *Classical*: Mathlib's `CommRingCat`, with `R ↦ D∞(R)` (EnhancedDerivedSheaves E1.3; by E5:spectra-comparison, `moduleSpectra_equiv_derived`, this is `Mod_{HR}(Sp)`).
- *Animated*: `AnimAlg_ℤ`, with `B ↦ Mod_B` (EnhancedDerivedSheaves E5:animation.4, `animatedModules`).
- *Spectral*: connective commutative algebras in `Sp`, with `A ↦ Mod_A(Sp)` (EnhancedDerivedSheaves E5:abstract.2 and E5:presentability.2). This instance needs a connectivity predicate on `Sp`. The design may build it from homotopy groups, or defer the spectral instance to a Part II if that predicate is not supplied.

A comparison theorem (T2) makes the classical and animated cases special cases of the later ones.

**What it owns.**

1. The definition of `QCoh(X)` as a symmetric monoidal presentable-stable-valued functor on prestacks, together with:
   - pullback and point values;
   - the structure sheaf;
   - the colimit-to-limit property and invariance under change of context.
   It also owns the passage from SchemeAndStackFoundations §1.18 stacks in groupoids, and from Mathlib schemes, to classical prestacks: restrict to affines and take nerves.
2. Flat hyperdescent for module categories over arbitrary connective test rings, with its consequences:
   - fpqc, fppf, étale and Zariski descent for `QCoh`;
   - invariance under sheafification;
   - Čech-nerve formulas.

   EnhancedDerivedSheaves E5:descent supplies only the descendable case.
3. The comparison with `D_qc` of schemes, and the identification of the heart with SchemeAndStackFoundations §1.22's abelian `Stacks.QCoh`.
4. Direct image along affine morphisms (all contexts) and along morphisms representable by qcqs schemes (classical context), with base change and the projection formula.
5. Quotients:
   - `QCoh` of the realization of a group action as the totalization of equivariant data;
   - quotient stacks `[X/G]` and `BG`;
   - discrete-group quotients as homotopy fixed points;
   - the comparison with equivariant quasi-coherent sheaves and their bounded-below derived category.
6. The t-structure, connective objects, perfect (= dualizable) and almost perfect objects, and descent of `Perf`.
7. Compact generation:
   - qcqs schemes;
   - the general notion of a perfect stack, with its permanence under relatively quasi-projective maps;
   - quotient stacks in characteristic zero;
   - the standard counterexamples in positive characteristic.

**Boundaries.**

- *EnhancedDerivedSheaves (main).* `D∞(O)`, `Mod_{HR}(Sp) ≃ D(R)`, presentable categories and limits in `PrL`, spectra, the module and algebra framework, descendable module descent, animated rings and their modules, and `QuasicoherentDerived` / `PerfectDerived` on qcqs schemes (E1.8) are used unchanged.
- *SchemeAndStackFoundations (main).* Its sections are used unchanged:
  - abelian fpqc descent (§1.1);
  - stacks in groupoids and stackification (§1.18);
  - quotient stacks (§1.21);
  - `Stacks.QCoh` with `presentationEquiv` (§1.22);
  - `DQCoh` with `affineEquiv`, the derived functors, `perfect_generator`, `torIndependent_baseChange` and `IsPseudoCoherentComplex` (§2.18).
- *Left to other roadmaps:*
  - `D_qc` of algebraic spaces (AlgebraicModuliForArithmeticGeometry §7.7, `spaceDQCoh`; later in the merge order). Its comparison with `QCoh` of the functor of points is a consumer statement there.
  - Formal completion and `FormalQCoh` (PrismaticCohomologyPartII §4.0).
  - Derived mapping stacks (LanglandsParameterStacks §1.8).
  - Six-functor formalisms and the !-topology (AnalyticStacks Layers 0–1).
  - Ind-coherent sheaves and Tannaka duality (SAG Ch. 9): not owned anywhere and not planned here.
- *Out of scope; a later Part II, or an owner of derived schemes, can take them up:*
  - derived schemes, spectral Deligne–Mumford stacks and spectral algebraic spaces;
  - base change along non-affine derived schematic morphisms (SAG Proposition 6.3.4.1, GR-I Proposition 2.2.2 in full generality);
  - the unbounded comparison `D(QCoh(X)^♥) → QCoh(X)` for stacks;
  - lisse-étale `D_qc` of algebraic stacks.
- *Ownership that moves here.* Several open pull requests construct parts of this theory locally. Once this roadmap exists they should import it by section; their application-specific parts stay with them.
  - PrismaticCohomologyPartII (#1065) §4.0 plans `QCohPrestack(X) = lim D(R)` on classical rings, with `eval`, `pullback`, `specEquiv`, `flatDescent`, `sheafificationEquiv`, `cechDescent`, `QCohPrestack.Perf`, `affinePushforward`, `affineBaseChange` and `affineProjectionFormula`.
  - HabiroCohomologyFoundations (#1428), Layer 1 (README line 218, and the quotient target at line 808) plans the prestack right Kan extension, flat-sheafification invariance and `QCoh` of an action-groupoid realization. Its lattice identification `QCoh([Spec C/ℤ^d]) ≃ D(C)^{hℤ^d}` stays there as an application of T6.
  - LanglandsParameterStacks (#1202) §1.7 plans faithfully flat descent for module categories over animated rings (SAG Theorem D.6.3.1). §1.8 keeps the mapping stack and uses T1, T6 and T7.
  - AnalyticStacks (#1687) §1.2 states as an API fact that, for a scheme, its `D` is §2.18's `D_qc`. That fact is T4.

## Final targets

Throughout:
- `Aff` is one of the three contexts above and `Ŝ` is the ∞-category of large spaces.
- A prestack is a functor `X : Aff → Ŝ`; a point is a pair `(R, η ∈ X(R))`, equivalently `η : Spec R → X`.
- All categorical constructions are ∞-categorical and coherent, in the sense of EnhancedDerivedSheaves E0.
- Page numbers are printed pages.

**T1. Definition and formal properties** (`QCoh`, `QCoh.pullback`, `QCoh.eval`, `QCoh.structureSheaf`).

*Definition.* `QCoh : Fun(Aff, Ŝ)^op → CAlg(Ĉat∞)` is the right Kan extension of `Spec R ↦ Mod_R` along the Yoneda embedding, taken in symmetric monoidal ∞-categories.

*Statements.* Prove:
- `QCoh(Spec R) ≃ Mod_R`, naturally in `R`.
- `QCoh` carries small colimits of prestacks to limits.
- Every `QCoh(X)` is stable with small colimits. Every pullback `f^*` preserves small colimits and is symmetric monoidal. The tensor product is computed pointwise and preserves colimits in each variable. The unit `O_X` has value `R` at every point.
- `QCoh(X)` is presentable when `X` lies in the colimit closure of the representables among fpqc sheaves.
- In the classical context, the homotopy category of `QCoh(Spec R)` is Mathlib's `DerivedCategory (ModuleCat R)`, with its shift and triangles.

*Locators.* SAG Definition 6.2.2.1 (pp. 490–491, SAG line 17835); Remark 6.2.2.5 (p. 491, SAG line 17859); Proposition 6.2.3.4 (pp. 492–493, SAG line 17905); §6.2.6 and Notation 6.2.6.1 (pp. 496–497, SAG line 18050). GR-I Ch. 3, §§1.1 and 3.2 (pp. 143–145 and 159, GR-I line 7322 and line 8013).

*Checks.*
- `QCoh(∅) = 0`; a direct-sum formula fails this case.
- `QCoh(Spec ℤ) = D(ℤ)`.
- For the classical `B(ℤ/2)` over `𝔽₂`, `Ext¹(O, O) = 𝔽₂`; its value at the trivializing point forgets this class, so one atlas value does not determine maps.

**T2. Change of context** (`QCoh.leftKanInvariance`).

*Statements.* Let `u : Aff → Aff′` be one of:
- the inclusion of discrete rings into animated rings;
- the functor `θ` of EnhancedDerivedSheaves E5:animation.4 into connective commutative algebras of `Sp`;
- their composite.

Then `QCoh(u_! X) ≃ QCoh(X)` symmetric monoidally, naturally in `X`, so every classical statement below is the restriction of the corresponding statement in a later context. Two classical inputs are classical prestacks:
- every Mathlib scheme, through its functor of points;
- every stack in groupoids of SchemeAndStackFoundations §1.18, restricted to affines and composed with the nerve of groupoids.

The scheme case is fully faithful on schemes.

*Locators.* SAG Remark 6.2.2.2 (p. 491, SAG line 17845: the same argument along connective ⊂ nonconnective). GR-I Ch. 3, §1.2 (pp. 145–146).

*Checks.*
- `u_!` of a representable `Spec R` is `Spec u(R)`.
- *Restriction* along `u` does not preserve `QCoh`: the derived intersection `Spec(𝔽_p ⊗ᴸ_ℤ 𝔽_p)` restricts on classical rings to `Spec 𝔽_p`, and the restricted structure sheaf loses `π₁ = 𝔽_p`.

**T3. Flat hyperdescent and fpqc descent** (`Mod.flatHyperdescent`, `QCoh.sheafificationEquiv`, `QCoh.cechDescent`).

*Statement (a).* For every connective test ring `A` (discrete, animated or connective `E∞`) and every faithfully flat hypercover `A → A_•`, the map `Mod_A → lim_{[n]∈Δ} Mod_{A_n}` along extension of scalars is a symmetric monoidal equivalence. Here faithfully flat means flat with `π₀A → π₀B` faithfully flat, as in the supplied LanglandsParameterStacks §1.7 convention. No finite presentation, countability or descendability hypothesis is imposed.

*Statement (b).* Consequences for `QCoh`:
- `QCoh` inverts every map that becomes an equivalence after fpqc sheafification (hypersheafification suffices).
- For every fpqc surjection `U → X` of prestacks, `QCoh(X)` is the totalization of `QCoh` of the Čech nerve.
- Fppf, étale and Zariski descent follow.

*Statement (c).* On hearts in the classical context, (a) recovers SchemeAndStackFoundations §1.1's `qcoh_fpqc_descent`.

*Locators.* SAG Theorem D.6.3.1 and Corollaries D.6.3.3–D.6.3.4 (pp. 2177–2178, SAG line 79502, line 79518, line 79526); Proposition 6.2.3.1 and Remarks 6.2.3.2–6.2.3.3 (p. 492, SAG line 17889). GR-I Ch. 3, Theorem 1.3.4 and Corollaries 1.3.5, 1.3.7, 1.3.8, 1.3.11 (pp. 146–147, GR-I line 7446).

*Checks.*
- `R → R` gives `Mod_R`.
- A finite Zariski cover recovers gluing on overlaps, including two-term complexes.
- `ℤ → 𝔽_p` is not a cover: `ℚ ⊗ᴸ 𝔽_p = 0`.
- `ℤ → ℤ[1/p] × ℤ_p` is faithfully flat and recovers `D(ℤ)` (the fracture square).
- The descendable special case agrees with EnhancedDerivedSheaves E5:descent's `moduleDescent`.

**T4. Comparison with `D_qc` for schemes** (`QCoh.schemeEquiv`).

*Statement.* For every Mathlib scheme `X` (no qcqs hypothesis), let `h_X` be its functor of points on `CommRingCat`. There is a symmetric monoidal equivalence `QCoh(h_X) ≃ D_qc(X)`, where `D_qc(X) ⊆ D∞(O_X)` is the full subcategory of objects whose image in Mathlib's `DerivedCategory X.Modules` lies in SchemeAndStackFoundations §2.18's `DQCoh X`. For qcqs `X` this is EnhancedDerivedSheaves E1.8's `QuasicoherentDerived`. The equivalence:
- is natural for derived pullback;
- carries the pointwise tensor product to `derivedTensor`;
- on homotopy categories recovers `DQCoh` with its triangulated structure;
- for `X = Spec R` is `quasicoherentDerived_affine`;
- for an open cover is the Zariski gluing formula.

*Locators.* SAG Proposition 6.2.4.1 (p. 493, SAG line 17929), with Corollary 2.2.6.2 (p. 208, SAG line 7461), Corollary 2.1.2.3 and Theorem 2.1.2.2 (pp. 193–194, SAG line 6942, line 6951) and Proposition 2.2.3.3 (p. 202, SAG line 7269). Stacks Lemma 75.4.2, tag 071Q (Stacks line 99), for the Zariski–étale bridge. GR-I Ch. 3, Proposition 1.4.4 (p. 149, GR-I line 7572).

*Checks.*
- `O_X ↦ O_X[0]`.
- For `ℙ¹_k`, `Hom(O, O(−2)[1]) = k`.
- `j_!O_U[0]` for the generic point of a DVR is not in the image.
- `⊕_ℕ O` on `Spec ℤ` lies in both sides and is not perfect.

**T5. Direct image, base change and projection formula** (`QCoh.affinePushforward`, `QCoh.schematicPushforward`).

*Statement (a), all contexts.* Let `f : Y → X` be affine, i.e. every base change to an affine point is affine. Then:
- `f^*` has a colimit-preserving right adjoint `f_*`, given pointwise by restriction of scalars;
- the projection formula `f_*(f^*M ⊗ N) ≃ M ⊗ f_*N` holds;
- the Beck–Chevalley map is an equivalence for every pullback square of prestacks, with fibre products formed in the context (derived in the animated and spectral contexts).

*Statement (b), classical context.* Let `f` be representable by qcqs schemes. Then `f_*` exists, preserves colimits and satisfies the projection formula. Base change holds along any `g` for which every affine base change of the square is Tor-independent; in particular it holds for flat `g`. This uses T4 with SchemeAndStackFoundations §2.18's `totalDirectImage`, `projectionFormula` and `torIndependent_baseChange`.

*Locators.* SAG Proposition 6.3.4.1 and Corollary 6.3.4.3 (pp. 505–506, SAG line 18368, line 18458). GR-I Ch. 3, Proposition 2.2.2 (p. 153, GR-I line 7740). Stacks tag 08ET.

*Checks.*
- `f = id`.
- `R → R[t]`: `f_*O` is the `R`-module `R[t]`, not of rank one.
- The classical square `Spec 𝔽_p → Spec ℤ ← Spec 𝔽_p` violates classical base change: the fibre product is `Spec 𝔽_p`, while `𝔽_p ⊗ᴸ_ℤ 𝔽_p` has `H⁻¹ ≠ 0`. In the animated context the same square satisfies base change.

**T6. Quotients and equivariant sheaves** (`QCoh.realizationEquiv`, `QCoh.quotientStack`, `QCoh.classifyingStack`).

*Statement (a).* For a group object `G` of prestacks acting on a prestack `X` in any context:
- `QCoh(|G^{×•} × X|) ≃ lim_{[n]∈Δ} QCoh(G^{×n} × X)`: the coherent `G`-equivariant objects of `QCoh(X)`.
- If `G` is fpqc-locally flat over the base (a flat affine group scheme, or a constant group), the fpqc quotient `[X/G]` has the same `QCoh`.
- For a discrete group `Γ`, `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}`.

*Statement (b), classical context.* Let `G` be a flat affine group scheme over a commutative ring `k`, acting on a `k`-scheme `X`, and let `[X/G]` be the `actionQuotient` of SchemeAndStackFoundations §1.21. Then:
- the heart of `QCoh([X/G])` is SchemeAndStackFoundations §1.22's `Stacks.QCoh([X/G])`, i.e. `G`-equivariant quasi-coherent sheaves on `X` (`presentationEquiv`, Stacks tag 06WT);
- if `[X/G]` is quasi-compact with affine diagonal, `D⁺(QCoh^G(X)) → QCoh([X/G])⁺` is an equivalence;
- for `X = Spec k`, the heart is `O(G)`-comodules.

*Locators.* SAG Proposition 6.2.3.1 (p. 492); GR-I Ch. 3, Corollaries 1.3.8 and 1.3.11 (p. 147) and Proposition 2.4.3 with Remark 2.4.4 (p. 156, GR-I line 7872); HNR Theorem C.1 (p. 16, HNR line 807); Stacks tags 06WG and 06WT.

*Checks.*
- `[X/1] = X`.
- For `G = ℤ/2` over `𝔽₂`, `Ext¹_{BG}(O, O) = 𝔽₂`; ordinary invariants lose it.
- For `G = G_m` over `ℤ`, the heart of `QCoh(BG_m)` is `ℤ`-graded abelian groups.
- For `Γ = ℤ^d` acting on `Spec C` through ring automorphisms, `QCoh([Spec C/ℤ^d]) ≃ D(C)^{hℤ^d}`, the case HabiroCohomologyFoundations uses.

**T7. t-structure, perfect and almost perfect objects** (`QCoh.tStructure`, `QCoh.Perf`, `QCoh.APerf`).

*Statement (a), t-structure.*
- `QCoh(X)^cn` (pointwise connective objects) generates a t-structure on every presentable `QCoh(X)`.
- Suppose `X` is a quasi-geometric stack: an fpqc sheaf with quasi-affine diagonal admitting a faithfully flat map from an affine. Then the t-structure is detected on the atlas and compatible with filtered colimits, and `QCoh(X)^cn` is complete Grothendieck prestable.
- For a classical stack in groupoids with flat affine atlas and affine diagonal, the heart is §1.22's `Stacks.QCoh(X)`.

*Statement (b), perfect objects.*
- `Perf(X)`, the pointwise perfect objects, are exactly the dualizable objects.
- Invertible objects are pointwise invertible.
- Connective dualizable objects are the locally free sheaves of finite rank.
- `X ↦ Perf(X)` is the right Kan extension of its affine restriction and satisfies fpqc descent.
- For schemes, T4 matches it with EnhancedDerivedSheaves E1.8's `PerfectDerived`.

*Statement (c), almost perfect objects.*
- `APerf(X)` consists of the pointwise almost perfect objects. In the classical context these are the pointwise pseudo-coherent objects, and for schemes T4 matches them with §2.18's `IsPseudoCoherentComplex`.
- On a quasi-geometric stack, almost perfect means corepresenting a functor that commutes with filtered colimits on every `QCoh(X)_{≤n}`.
- On a Noetherian scheme, `APerf = D⁻_coh`.

*Locators.* SAG Example 6.2.5.7, Remark 6.2.5.8 and Warning 6.2.5.9 (pp. 495–496, SAG line 18011); Definition 6.2.5.3 and Proposition 6.2.5.2 (pp. 494–495, SAG line 17974); Propositions 6.2.6.2–6.2.6.3 (p. 497, SAG line 18072); Definition 9.1.0.1 (p. 727, SAG line 26462); Proposition 9.1.3.1 and Corollary 9.1.3.2 (p. 733, SAG line 26667); Proposition 9.1.5.1 (p. 736, SAG line 26798). HA Proposition 4.6.1.11 (p. 620, HA line 23655); Definition 7.2.4.10 and Proposition 7.2.4.11 (p. 1265, HA line 48428); Proposition 7.2.4.17 (p. 1268, HA line 48556). GR-I Ch. 3, §1.5 and Proposition 1.5.4 (pp. 149–150, GR-I line 7581) and Corollaries 3.6.4–3.6.5 (p. 163, GR-I line 8201).

*Checks.*
- `ℤ ⊕ ℤ[3]` is perfect; `ℚ` is not dualizable in `D(ℤ)`.
- `O[1]` is invertible but not a line bundle.
- Membership in `QCoh(X)_{≤0}` is not pointwise, even on an affine prestack (SAG Warning 6.2.5.9): `𝔽_p[0]` over `Spec ℤ` is `0`-truncated, but its pullback along `Spec 𝔽_p → Spec ℤ` is `𝔽_p ⊗ᴸ_ℤ 𝔽_p`, which has `π₁ ≠ 0`.

**T8. Compact generation under the standard hypotheses** (`QCoh.compactGeneration_scheme`, `IsPerfectStack`).

*Statement (a).* For a qcqs scheme `X`, `QCoh(h_X)` is compactly generated by a single perfect object, and compact = perfect = dualizable. This transports §2.18's `perfect_generator` through T4.

*Statement (b), perfect stacks.* Define a perfect stack: a quasi-geometric (or affine-diagonal) stack `X` with `O_X` compact and `QCoh(X) = Ind Perf(X)`. Prove:
- with affine diagonal, perfect ⇔ compactly generated with compact = dualizable;
- `Y` relatively quasi-projective (more generally, with affine diagonal and a relatively ample family of line bundles) over a perfect stack is perfect;
- maps between perfect stacks are perfect;
- products of perfect stacks are perfect.

*Statement (c).* Over a field of characteristic zero, `[X/G]` is perfect for an affine algebraic group `G` acting linearly on a quasi-projective `X`. In particular `QCoh([X/G]) = Ind Perf([X/G])`.

*Locators.* Stacks Theorem 36.15.3 (tag 09IP); SAG Proposition 9.6.1.1 (p. 807, SAG line 29408) and Definition 9.4.4.1 (p. 789, SAG line 28779); BZFN Definition 3.2 (p. 17, BZFN line 834), Proposition 3.9 (p. 20, BZFN line 970), Propositions 3.19, 3.21, 3.24 and Corollaries 3.22–3.23 (pp. 23–25, BZFN line 1117, line 1189, line 1200); HA Propositions 7.2.4.2 and 7.2.4.4 (pp. 1261–1263, HA line 48281).

*Checks.*
- `BG_m` over any ring is perfect: its compact generators are the characters.
- For `G = ℤ/p` over `𝔽_p`, `O_{BG}` is perfect but not compact, since `H^*(ℤ/p; 𝔽_p)` is nonzero in every degree. Compact ≠ dualizable, and the characteristic-zero hypothesis in (c) cannot be dropped (HR-perf Introduction, HR-perf line 27).
- For `G_a` over `𝔽_p`, the only compact object of the derived category of representations is `0` (HNR Proposition 3.1, p. 7, HNR line 340; HNR Theorem 1.1, HNR line 45). This is a Check in the abelian/bounded-below range that T6(b) reaches.
- Hall–Rydh's Theorems A and B (HR-perf line 19, line 38) need the lisse-étale `D_qc` of stacks, which is out of scope. They are recorded as the target of a later part.

## Suppliers

The merge order (`merge-order/ORDER.txt`) places a roadmap after its last supplier. Every supplier below is on main, so this roadmap goes at the top of the order: above AlgebraicModuliForArithmeticGeometry (line 32), SchemeKTheoryOperations (line 34), PrismaticCohomologyPartII (line 56) and LanglandsParameterStacks (line 61), so that they can import it.

- **EnhancedDerivedSheaves** (main):
  - E0.3–E0.8: functor ∞-categories, limits and colimits, stability, `Cat∞` and Spaces, coCartesian fibrations and restricted straightening, presentability;
  - E1.3–E1.4: `D∞(O)`, derived pullback, pushforward and tensor;
  - E1.8: `QuasicoherentDerived`, `quasicoherentDerived_affine`, `PerfectDerived`, and E1.8.DMA.1 `derivedTensor_affine`;
  - E2.6–E2.7: hypercovers, sheaves of spaces and hypercompletion;
  - E3.1–E3.4: Kan extensions, adjoint criteria, `presentable_limit_restricted`, compact generation, coherent mates for Beck–Chevalley maps;
  - E5:abstract.1–.4: symmetric monoidal ∞-categories, algebras and modules, stable monoidal structures;
  - E5:presentability.1–.2: `compactObjects`, `IsCompactlyGenerated`, `PrL`, `presentable_limit`, `presentable_limit_right`, `spectra`, `presentableTensor`;
  - E5:descent: `IsDescendable`, `moduleDescent`, the countably presented faithfully flat case;
  - E5:spectra-comparison: `eilenbergMacLane`, `moduleSpectra_equiv_derived`;
  - E5:animation.1 and .4: `animatedAlgebras`, `animatedToCAlg`, `animatedModules`, `animatedModules_baseChange`;
  - E5 `enhancement_compatibility`.
- **SchemeAndStackFoundations** (main):
  - §0.4: quasi-coherent modules and direct images;
  - §1.1: `Descent.qcohPseudofunctor`, `qcoh_fpqc_descent`;
  - §§1.13–1.15: group spaces, actions, torsors;
  - §1.18: stacks in groupoids, `Stack.stackification`, 2-fibre products;
  - §1.21: `quotientStack`, `actionQuotient`, `BG`;
  - §1.22: `Stacks.QCoh`, `QCoh.presentationEquiv`, `QCoh.pullback`, `QCoh.pushforward`;
  - §2.6: quasi-coherent cohomology;
  - §2.18: `DQCoh`, `DQCoh.affineEquiv`, `DQCoh.restrict`, `derivedTensor`, `derivedPullback`, `totalDirectImage`, `projectionFormula`, `perfect_generator`, `torIndependent_baseChange`, `IsPseudoCoherentComplex`.
- **DerivedModuleAlgebra** (main): §0.2 (module derived tensor and its K-flat models) and §1.E.0 (`DerivedDeRham.IsPerfect` with its alias `PerfectComplex.IsPerfect`, and `IsPseudoCoherent`) for the affine perfect and pseudo-coherent comparisons.
- **BordismFormalGroups** F6.5 (main): only through EnhancedDerivedSheaves (generic categorical model, straightening, operads).
- **Mathlib**:
  - `CommRingCat`, `AlgebraicGeometry.Scheme` and its Yoneda/`Spec`;
  - `AlgebraicGeometry.Scheme.fpqcTopology`;
  - `SSet.Quasicategory`;
  - `DerivedCategory`, `ModuleCat`;
  - `CategoryTheory.Pseudofunctor.IsStack`, `CategoryTheory.Pseudofunctor.DescentData`;
  - `Module.Flat`, `Module.FaithfullyFlat`.

## Consumers

The design should check each of these before relying on it.

- Verified local constructions that should become imports:
  - **PrismaticCohomologyPartII** (#1065) §4.0 imports T1, T3, T5(a) and T7(b). It keeps `FormalQCoh`; PrismaticCohomologyPartIII (#1070) and PrismaticCohomologyPartIV inherit through it.
  - **HabiroCohomologyFoundations** (#1428) Layer 1 imports T1, T3 and T6(a). HabiroCohomologyFoundationsPartII follows.
  - **LanglandsParameterStacks** (#1202): §1.7 imports T3(a); §1.8 imports T1, T6 and T7(b).
  - **AnalyticStacks** (#1687): §1.1–1.2 identify its `D*` on animated affines with T1 and use T2 and T4. RationalAnalyticPrismatization (board design) inherits through it.
- Likely consumers, each of which mentions `QCoh` or `D_qc` in its own development:
  - **SchemeKTheoryOperations** (#1229) and its Part II: T7(b), T8(a);
  - **AlgebraicModuliForArithmeticGeometry** (#853) §7.7: the comparison of `spaceDQCoh` with `QCoh` of the functor of points, from T3 and T4;
  - **ComplexComparisonPartII** (#848), through that comparison;
  - the v-stack roadmaps (VStackSheavesAndLisseCategories, DiamondsAndVStacksPartII) where they need algebraic `QCoh` of parameter stacks;
  - the spectral-action roadmaps (ExcursionOperatorsAndSpectralAction and its Part II, GeometricSatakeAndFusion), through LanglandsParameterStacks.

## Sources

All sources were fetched through the sources service and are recorded in `packages/QuasicoherentSheavesOnPrestacks/sources.toml`.

- **SAG**: J. Lurie, *Spectral Algebraic Geometry*, author PDF (February 2018), author page. Used for §§2.1.2, 2.2.3, 2.2.6, 6.2.2–6.2.6, 6.3.4, 9.1, 9.4.4, 9.6.1 and D.6.3. PDF pages equal printed pages.
- **HA**: J. Lurie, *Higher Algebra*, author PDF (18 September 2017), author page. Used for Proposition 4.6.1.11, Remark 7.1.1.16, Theorem 7.1.2.1, and Propositions 7.2.4.2, 7.2.4.4, 7.2.4.11 and 7.2.4.17 with Definition 7.2.4.10.
- **GR-I**: D. Gaitsgory and N. Rozenblyum, *A study in derived algebraic geometry*, Vol. I, AMS Surveys 221 (2017). Read from the published-version PDF the authors post on their book page (author page); printed pages are PDF pages minus 37. Chapter I.3 is pp. 141–166. The work is over a field of characteristic 0, so it supplies statements and routes, while SAG supplies the integral generality.
- **BZFN**: D. Ben-Zvi, J. Francis and D. Nadler, *Integral transforms and Drinfeld centers in derived algebraic geometry*, J. Amer. Math. Soc. 23 (2010); arXiv:0805.0157v5 (open repository). Used for §3: Definitions 3.1–3.2, Propositions 3.9, 3.19, 3.21, 3.24 and Corollaries 3.22–3.23.
- **HNR**: J. Hall, A. Neeman and D. Rydh, *One positive and two negative results for derived categories of algebraic stacks*, arXiv:1405.1888v2 (open repository). Used for Theorems 1.1–1.3, Proposition 3.1 and Theorem C.1.
- **HR-perf**: J. Hall and D. Rydh, *Perfect complexes on algebraic stacks*, Compositio Math. 153 (2017); arXiv:1405.1887v3 (open repository). Used for Theorems A and B and the tameness remark of the introduction.
- **Stacks**: The Stacks Project, open repository. Used for tags 071Q (Lemma 75.4.2), 06WG, 06WT, 09IP and 08ET.

No source is behind a paywall, and `needs-references.toml` is not needed.

## Risks

- **Flat hyperdescent (T3(a)) is the hardest single proof.** SAG proves it through complete prestable ∞-categories (Appendix C) and its Appendix D.6, which no supplier states. EnhancedDerivedSheaves gives only descendable and countably presented descent. Fallback routes:
  - for classical rings, bounded-below descent from SchemeAndStackFoundations §1.1 plus left completeness of `D(R)`;
  - for animated rings, Postnikov towers.

  If neither suffices, T3(a) splits into a classical-ring layer and a later general layer.
- **Size and sheafification.** Prestacks are valued in large spaces, and fpqc sheafification on all rings needs a universe enlargement (SAG works with `Ŝ`). The design must fix universes as EnhancedDerivedSheaves' conventions do. It may state T3(b) as "`QCoh` inverts fpqc-local equivalences" without constructing a sheafification functor.
- **Rectification.** Treating SchemeAndStackFoundations' pseudofunctor stacks and Mathlib schemes as space-valued functors needs the restricted straightening of EnhancedDerivedSheaves E0.7. If that is not enough for groupoid-valued pseudofunctors on a large site, T2's classical input needs its own construction.
- **Spectral context.** The spectral context needs a connectivity predicate (a t-structure) on `Sp` that EnhancedDerivedSheaves does not list. The spectral instance may move to a Part II.
- **Ownership moves.** Three open pull requests (PrismaticCohomologyPartII §4.0, HabiroCohomologyFoundations Layer 1, LanglandsParameterStacks §1.7) plan parts of T1, T3, T5(a) and T6 themselves. Until they are amended to import this roadmap, the library has two plans of the same theory. Those amendments are outside this design.
- **Acceptance test.** Almost every headline lives in quasicategories, and Mathlib's pins have no presentable or stable ∞-categories. `Suggested.lean` may be limited to the shadows expressible at the pins, for example:
  - abelian or homotopy-category statements for schemes and `BG`;
  - perfectness and dualizability on Mathlib's `DerivedCategory`;
  - the heart of `QCoh([Spec A/G])`.

  This must be decided without sorry'd data, as PrismaticCohomologyPartII already found.
- **Out-of-scope generality.** Derived schemes and lisse-étale `D_qc` of stacks are not owned anywhere. The general schematic base change and Hall–Rydh compact generation therefore wait for a later part; the targets above stay within what the suppliers support.

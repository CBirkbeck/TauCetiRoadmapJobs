# Review of JacobianChallenge (pull request #1892 at 08ca2ec)

**Verdict:** needs changes

Ten findings: four P2, six P3. This head repairs all five findings of the previous review (see the start of Verified sound). The gate passes, the module elaborates with `sorry` as the only warning, and the dependency check reports no UPWARD or CYCLE line. The four P2 findings are:

- the new Gorenstein-curve duality block (B.4) has owners on main;
- the base-change headline is an existential stand-in;
- the Picard scheme over a general base is defined both here and in JacobianChallengePartII;
- several targets are already theorems at the Tau Ceti pin.

## R01 (P2) — Duality and Riemann–Roch on Gorenstein curves already have owners on main

**Location.** `TauCetiRoadmap/JacobianChallenge/README.md` lines 370–395 (B.4), new in this pull request: "Define the sheaf `ω_X` of regular differentials … `Hom(F, ω_X) ≅ H¹(X, F)^∨` for every quasi-coherent `F` … For Gorenstein `X` prove: `ω_X` is invertible … **Riemann–Roch**". Also line 25 (Owned), line 191, line 417, line 426, and `Suggested.lean` lines 39–40.

**Claim.** This roadmap owns the dualizing sheaf of a singular curve over `k`, its duality, and Riemann–Roch for coherent and locally free sheaves on it.

**Witness.** On main: SchemeAndStackFoundations §2.20 `cm_serre_duality`, `curve_dualizing_comparison` (README lines 4352–4361) and §3.3 `vectorBundle_riemann_roch`, `curve_serre_duality` (4735–4747); StableReduction contract J-B / SR-2 (line 308): "no independent" `ω`. All consume Layer B.

**Repair.** Delete B.4, and remove what refers to it:

- line 25: drop "and on Gorenstein curves, and Riemann–Roch for coherent sheaves";
- line 191: drop "including the Gorenstein case";
- B.5: drop the sentence "and `dim_k H⁰(X, ω_X) = g` on a Gorenstein curve follows from B.4" (line 417), and remove B.4 from the *Needs:* line (426);
- remove the nodal-cubic entry of the Layer B Examples (line 442);
- remove `Scheme.IsCurveOver` and `IsIwanagaGorenstein` from the Tau Ceti contract (line 153) and from the Layer B Dependencies (line 450);
- remove the Gorenstein item from the module docstring.

Add under "Left to other roadmaps": "Serre duality and Riemann–Roch on Cohen–Macaulay and Gorenstein curves, for coherent and locally free sheaves, are SchemeAndStackFoundations §2.20 (`cm_serre_duality`, `curve_dualizing_comparison`) and §3.3 (`vectorBundle_riemann_roch`, `curve_serre_duality`), with StableReduction Layer 2's Gorenstein `ω`; they restrict to B.3 on smooth curves."

This roadmap cannot consume those sections instead, because they *Need* Layer B; that would make a target-level cycle. The deletion breaks nothing: "B.4" occurs only at lines 370, 417 and 426, and no target in Layers C–F cites it.

## R02 (P2) — `jacobianVariety_baseChange` only says that some representation exists

**Location.** `Suggested.lean` lines 282–289: `Nonempty ((picZeroSets X').RepresentableBy ((JacobianVariety X).baseChange K).toOver)`. The docstring (lines 279–281) says that "the README specifies the representation as the one induced by Tau Ceti's `relativePicardDegreeZeroFunctorBaseChangeIso`". README F.3 is lines 1062–1068.

**Claim.** This states the headline "compatible with field base change" (Summary, line 5; F.3).

**Witness.** `picZeroSets X'` is represented by `jacobianScheme X'` (instance, line 142), so the conclusion only says `(Jac X)_K ≅ Jac X'` as `K`-schemes: no group law, Abel–Jacobi map or representation. README line 90: "no statement is an existential".

**Repair (tested).** The sheaf-level comparison that F.3 names is not available at the pin. Tau Ceti has only the presheaf versions: `relativePicardDegreeZeroFunctorBaseChangeIso` (`TauCeti/AlgebraicGeometry/PicardFunctor/PicZero/BaseChange.lean:158`) and `relativePicardDegreeZeroFunctorBaseChangeRepresentableBy` (`:234`).

So do three things:

- In the module docstring, name the representation form of base change as not statable, because there is no base-change isomorphism for `relativePicardDegreeZeroFppfSheaf`.
- Delete the `Nonempty` statement.
- State the pointed form below. It determines `(Jac X)_K`, with its group law and its Abel–Jacobi map, up to unique isomorphism.

```lean
theorem isAlbanese_baseChange_abelJacobi {k : Type u} [Field k] (X : Over (Spec (.of k)))
    [SmoothOfRelativeDimension 1 X.hom] [IsProper X.hom] [GeometricallyConnected X.hom]
    (K : Type u) [Field K] [Algebra k K] (x₀ : 𝟙_ (Over (Spec (.of k))) ⟶ X) :
    TauCeti.AlgebraicGeometry.AbelianVariety.IsAlbanese
      (J := (JacobianVariety X).baseChange K)
      (Functor.LaxMonoidal.ε (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))) ≫
        (Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))).map x₀)
      ((Over.pullback (Spec.map (CommRingCat.ofHom (algebraMap k K)))).map (abelJacobi X x₀) ≫
        eqToHom (TauCeti.AlgebraicGeometry.AbelianVariety.baseChange_toOver _ K).symm) := by
  sorry
```

This elaborates at the pin, appended to a copy of the file, with `sorry` as the only warning. The `eqToHom` is needed because `AbelianVariety.baseChange` is not exposed. In F.3, keep the pointless representation statement as a README target and make this the Lean form.

## R03 (P2) — The Picard scheme over a general base is defined both here and in JacobianChallengePartII

**Location.** README D.6, lines 701–720: "For every morphism `f : X ⟶ S`, define the Prop-valued class `HasPicardScheme f` … the **Picard scheme** `picardScheme f : Over S` as its representing object … base change (for `b : S' ⟶ S` …)". The Scope paragraph (lines 44–47) hands the general base to "JacobianChallengePartII §§0.1–0.4".

**Claim.** The object has one owner.

**Witness.** At the head of pull request #1225, JacobianChallengePartII §0.3 defines "the relative Picard scheme, Mathlib's `Functor.reprX` of that functor, an object of `Over S`", with its group law transported. Its `Suggested.lean` line 159 states `HasPicardScheme f`'s exact proposition.

**Repair.** This roadmap comes earlier in the merge order (line 1 of `ORDER.txt`, against line 69), so it keeps the object. Replace the Scope sentence with:

> The Picard scheme as a named representing object over an arbitrary base (`HasPicardScheme`, `picardScheme`, `picardSchemeIso`, its group law, uniqueness and base change) is D.6. JacobianChallengePartII §0.3 proves `HasPicardScheme` for relative curves over a noetherian base and consumes `picardScheme`; its §§0.1–0.2 and 0.4 own local constancy, the degree components and the torsors.

Also list JacobianChallengePartII §0.3 under Downstream consumers. PartII then has to cite `picardScheme` in its §0.3; that belongs to its own review.

## R04 (P2) — Results already proved at the Tau Ceti pin are planned again

**Location.** README C.1 line 458 ("construct `R^q f_* F`"). C.2 lines 485–503 ("**Flat base change** … over `S = Spec A`, `S' = Spec B` it reads `H^q(X, F) ⊗_A B ≅ H^q(X_B, F_B)`", semicontinuity, cohomology and base change). A.3 lines 242–247 ("prove that principal divisors have degree zero … `deg L = χ(L) − χ(𝒪_X)` is Riemann–Roch, proved in B.2"). B.2 line 289. F.2 lines 1038 and 1045–1049.

**Claim.** These are open targets of this roadmap.

**Witness.** At Tau Ceti 2fd255d9:

- `Scheme.Hom.higherDirectImage` (`Cohomology/HigherDirectImage/Basic.lean:42`);
- `bijective_cohomologyBaseChange` (`Cohomology/FlatBaseChange.lean:185`);
- `relativeDegree_principalDivisor` and `InvertibleSheaf.eulerDegree_eq_relativeDegree` (`WeilDivisor/Scheme/EulerCharacteristic.lean:256, 303`);
- `abelJacobiMap_app_injective_of_genus_pos` (`PicardFunctor/Abel/PointSeparation.lean:119`).

**Repair.** List these in "From Tau Ceti", together with the following, all under `TauCeti/AlgebraicGeometry/`:

| Declaration | File and line | Use in the README |
| --- | --- | --- |
| `cohomologyBaseChangeLinearEquiv` | `Cohomology/FlatBaseChange.lean:241` | C.2 flat base change |
| `finrank_cohomology_pullback_eq_of_isPullback` | `Cohomology/FlatBaseChange.lean:277` | C.2's first Check |
| `genus_eq_of_isPullback` | `Cohomology/BaseChange.lean:512` | C.2's first Check |
| `upperSemicontinuous_finrank_cohomology_one_fiber` | `Cohomology/Semicontinuity.lean:130` | semicontinuity on a two-affine cover, top degree |
| `bijective_cohomologyBaseChange_zero_of_subsingleton_cohomology_one` | `Cohomology/CohomologyAndBaseChange.lean:113` | degree-zero cohomology and base change on a two-affine cover |
| `isZero_higherDirectImage_succ_of_isClosedImmersion` | `Cohomology/HigherDirectImage/ClosedImmersion.lean:44` | C.1's first Check |
| `isFinitePresentation_higherDirectImage_of_isFinite` | `Cohomology/HigherDirectImage/Affine.lean:120` | C.1's first Check |
| `subsingleton_cohomology_twistingSheaf_of_lt_card` | `Cohomology/ProjectiveSpace/HigherCohomology.lean:740` | C.1's Čech route |
| `free_cohomology_zero_twistingSheaf` | `Cohomology/ProjectiveSpace/TwistingSheaf.lean:113` | C.1's Čech route |
| `LineBundleClass.picZero` | `WeilDivisor/Scheme/PicZero.lean:92` | A.3, `Pic⁰ = ker deg` |
| `eulerDegree_eq_finrank_mul` | `LineBundle/Degree.lean:157` | A.3, degree under base change |
| `WeierstrassCurve.toAbelianVariety` | `EllipticCurve/Scheme/AbelianVariety.lean:65` | F.2 reconciliation |
| `projModelPointsMulEquiv` | `EllipticCurve/Scheme/GroupLaw.lean:117` | F.2 reconciliation |
| `pointAddEquivPicZero` | `EllipticCurve/Scheme/PicZero.lean:120` | F.2 reconciliation |

Then restate each target as what remains, saying in one clause how it differs from the pinned result:

- **C.1:** coherence of `higherDirectImage` for proper `f`.
- **C.2:** flat base change for a non-affine `S` through `higherDirectImage`. Semicontinuity and cohomology and base change for proper `f` in every degree, beyond the two-affine-cover, top-degree results at the pin.
- **A.3 and B.2:** cite the pinned degree and the pinned identity `deg L = χ(L) − χ(𝒪_X)`. B.2 keeps only `χ(𝒪_X) = 1 − g` from `H⁰ = k`.
- **F.2:** cite point separation. The reconciliation becomes: `isIso_abelJacobi_of_genus_eq_one` for `projModel W`, composed with `toAbelianVariety`, is an isomorphism of abelian varieties, and Mathlib's addition law follows from `projModelPointsMulEquiv` and `pointAddEquivPicZero`.

Lines 466–468 and 503 ("lives in", "These live in") should say which of the named files exist at the pin and which are proposed.

## R05 (P3) — C.3's third Check is false

**Location.** README lines 533–534: "The theorem fails without properness: for `𝔸¹_A → Spec A`, `H⁰(𝔸¹_A, 𝒪) = A[x]` and its `t`-adic completion `A[x]^` is strictly smaller than `lim_n (A/(tⁿ))[x]`."

**Witness.** The `t`-adic completion of `A[x]` is by definition `lim_n A[x]/tⁿA[x] = lim_n (A/tⁿ)[x]`; both are the restricted power series `A⟨x⟩`. For affine morphisms the comparison always holds.

**Repair (tested).** Use a morphism that is neither affine nor proper. Take `X = ℙ¹_A ∖ {∞₀}`, where `∞₀` is the point at infinity of the special fibre.

- `ℙ¹_A` is regular of dimension two and `∞₀` has codimension two, so `H⁰(X, 𝒪) = A`, which is already `t`-adically complete.
- Each `X_n = 𝔸¹_{A/tⁿ}`, so `lim_n H⁰(X_n, 𝒪) = A⟨x⟩ ≠ A`.

## R06 (P3) — F.2 identifies `T_0 J` with the dual of `H¹(X, 𝒪_X)`

**Location.** README lines 1039–1040: "the dual of `T_x X → T_0 J = H¹(X, 𝒪_X)^∨` is the evaluation map `H⁰(X, Ω_{X/k}) → Ω_{X/k} ⊗ κ(x)`".

**Witness.** D.4 (line 667), the `dim_jacobianVariety` docstring and Milne, *Abelian Varieties*, III Proposition 2.1 (p. 91) give `T_0 J ≅ H¹(X, 𝒪_X)`. As written, the dual map starts at `H¹(X, 𝒪_X)`, not `H⁰(X, Ω_{X/k})`.

**Repair.** Write "`T_0 J = H¹(X, 𝒪_X) ≅ H⁰(X, Ω_{X/k})^∨` (D.4, then Serre duality, B.3)". The dual of `T_x X → T_0 J` is then `H⁰(X, Ω_{X/k}) → Ω_{X/k} ⊗ κ(x)`, as in Milne's proof of Proposition 2.3 (p. 93).

## R07 (P3) — The Hilbert scheme of points is built twice, and D.4–D.5 need the later D.7

**Location.**

- C.4, lines 538–545: "construct a natural identification of `Symᵈ X = Hilbᵈ_{X/k}` with the functor … Use SchemeAndStackFoundations §4.14's Hilbert schemes".
- D.7, lines 750–763: "prove `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` … the construction needs no Quot scheme".
- *Needs:* lines of D.4 (line 671) and D.5 (line 690), which both cite D.7.

**Witness.** One functor, `relativeEffectiveCartierDegreeSubfunctor`, gets two representability targets with different hypotheses (geometrically integral against none) and routes. D.4 (lines 668–669) and D.7 (766–767) both claim `AJ_d` surjective for `d ≥ g` and `AJ_g` birational.

**Repair.** Keep a single representability target in C.4, with D.7's hypotheses and route (Stacks 0B9A, then smooth proper of dimension `d` by 0B9I), and move its `Suggested.lean` declaration under a `Layer C` heading. Make D.7 the Abel maps alone, stated once, with D.4 citing them, and place D.7 before D.4 so that every *Needs:* line points backwards. No other roadmap cites the D.x numbers, which are new in this pull request, so no old → new table is needed.

## R08 (P3) — E.7 does not export the geometric `n`-torsion that StableReduction consumes from Layer E

**Location.** README lines 973–980 (E.7). Downstream consumers, line 1095: "StableReduction Layer 2 (contract J-C) consumes Layer C's …".

**Witness.** StableReduction on main, contract J-E (its README line 310): "`[ℓ]` is finite étale of degree `ℓ^(2g)` and its geometric kernel is `(ℤ/ℓℤ)^(2g)`. Export the finite étale kernel and its Galois action". E.7 states only the degree and étaleness.

**Repair.** Add to E.7: for `n ≠ 0` invertible in `k`, the kernel `A[n]` is a finite étale group scheme whose `k^sep`-points form a free `ℤ/n`-module of rank `2 dim A`, with its `Gal(k^sep/k)` action (Milne, *Abelian Varieties*, I Remark 7.3, p. 34). Add a Check: for an elliptic curve over a separably closed field this gives `(ℤ/n)²`, which agrees with Tau Ceti's count in `TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/FieldPoints.lean`. Under Downstream consumers, list StableReduction's contracts J-A1, J-A2, J-B, J-D and J-E beside J-C.

## R09 (P3) — Two statements in `Suggested.lean` describe the pins wrongly

**Location.** `Suggested.lean` line 43: "the identification `T₀ Jac X ≅ H¹(X, 𝒪_X)` (no tangent-space carrier on `Over (Spec k)` at the pin)". Line 73: `@[stacks 0BS2 "(5) and (6), with the trace named"]`.

**Witness.** Tau Ceti's `AbelianVariety.TangentSpace` (`AbelianVariety/TangentSpace.lean:85`, with `finrank_tangentSpace_eq_dim` at `:193`) exists; `Module k (JacobianVariety X).TangentSpace` elaborates at the pin. Line 74 quantifies the trace existentially: it is not named.

**Repair.**

- Line 43: "the canonical identification `T₀ Jac X ≅ H¹(X, 𝒪_X)`: the deformation map into Tau Ceti's `AbelianVariety.TangentSpace` is a construction not available at the pin; its dimension consequence is `dim_jacobianVariety`".
- Cite `AbelianVariety.TangentSpace` and `finrank_tangentSpace_eq_dim` in D.4, in D.8 and in the Tau Ceti contract, since they are the route to `dim_jacobianVariety`.
- Attribute: `@[stacks 0BS2 "(5) and (6); the trace is quantified, its residue normalisation is README B.3"]`.

## R10 (P3) — Three locators do not contain the statement they are cited for

**Location.**

- (a) README line 1045 and `Suggested.lean` line 268: "Milne … III Proposition 2.3 and Remark 12.5" for `Jac (E, O) ≅ E`.
- (b) README line 793: "(Stacks 0CDR for its Galois form)".
- (c) README lines 495–496: "upper semicontinuous (Stacks 0BDN) and `s ↦ χ(X_s, F_s)` is locally constant".

**Witness.**

- (a) Milne Remark 12.5 (p. 121) concerns Torelli in genus at most one, not the pointed isomorphism.
- (b) Stacks 0CDR (Lemma 35.6.1, p. 2995) descends quasi-coherent modules, not schemes.
- (c) Local constancy of `χ` is Stacks 0B9T (Lemma 36.32.2, p. 3148), absent from 0BDN.

**Repair.**

- (a) Cite III Propositions 2.1 and 2.3 (pp. 91–92). They give the dimension-and-closed-immersion argument that the README already writes.
- (b) At "each descends … and the pieces glue", add Stacks 0245 (Lemma 35.37.1, p. 3065: descent data on affine morphisms are effective) and 0AP4 (Lemma 35.35.13, p. 3063: locally effective descent data are effective).
- (c) Add Stacks 0B9T after the `χ` clause. D.6 relies on it.

## Verified sound

**Previous review, finding by finding.**

- **R01 (sorry'd data): repaired.** The gate reports `sorry-data=0`. `jacobianScheme := (picZeroSets X).reprX` (line 152), `JacobianVariety` (lines 200–206) and `abelJacobi` (lines 240–245) have real bodies, and duality is `serreDuality_exists_trace` with "`∃ t`" (line 77).
- **R02 (inseparable residue fields): repaired.** B.3 now reads: "the residue is … the local component at `x` (Tau Ceti's `repartitionDualComponent`), evaluated at `1`, of the Weil differential". It adds the requested `𝔽_p(t)` negative control (lines 351–358). I recomputed it: `res_∞(η) = −1`, so `res_P(η) = 1`, while `Tr_{κ(P)/k}` would give `0`.
- **R03 (degree pieces): repaired.** D.6 now keeps only "`relativePicardDegreeZeroFppfSheaf X.hom` is represented … by an open and closed subgroup scheme" and cites SchemeAndStackFoundations §3.6 and JacobianChallengePartII §§0.1–0.4 for `Pic^d`. (R03 of this review is a different overlap: the object `picardScheme` itself.)
- **R04 (padding): repaired.** `cartierPicardEquiv`, `cartier_sheaf_iso_iff_principal` and `properIntegralGroup_commutative` are gone.
- **R05 (README form): repaired.** The four house headings are present, with `### X.n` subsections and Examples and Dependencies in every layer. No "v1", "v2", "Codex", "Acceptance criteria" or "deferred" remains.

**Gate, build, dependency check.**

- My run of the gate at this head: `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also shows `build=0`.
- `lake env lean …/Suggested.lean`: 14 warnings, all "declaration uses `sorry`" (lines 61–282), exit 0.
- Dependency check with `--movable`: `depcheck: 237 roadmaps, 2420 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` lists only `README.md` and `Suggested.lean` of this folder.

**Signatures.** In a scratch copy I ran `#check @` on all 26 declarations. Every elaborated type matches the worker's `signatures.md` and the README statement, and no binder is lost: the `def`s and instances carry `SmoothOfRelativeDimension 1`, `IsProper` and `GeometricallyConnected` explicitly. The same copy elaborated the R02 repair and `Module k (JacobianVariety X).TangentSpace`; this needed `lake build TauCeti.AlgebraicGeometry.AbelianVariety.TangentSpace` first.

**Padding probe.** None of the 14 sorried theorems closes in one step at the pin:

- the pin has representability instances only for `d = 0, 1` (`EffectiveCartierDivisor/Representable.lean:94, 160`);
- `isIsogeny_mulBy_neg_one` (`AbelianVariety/Isogeny.lean:150`) covers only `n = −1`;
- `isIsogeny_mulBy_zero_iff` (`DimensionZero.lean:120`) covers only `n = 0`;
- the existing base-change result is for the presheaf, not the fppf sheaf;
- the rest are the deep theorems themselves.

**Headline theorems** (Summary and Layer F), and where they are stated:

| Headline theorem | Status in `Suggested.lean` |
| --- | --- |
| `Jac X` representing `Pic⁰` without a rational point | stated: `isRepresentable_picZeroSets`, `jacobianScheme`, `JacobianVariety` |
| `Jac X` proper and geometrically integral | stated |
| Albanese property of the Abel–Jacobi map | stated |
| closed immersion for `g ≥ 1` | stated |
| isomorphism for `g = 1` | stated |
| `dim Jac X = g` | stated |
| base change | stated only as an existential stand-in (R02) |
| finiteness of coherent cohomology | stated |
| Serre duality through a trace | stated |
| the Picard and Hilbert schemes | stated |
| `[n]` an isogeny; `[n]` étale iff `n` invertible in `k` | stated |
| dual abelian variety, polarizations, theta, autoduality | named as not statable (no dual carrier at the pin; confirmed: no dual file under `AbelianVariety/`) |

**Library declarations opened at the pins (37, Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b).**

- Picard functors:
  - `relativePicardFppfSheaf` (`PicardFunctor/Fppf.lean:104`);
  - `relativePicardDegreeZeroFppfSheaf` (`PicZero/Fppf.lean:114`) and its `ι` (`:192`);
  - `relativePicardDegreeZeroFunctorBaseChangeIso` (`PicZero/BaseChange.lean:158`) and `…RepresentableBy` (`:234`);
  - `relativePicardPresheafBaseChangeIso` (`PicardFunctor/BaseChange.lean:115`);
  - `relativePicardFiberDegree` (`PicZero/Basic.lean:141`);
  - `rigidifiedPicardDegreeZeroFunctorIso` (`PicZero/Rigidified.lean:255`).
- Abel maps:
  - `abelJacobiMapToPicZeroFppf` (`Abel/Fppf.lean:91`; it sends `x` to `𝒪(Γₓ − x₀)`, matching `a(x) = 𝒪(x − x₀)`);
  - `abelJacobiMapOfDegree` (`Abel/Degree.lean:110`);
  - `abelJacobiMap_app_injective_of_genus_pos` (`Abel/PointSeparation.lean:119`).
- Divisors: `relativeEffectiveCartierDegreeSubfunctor` (`EffectiveCartierDivisor/Degree/Basic.lean:59`; rank constantly `d`, requires `IsProper` and `RelativeDimensionLE 1`) and `relativeEffectiveCartierDegreeOneSection` (`:85`).
- Abelian varieties:
  - `AbelianVariety` (`AbelianVariety/Basic.lean:95`), `dim : WithBot ℕ∞` (`:118`), `baseChange` (`:281`);
  - `IsAlbanese` (`Albanese.lean:84`; fields `comp_eq_one`, `existsUnique_fac`) and `isAlbanese_of_isIso` (`:215`);
  - `mulBy` (`End/Basic.lean:237`), `IsIsogeny` (`Isogeny.lean:61`; finite and surjective);
  - `TangentSpace` (`TangentSpace.lean:85`).
- Cohomology:
  - `Scheme.genus` (`Cohomology/Genus.lean:64`; `ℕ`, guarded by finite-dimensionality);
  - `cohomologyMapBaseLinear` (`Cohomology/Module/Base.lean:60`);
  - `finiteDimensional_cohomology_one_trivial_of_smooth` (`WeilDivisor/Scheme/RiemannRoch/Finiteness.lean:79`; discharges the genus guard of the three genus statements);
  - the R04 list.
- Function-field differentials:
  - `repartitionToCohomologyOne` (`PrincipalParts/RepartitionCohomology.lean:155`);
  - `relativeDifferentialsIsoDivisorSheaf` (`Modules/Differentials/Canonical.lean:170`);
  - `weilDifferentialOfSeparating` (`FieldTheory/FunctionField/Differential/Comparison.lean:91`) and `kaehlerDifferentialEquivWeilDifferentialOfSeparating` (`:156`);
  - `repartitionDualComponent` (`LocalComponent.lean:84`), `apply_eq_finsum_repartitionDualComponent` (`:186`) and `finsum_repartitionDualComponent_eq_zero` (`:219`);
  - `Place.traceResidue_coord_smul_eq_repartitionDualComponent` (`Independence.lean:275`).
- Other Tau Ceti:
  - `DescentDatum` (`CategoryTheory/Limits/Shapes/Pullback/DescentDatum.lean:86`) and `exists_isAffine_baseChange_hom_isIso` (`AlgebraicGeometry/Descent/Affine.lean:532`);
  - `IsIwanagaGorenstein` (`RingTheory/IwanagaGorenstein.lean:48`);
  - `Scheme.IsCurveOver` (`Curves/Basic.lean:37`).
- Mathlib:
  - `GeometricallyConnected` (`Geometrically/Connected.lean:40`; `ConnectedSpace` of geometric fibres, so `X` is nonempty);
  - `SmoothOfRelativeDimension` (`Morphisms/Smooth.lean:127`).

**Cross-roadmap citations resolved.**

- SchemeAndStackFoundations on main (7e2fae4): §0.9 (line 848), §0.11 (938), §1.1 (2071), §2.2 (3309), §2.11 (3656), §3.6 (4905, `picardComponent`, `picardComponent_torsor`), §3.7 (4937), §4.9 (5448, exports `Scheme.Modules.Cohomology.formalFunctionsIso` at line 5457; this resolves the resolver's one lead), §4.12 (5613, `chow_lemma` 5625), §4.14 (5706).
- JacobianChallengePartII at the head of #1225: §§0.1–0.4, 2.1 and 2.6 exist.
- AlgebraicModuliForArithmeticGeometry at the head of #853: §7.3 exists (a deferral, not a supplier).
- AbelianSchemesAndArithmeticModuli at the head of #849: A0.2 and A2.2 exist (consumers).
- Consumers on main that cite this roadmap: EtaleCohomologyFoundations (§0.11, Layer D), StableReduction (contracts J-A1–J-E), EnhancedDerivedSheaves (Layer C), AdicSpacesPartIII (B–C), AlgebraicCurves, ModularCurves, AlgebraicVectorBundles.
- This roadmap and SchemeAndStackFoundations already cited each other at the target level on main (C.1 → §4.9 → D.3; Layer B → §§2.20, 3.3). This pull request does not add an edge in the reverse direction, and the dependency check accepts it.

**Overlaps.**

- #1187 (Tau Ceti bump) conflicts textually, but its target `ab00ba392` (2026-10-19) is an ancestor of the pin 2fd255d9, so it is superseded and no merge order needs stating.
- No ids cited here are dropped by an open pull request, and this pull request drops no id that others cite.
- The closest open roadmaps in vocabulary:
  - JacobianChallengePartII gives R03.
  - AlgebraicModuliForArithmeticGeometryPartII, ModularCurves, AbelianSchemesAndArithmeticModuli and SchemeAndStackFoundations revisions consume or defer.
  - Searching all open heads for "Gorenstein curve", "regular differentials", "Rosenlicht", "theorem of the cube", "dual abelian variety", `Symᵈ X` and `Hilbᵈ` found no second owner besides R01 and R03. FunctionFieldArithmeticPartII's root symmetric powers and FunctionFieldArithmetic's Rosenlicht ray Abel map are different objects that consume this roadmap.

**Sources (seeded sample).**

*"Cohomology and base change" (C.2).*

- Stacks 02KH (Lemma 30.5.2, p. 2591; `f` quasi-compact and quasi-separated, `g` flat, `F` quasi-coherent): as stated.
- Stacks 0B91 (Lemma 36.30.4, p. 3144; `f` proper of finite presentation, `G` finitely presented and flat): supports the perfect-complex sentence, over any `S`.
- Stacks 0BDN (Lemma 36.32.1, p. 3147): semicontinuity, under the same hypotheses.
- Stacks 02O5, 02O6, 01XK (pp. 2631, 2632, 2590): as stated.
- The README's statements are at or below the sources' generality. They narrow to locally Noetherian `S` and recover arbitrary test schemes through SchemeAndStackFoundations §0.9.
- The `χ` clause needs 0B9T (R10).

*"Jacobian scheme" (D.8).*

- Stacks 056U (Lemma 33.25.6, p. 2863; closed points with separable residue field are dense on a smooth `X`): as stated.
- Stacks 01ZY (Lemma 28.30.5, p. 2422; a finite set lies in an affine open when there is an ample sheaf): as stated, applied to the projective `Pic⁰_{X_l/l}`.
- Kleiman, Theorem 5.11 (p. 42; `T_0 Pic = H¹(𝒪_X)` over a field): as stated.
- Milne III Proposition 2.1 (p. 91; `dim J = g`): as stated.
- Stacks 0CDR supports only the module case (R10).

*Also checked.*

- Stacks:
  - 0B9Z and 0BA0 (pp. 3930; separably closed, as the attributes say);
  - 0B9A, 0B9D, 0B9I, 0B9J (pp. 3921–3925; 0B9I requires geometrically irreducible, as D.7 says);
  - 0A26 (p. 2908);
  - 02L6 (p. 3033);
  - 0BS2, 0BS3, 0BS6 (pp. 4437–4442).
- Milne:
  - III Proposition 2.3 and Lemma 2.4 (p. 92);
  - I Theorem 7.2 (p. 33) and Remark 7.3 (p. 34).
- Tate 1968:
  - §3 Definition (`tate1968` line 234, p. 154);
  - Theorem 2 (line 243, p. 155; `k`-rational points only, as B.3 says);
  - Theorem 3 and its Corollary (lines 256, 262, p. 155; `X` connected, regular, proper);
  - §4 Theorem 5 (line 371, p. 158) and its Corollary (line 377, p. 159; `X/k` smooth, invertible `L`).

  These support B.3 and the docstring of `serreDuality_exists_trace` as written. Tate's §4 is for regular curves only (line 333), which is further reason to drop the Gorenstein claims of B.4 (R01).

**Adversarial table.**

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| `finiteDimensional_cohomology` | `X = ∅`; `𝔸¹_k` (not proper); `ℙ¹_k`, `𝒪(−2)` | `0`; `H⁰ = k[t]` is infinite, outside the hypothesis; `h¹ = 1`, `h⁰ = 0` | holds | none |
| `serreDuality_exists_trace` | `X = ∅` | `H¹ = 0`, `Hom(F, Ω) = {0}`, `t = 0` | holds | none |
| same | `ℙ¹_L/k`, `[L:k] = 2` separable | `F = Ω`: `Hom = L` (dim 2), `H¹(Ω)^∨ = L^∨` (dim 2) via `Tr_{L/k}`; `F = 𝒪`: `0 = 0` | holds | none |
| same | skyscraper `κ(x)` of degree `e` | `H¹ = 0`, `Hom(κ(x), Ω) = 0` | holds | none |
| B.3 Check 1 | `dt/t` on `ℙ¹_k` | `res_0 = 1`; `res_∞ = −1`; sum `0` | holds | none |
| B.3 negative control | `𝔽_p(t)`, `P : x^p = t`, `η = x^{p−1}dx/(x^p − t)` | `u = 1/x`: `η = −du/(u(1 − tu^p))`, `res_∞ = −1`, so `res_P = 1`; `Tr_{κ(P)/k} = 0` | holds | none |
| B.4 (Gorenstein) | nodal cubic; `k⟦t³,t⁴,t⁵⟧` | `ω ≅ 𝒪`, `deg 0 = 2·1 − 2`; pseudo-Frobenius set `{1, 2}`, type 2, needs 2 generators | true, but owned elsewhere | R01 |
| B.5 degree formula | `ℙ¹_L/k` | `χ_k(Ω) − χ_k(𝒪) = −2 − 2 = −4 ≠ 2g − 2 = −2`; `h⁰(Ω) = 0 = g` | the hypothesis is needed, as stated | none |
| A.3 Checks | `𝒪(1)`, `𝒪(−3)` on `ℙ¹`; `x² + 1` on `ℙ¹_ℝ` | `2 − 1 = 1`; `(0 − 2) − 1 = −3`; degree `2`, `𝒪(P) ≅ 𝒪(2)` | hold; the identity is pinned | R04 |
| C.1 Check 1 | `Spec(A/t) → Spec A` | `R^{≥1} = 0`; `H⁰ = k`, finite, not flat | holds; pinned | R04 |
| C.2 flat base change | `S = Spec A`, flat `A → B` | `H^q(X,F) ⊗ B ≅ H^q(X_B, F_B)` = `bijective_cohomologyBaseChange` | holds; pinned | R04 |
| C.2 Check 3 | sections `[1:0:0]`, `[0:1:0]`, `[1:1:t]` in `ℙ²_{𝔸¹}` | `h⁰ = 1` at `t = 0`, `0` elsewhere; `χ = 3 − 3 = 0`; `f_*F ⊂ 𝒪³` is generically `0`, so `0` | holds | none |
| C.3 Check 3 | `𝔸¹_A → Spec A` | `A[x]^ = lim (A/tⁿ)[x] = A⟨x⟩` on both sides | **false** | R05 |
| C.3 repair | `ℙ¹_A ∖ {∞₀}` | `H⁰ = A`; `lim H⁰(X_n) = A⟨x⟩` | fails, as wanted | R05 |
| `hasPicardScheme_of_curve` | `ℙ¹_k`; pointless conic over `ℝ` | `∐_ℤ Spec k`; `∐_ℤ Spec ℝ`, with the real point of degree 1 a sheaf section and not a bundle | holds | none |
| `HasPicardScheme (𝟙 S)` Check | — | `Pic(T)/Pic(T) = 0`; represented by the terminal object `S` | holds | none |
| `isRepresentable_relativeEffectiveCartierDegreeSubfunctor` | `d = 0, 1`; `ℙ¹`, `d = 2`; `ℙ¹ ⊔ ℙ¹`, `d = 2`; `ℙ¹_{𝔽_q}`, `d = 2` | `Spec k`, `X` (pinned instances); `ℙ²`; `Sym²ℙ¹ ⊔ ℙ¹×ℙ¹ ⊔ Sym²ℙ¹`; `(q+1)(q+2)/2 + (q² − q)/2 = q² + q + 1` | holds | R07 (two owners) |
| `isRepresentable_picZeroSets` / `JacobianVariety` | `ℙ¹_k`; pointless conic; Selmer cubic | `Spec k`; `Spec ℝ` (`l = ℂ`); an elliptic curve with `X(ℚ) = ∅`, so `X ≇ Jac` | holds | none |
| `dim_jacobianVariety` | `ℙ¹`; elliptic `E`; pointless conic | `0 = 0`; `1 = 1`; `0 = h¹(𝒪) = 0` | holds | none |
| `multiplication_isogeny` | `n = −1`, `1`; `n = p` on supersingular `E`; `n = 0` excluded | identity and `[−1]` finite and surjective; `[p]` purely inseparable of degree `p²`; `[0]` not finite when `dim > 0` | holds | none |
| `multiplication_etale_iff` | `n = 0`; `n = p` in char `p`; `n = 2` over `𝔽_3`; `dim A = 0` excluded | `[0]` not quasi-finite, and `(0:k) = 0`; `A[p]` nonreduced, `(p:k) = 0`; étale, `(2:𝔽_3) ≠ 0`; in dim 0, `[p] = id` is étale while `(p:k) = 0`, so `0 < dim` is needed | iff holds | none |
| `abelJacobi` | base point | `abelJacobiMapToPicZeroFppf_app_basePoint` gives `x₀ ↦ 0` | consistent with `comp_eq_one` | none |
| `isAlbanese_abelJacobi` | `g = 0`; `g = 1` | every pointed `ℙ¹ → A` is `0`, and `Hom(Spec k, A) = {0}`; `a` is an isomorphism, `isAlbanese_of_isIso` | holds | none |
| `isClosedImmersion_abelJacobi` | `g = 0` excluded; `g = 2` | `ℙ¹ → Spec k` is not a closed immersion; `h⁰(Ω(−x)) = g − 1 = 1 < 2`, so the tangent map is injective | holds | none |
| F.2 tangent identification | `T_0 J` against D.4 | `H¹(𝒪)^∨` (F.2) against `H¹(𝒪)` (D.4, Milne 2.1) | inconsistent | R06 |
| `isIso_abelJacobi_of_genus_eq_one` | `g = 1`; `g = 2` | `dim 1 = 1`, a closed immersion of integral curves; `dim 2 ≠ 1` | holds | R10 (locator) |
| `jacobianVariety_baseChange` | `K = k`; conic `→ ℂ`; Selmer `→ l` | `id`; `Spec ℂ`; `X_l` — but only as a `K`-scheme isomorphism | true, too weak | R02 |
| R02 repair `isAlbanese_baseChange_abelJacobi` | elaborated at the pin; `g = 1` | for `E`, `(a)_K` is an isomorphism, so `isAlbanese_of_isIso` | holds | R02 |
| E.5 and E.6 signs | elliptic `E`, `L = 𝒪([0])` | `φ_L(b) = 𝒪([−b] − [0])`; `q(𝒪([b] − [0])) = b`; `q ∘ λ_Θ(b) = −b` | `[−1]` as stated | none |
| E.7 torsion contract | StableReduction J-E | needs `(ℤ/ℓ)^{2g}` with Galois action; E.7 gives the degree only | missing | R08 |
| D.5 Check | genus 2, `AJ_2` over `K_X` | fibre `|K| ≅ ℙ¹` | holds | none |

## Not verifiable

- Hartshorne, *Algebraic Geometry* (II.6.13–6.15, III.5.1–5.2, III §7, III.12.8–12.11): no legal copy; standard statements cross-checked against Stacks 02O5, 02O6, 0BDN and 0B91.
- Mumford, *Abelian Varieties*, §§5, 13: no legal copy; cross-checked against Stacks 0B91 and 0BDN, and Milne I §8.
- Serre, *Algebraic Groups and Class Fields*, Chapter II; Stichtenoth, *Algebraic Function Fields and Codes*, 2nd ed., Sections I.7 and 4.3; Liu; Bosch–Lütkebohmert–Raynaud, Chapters 8–9: no legal copy; cited for background only.
- Milne, *Jacobian Varieties* (Cornell–Silverman): the README's Part III numbering and pages were checked against the *Abelian Varieties* v2.0 course notes, which it names.

## Source issues

- none

# PKG-EllipticCurveModularityTotallyReal: package report

Deliverables: `packages/EllipticCurveModularityTotallyReal/README.md`, `Suggested.lean`,
`metadata.toml` (`topic = "math.NT"`, as every number-theory folder on main), `sources.toml`
(`cited_for` labels updated, no new work), and `design/plan.json` (its `gaps` list checked and left
unchanged: the three declared gaps are still unsupplied at their owners' heads and remain correct).

The README is the accepted design written out, with the corrections listed below. Every target,
Check and worked example of the design is kept; Checks were added in §§1.1 and 2.3.

## Headline theorems

| Headline (README) | Status |
|---|---|
| Totally real modularity, with every ℓ, every finite place, L-function, rational Hilbert newform of exact level `𝔫_E` (§4.4) | Not statable: no cuspidal automorphic representations of `GL₂(𝔸_K)` over a number field, no Hilbert attachment, no local Langlands / Weil–Deligne parameters, no automorphic induction at the pins |
| All-place comparison for a modular elliptic curve over a totally real field (§4.2) | Not statable: same carriers |
| Non-CM modularity by reflection descent and soluble descent (§4.1) | Not statable: same carriers |
| CM curves over a totally real field are the cuspidal induction `AI_{KT/K}(θ)` (§4.3) | Not statable: same carriers, plus Galois avatars of algebraic Hecke characters |
| Reflection descent: totally odd rank-two systems `W_θ` over `L`, integral lattices, congruence chain `W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1`, elliptic endpoints (§§1.2–1.6) | Not statable: the cyclic covers, their twists, étale `H¹` of higher-genus curves with `ℤ_ℓ`/`ℚ̄_ℓ` coefficients, Jacobians with rotation idempotents, compatible-system carrier |
| Summand weight-two lifting, change of coefficient prime, mod-3 and mod-5 seeds over totally real fields (§§2.1, 2.2, 2.4, 2.5) | Not statable: modularity / residual modularity is defined through the missing Hilbert attachment |
| Specialization and three lifts over `L` (§§3.1–3.3) | Not statable: covers and attachment |
| Real cyclotomic subfield over a totally real base is the maximal real subfield of the CM field `k(μ_n)` (§1.1) | **Stated**: `realCyclotomic_isCMField` |
| 3–5 switch over a number field, with infinitely many j-invariants (§2.3) | **Stated**: `three_five_switch` |

Both stated theorems carry the reasons the accepting review gave for statability; `Suggested.lean`
names every unstatable headline with its missing carrier in its module docstring. No definitions
were needed: both statements use native carriers only (`IntermediateField.adjoin`,
`NumberField.maximalRealSubfield`, `WeierstrassCurve.torsionGaloisAction`,
`TauCeti.Isogeny.weilPairing`, `Module.Basis`, `Matrix.SpecialLinearGroup`). The pairing-preserving
equivariant isomorphism of five-torsion is written inline rather than as a new definition, because
EllipticCurveModularityImaginaryQuadratic §0.2 already owns that notion as `SymplecticTorsionEquiv`
and a roadmap's Lean file may not import another roadmap's module.

`realCyclotomic_isCMField` is the field-theoretic statement on which the totally real branch rests
(Mathlib has it only over ℚ, `IsCyclotomicExtension.Rat.isCMField`); it is not a one-tactic
consequence of the library. It is included because it is statable and is the headline of §1.1, as
the accepting review required.

## What the README could not support

Nothing in the design had to be weakened. The design's statements that need the cyclic covers and
the automorphic carriers remain README targets on the supplier carriers.

## Notions moved down from later roadmaps

None. Every supplier is on main or earlier than this roadmap (position 195, right after
EllipticCurveModularityImaginaryQuadratic at 194).

## Corrections made while writing out the design

1. §4.3: the Hecke character of `E ⊗_K KT` and the splitting of its Tate module now come from their
   owner, ComplexMultiplicationAndExplicitReciprocity §4.1 ("The algebraic Hecke character of a CM
   abelian variety", "One-dimensional CM components of the Tate module"), whose hypotheses (all
   endomorphisms over the base) hold over `KT` by the CM gap. The design re-derived the characters
   from AutomorphicGaloisRepresentations §3.13; that route is kept as an alternative. The duality
   between `V_ℓ(E)` (where that section works) and `H¹(E)` is now explicit, with geometric
   Frobenius on `H¹` acting by the conjugates of `θ(v)`; added to the Needs line, to the CMER
   supplier subsection and to Layer 4 Dependencies.
2. Scope: two kept variants now say how they differ: §4.3 versus ECMIQ §8.6 `cm_elliptic_realization`
   (totally real base, only the induced branch) and versus CMER §4.2 (rational CM curves only).
3. Scope and the CMER contract: a clause saying that a `j = 0` contract "is also placed/required" on
   ComplexMultiplicationAndExplicitReciprocity was removed. CMER's head contains no such section; the
   clause described another roadmap's request, which is process narrative and unverifiable.
4. Supplier contracts: the three "Required of X" subsections became the suppliers' own
   `From TauCetiRoadmap.<X>` subsections, as the brief requires (GL2AutomorphicRepresentationsAndTransfer's
   gap text moved into its existing subsection). The `What <Supplier> must provide (gap:<slug>)` lines
   are unchanged and match `plan.json`.
5. §2.3: the proof sketch asserted infinitely many j-invariants without the finiteness step; it now
   says the j-map `Y → 𝔸¹` is finite. The statement's Lean form is described, including the
   non-vacuity of "every basis" (`WeierstrassCurve.nonempty_basis_torsionBy`).
6. §1.1: the LeHung26 locator is scoped to `n = 3p` over a totally real base (LeHung26 line 237); the
   general relative statement is ours. The README now says which assertions of the fourth item the
   Lean statement contains and how the others follow.
7. The "Statability at the pins" paragraph became "The Lean file", naming the two Lean declarations.
8. Mathlib and Tau Ceti contracts extended by the declarations the statements use
   (`IsPrimitiveRoot`, `IntermediateField.adjoin`, `AlgebraicClosure`, `Module.Basis`,
   `Module.Basis.equivFun`, `Matrix.SpecialLinearGroup`, `TauCeti.Isogeny.pointTorsionModule`), with
   files; each checked at the pins.

## Duplication sweep (by object) and removals

Searched main, the 438 open roadmap heads (`roadmaps grep`, README and Lean), the board packages and
the pinned libraries.

| Object | Finding | Action |
|---|---|---|
| `k(μ_n)` CM with maximal real subfield `k(ζ+ζ⁻¹)` over totally real k | Mathlib only over ℚ (`IsCyclotomicExtension.Rat.isCMField`); no roadmap states the relative case (hits for `maximalRealSubfield` in CyclotomicClassGroupsAndStickelberger, IntegralIwasawaTheory, ExplicitNumberFields, CMER Part II concern class numbers and units) | Owned here |
| Reflection twist and descended systems | No other occurrence; ECMIQ (imported) and its CM Part II (board package, excludes totally real fields) do not twist | Owned here |
| 3–5 switch over a number field | EllipticCurveModularity has none; EllipticCurveModularityWild3Adic §§6.2–6.3 (merge position 352, later) treats `G_ℚ` with arbitrary `ρ̄` and prescribed 3-adic local data, a different object; ECMIQ §0.2 owns the twisted curve and `SymplecticTorsionEquiv`, which are imported | Owned here; notion imported, not redefined |
| Hecke character of a CM elliptic curve over `KT` | ComplexMultiplicationAndExplicitReciprocity §4.1 | Now cited (correction 1); no target of ours deleted, since the design had no target for it |
| CM modularity by induction | CMER §4.2 over ℚ; ECMIQ §8.6 over CM bases | Kept variant over totally real bases, one clause each in Scope |
| Change of coefficient prime | ECMIQ §8.1 (CM base, `V_θ`); PMCS §1.6 defines the automorphy predicate only | Kept variant |
| Solvable residual modularity in cohomological weight | GL2ART R17.5.14 gives weight one only; no other roadmap | Gap kept (`totally-real-solvable-residual-cohomological-weight`) |
| Breuil–Diamond weight-two lifting over totally real fields | GL2ModularityLifting §§5.7, 5.10 restricted (verified at its head); GL2ModularityLiftingPartII is defect-one/Bianchi | Gap kept (`totally-real-weight-two-lifting`) |
| Field of definition of CM endomorphisms | Not in CMER (head checked), not in Tau Ceti (`ComplexMultiplication.lean` has `GeometricEnd`, `HasGeometricCM`, `CMAction` only) | Gap kept (`cm-elliptic-endomorphism-field`) |
| Totally real elliptic modularity endpoint | No other owner; HilbertModularForms §11.3 and ModularityAndLanglandsExtensions are consumers | Owned here |

No target was deleted: nothing the design owns exists elsewhere.

## Citations

Every cross-roadmap citation was checked against the supplier's head (or main) this round: ECMIQ
§§0.2, 1.1, 1.3, 3.1, 4.1–4.4, 5.1, 7.1, 7.4, 8.1, 8.5, 8.6 and every backticked ECMIQ name;
AutomorphicGaloisRepresentations §§3.10, 3.13, 3.14, 4.4, 4.7; AG2.0 (`IsAttached`) and AG2.P
("Independent classical and Hilbert members"); PotentialAutomorphyInfrastructure §2.3 (part (2) read);
GL2AutomorphicRepresentationsAndTransfer R16.2.13, R16.3.2, R16.3.5, R16.3.6, R16.4.4, R16.6.3,
R16.6.4, R17.4.16, R17.5.14; GL2ModularityLifting §§5.1, 5.3, 5.6–5.10, 5.14, 5.15;
ArithmeticGaloisRepresentations §§4.1, 5.3, 6.1 (`GaloisRep.IsOdd`, `GaloisRep.iso_of_frobenius_charpoly_eq`,
`TateModule.residualRep`); InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6, IG.2.7;
ModularCurvesPartII §4.10; ModularCurves §0E, Layer 3, §5B; EllipticCurves Layers 0.5, 1, 4.5a, 5;
JacobianChallenge Layers D–F; SmallRamificationAndAbelianVarietyBaseCases §5.0d (the shared raw
carrier); PotentialModularityAndCompatibleSystems §§1.1, 1.6; AbelianSchemesAndArithmeticModuli
A4.1, A6, A6.11; NeronModelsAndSemistableAbelianVarieties §§3.10, 5.1, 5.3, 5.6, 6.10;
FaltingsFinitenessAndIsogenyTheorems R28.4; ShimuraVarieties §5.3; EtaleCohomologyFoundations §0.11;
ComplexMultiplicationAndExplicitReciprocity §§1.1, 4.1, 4.2; HilbertModularForms §11.3 (consumer).
`roadmaps resolve` on the final README: no cross-roadmap citation and no Lean name found nowhere.
Every pinned Mathlib and Tau Ceti declaration named in the README was located at the pins
(Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, matching `lake-manifest.json`) with its file.

Ownership against open pull requests was checked with `roadmaps grep` / `roadmaps show` over all
438 open heads in the index. `scratch/overlaps.md` lists no pull request changing this roadmap and no
dropped id; the five closest roadmaps (ECMIQ, EllipticCurveModularityPartIIGL2TypeAbelianVarieties,
EllipticCurveModularityWild3Adic, PotentialModularityAndCompatibleSystems, AbelianSurfacesModularity)
own distinct objects (table above). No citation depends on an id that only an open revision
defines.

## Gate rule on identifiers

The README backticks exactly two names of this roadmap, `realCyclotomic_isCMField` (3 times) and
`three_five_switch` (4 times), both declared in `Suggested.lean`; no other backticked token starts
with either name or lies under the namespace `TauCetiRoadmap.EllipticCurveModularityTotallyReal`.
API bullets and Checks carry no Lean names of this roadmap.

## Elaboration

Command: `lake env lean <Suggested.lean>` from the content checkout (no `TauCeti.*` build needed; the
three imported modules' object files were present). Exit code 0. Output, verbatim except that the
absolute path is shortened to the repository-relative one:

```text
packages/EllipticCurveModularityTotallyReal/Suggested.lean:58:8: warning: declaration uses `sorry`
packages/EllipticCurveModularityTotallyReal/Suggested.lean:80:8: warning: declaration uses `sorry`
```

Exactly 2 `sorry` warnings and no other message. Header: `module`, `import Mathlib`, and the three
Tau Ceti modules `TauCeti.AlgebraicGeometry.EllipticCurve.Affine.Point.Galois`,
`...Isogeny.MulByInt.Torsion.Structure`, `...Isogeny.MulByInt.WeilPairing.Basic`. No `set_option`,
no `#check`, no definitions, no sorry'd data.

**`#check @` comparison.** A scratch copy with `#check @realCyclotomic_isCMField` and
`#check @three_five_switch` was elaborated once. Elaborated types:
`realCyclotomic_isCMField : ∀ {k M} [Field k] [NumberField k] [IsTotallyReal k] [Field M] [NumberField M] [Algebra k M] {n : ℕ}, 2 < n → ∀ [IsCyclotomicExtension {n} k M] {ζ : M}, IsPrimitiveRoot ζ n → IsCMField M ∧ k⟮ζ + ζ⁻¹⟯.toSubfield = maximalRealSubfield M`;
`three_five_switch : ∀ {K} [Field K] [NumberField K] [DecidableEq (AlgebraicClosure K)] (W : WeierstrassCurve K) [W.IsElliptic], {j | ∃ W', ∃ (_ : W'.IsElliptic), W'.j = j ∧ (∃ α, (∀ σ P, …equivariance…) ∧ ∀ P Q, e₅(αP, αQ) = e₅(P, Q)) ∧ ∀ b g, ∃ σ, ∀ P, b.equivFun (σ • P) = g.mulVec (b.equivFun P)}.Infinite`.
Every binder of the README statements is present in the declarations' own signatures (no section
`variable`s are used); nothing changed. A first draft over an arbitrary algebraic closure `Ω` with
`[IsAlgClosure K Ω]` failed to synthesize `IsSepClosed Ω` and `CharZero Ω`; the statement was put on
`AlgebraicClosure K`, as in the supplier ECMIQ, rather than adding instance hypotheses.

## Adversarial pass

Rows for every statement written or changed in this package.

| Statement | Instances tried | Values computed (both sides) | Result | Change |
|---|---|---|---|---|
| `realCyclotomic_isCMField` (Lean and §1.1 headline) | k=ℚ, n=3; n=4; n=6; n=5; k=ℚ(√2), n=8; k=ℚ(√5), n=5 | `ζ₃+ζ₃⁻¹=−1`, L=ℚ=ℚ(√−3)⁺; `i+(−i)=0`, L=ℚ=ℚ(i)⁺; `ζ₆+ζ₆⁻¹=1`, L=ℚ; `ζ₅+ζ₅⁻¹=(−1+√5)/2≈0.618`, L=ℚ(√5), `[ℚ(ζ₅):ℚ(√5)]=4/2=2`; `ζ₈+ζ₈⁻¹=√2∈k`, L=k=ℚ(ζ₈)⁺, `[ℚ(ζ₈):k]=2`; `(−1+√5)/2∈ℚ(√5)`, L=k, `[ℚ(ζ₅):k]=2` | Holds in all | Even-n and non-ℚ base Checks added |
| same, degenerate n | n=1, 2 | ζ=±1, `ζ+ζ⁻¹=±2`, M=L=k totally real, not totally complex, so `IsCMField M` false | Hypothesis `2 < n` necessary and present | none |
| same, non-totally-real base | k=ℚ(i), n=3 | M=ℚ(ζ₁₂), L=k(−1)=ℚ(i) while ℚ(ζ₁₂)⁺=ℚ(√3) | Equality false: `[IsTotallyReal k]` necessary and present | none (design Check) |
| same, wrong models | L:=k(ζ); L:=k | k(ζ)=M ≠ M⁺ since `[M:M⁺]=2`; at k=ℚ, n=5, ℚ ≠ ℚ(√5) | Both excluded by the stated equality | Check added |
| same, generality | README item 4 vs Lean | README: L totally real, `[M:L]=2`, M CM, L=M⁺, δ(c)=−1; Lean: `IsCMField M ∧ L=M⁺`; CM gives totally complex and quadratic over the totally real M⁺ | Equal generality (n≥3 ⇔ 2<n; M=k(μ_n) ⇔ `IsCyclotomicExtension {n} k M`) | README sentence on consequences added |
| `three_five_switch`, counting | `GL₂(𝔽₃)`, `SL₂(𝔽₃)`, Borel, Cartan normalizers | 48, 24, 12, 8 (split), 16 (nonsplit); 24 divides none of 12, 8, 16 | Image ⊇ SL₂ forces irreducible mod 3 | none |
| same, ζ₃ ∈ K | K=ℚ(√−3) | det on `E′[3]` is the mod-3 cyclotomic character, trivial on `G_K`; image ⊆ SL₂(𝔽₃), order ≤ 24 | "contains SL₂" satisfiable, "equals GL₂" (48) false | none (design Check) |
| same, vacuity of "every basis" | K̄ separably closed, N=3 | `nonempty_basis_torsionBy` needs `(3:K̄) ≠ 0`, true in characteristic 0 | A basis exists, so the ∀-basis clause is not vacuous; SL₂ normal in GL₂ makes ∀ and ∃ equivalent | README sentence added |
| same, pairing condition | α = [2] on `E[5]`; α = id | `e₅(2P,2Q)=e₅(P,Q)^4`, and `4 ≢ 1 mod 5`; id: `e₅(P,Q)=e₅(P,Q)` | [2] excluded although equivariant; id admitted | Check added |
| same, wrong model "α any additive isomorphism" | any W′ | `E[5] ≅ (ℤ/5)² ≅ E′[5]` abstractly, so the condition would not tie W′ to W | Excluded by the equivariance clause in the statement | none |
| same, reducible E[5] | K=ℚ, W=11a1 (rational 5-torsion point) | `X_E(5) ≅ ℙ¹` still holds (cocycle trivialized, ECMIQ §0.2), `(E,id)` a point | Statement has no irreducibility hypothesis and remains true (FLHS15 Lemma 6.1 has none) | none |
| same, infinitude of j | j-map on `X_E(5)` | degree `|PSL₂(𝔽₅)| = 60`, finite | Infinitely many t give infinitely many j | Sketch completed |
| same, matrix convention | `b.equivFun (σP) = g · b.equivFun P` | columns are images of basis vectors, as in the README's "matrices act on columns" | Consistent; SL₂ is closed under transpose, so either convention gives the same set | none |
| §4.3 via CMER §4.1 | `y² = x³ − x` over ℚ and over ℚ(√2) | CMER hypotheses over KT: g=1, T=ℚ(i) ⊂ End⁰_{KT}, reflex field T ⊂ KT=ℚ(ζ₈); at 5: 8 points, `a₅=−2`, `ψ=−1±2i`, sum −2, product 5; at 3 (inert): 4 points, `a₃=0` | Geometric Frobenius on `H¹` has eigenvalues `θ(v)` and its conjugate, matching CMER's arithmetic Frobenius values on `V_ℓ` after duality | Duality made explicit |
| §4.3 cuspidality | embedding τ of KT | ψ has weight 0 at τ, 1 at `τ∘c`; ψ^c at τ has weight 1 | ψ ≠ ψ^c, induction cuspidal | none |
| Kept variant versus CMER §4.2 | CMER §4.2 text | stated for rational CM curves `A/ℚ` only | Ours over every totally real K; K=ℚ is the overlap | Scope clause |
| CMER gap text (clause removed) | CMER head | no section on `j = 0` or `ζ₃`; §1.1 is the rational self-twist | Removed clause was unsupported | Removed |

## Dependency check

```text
depcheck: 236 roadmaps, 2152 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at 195, immediately after its
last supplier EllipticCurveModularityImaginaryQuadratic (194).

## Sources

No new work is cited and none was fetched. All nine works were already certified in the manifest
and readable in the cache; LeHung26 line 237 (§3.2) and FLHS15 lines 404–452 (Theorem 6,
Corollary 5.1, Lemma 6.1 and proof) were reopened for the two Lean docstrings. `cited_for` labels were
updated to the renamed supplier subsections and to the two Lean statements. No
`needs-references.toml` was written: nothing is missing.

## Untrusted text

No fetched text, review or roadmap contained instructions; nothing was quoted as suspicious.

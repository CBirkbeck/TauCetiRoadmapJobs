# Review of StableHomotopyKTheoryPartII (pull request #1733 at 9e5492a)

**Verdict:** accepted

Incremental re-review of the 37 changed README lines since 0163d87 (Scope line 17, the Mathlib paragraph at line 38, the RefinedTraceMethods and PadicHodgeRegulators contracts at lines 111 and 120, the new LocalFieldsRamification contract at lines 128–136, §4.8 at lines 627–650, the Layer 4 Dependencies at line 660, the deleted Stacks reference) and of what cites or depends on them. `Suggested.lean` is unchanged since aec0155b. No file outside the folder changed. Three P3 notes; nothing blocks.

## R01 (P3) — `TauCeti.integerRingEquiv` does not exist at the pin; the declaration is `Padic.integerRingEquiv`

**Location:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:130`, “`TauCeti.integerRingEquiv` (TauCeti/NumberTheory/LocalField/Padic.lean), the ring isomorphism between the valuative integer ring 𝒪[ℚ_p] and ℤ_p”; the same name at lines 627, 633, 650 and 660 (five occurrences).

**Claim:** The file is right and the declaration exists, but it is declared inside `namespace Padic` (the file's namespace from line 54 to line 206), so its full name is `Padic.integerRingEquiv`; the `TauCeti.Padic` namespace that follows (lines 208–215) does not re-declare it. The previous report's repair text used the wrong prefix and the repair copied it. The gate's name check does not cover library names, which is why it passed.

**Witness:** Pinned TauCeti/NumberTheory/LocalField/Padic.lean:54 `namespace Padic`, :86 `noncomputable def integerRingEquiv : 𝒪[ℚ_[p]] ≃+* ℤ_[p]`; the file's own docstring at :27 names it `Padic.integerRingEquiv`, and ResidueCorrespondence.lean:213 calls it as `_root_.Padic.integerRingEquiv p`. A scratch `#check @TauCeti.integerRingEquiv` elaborated with the pinned Tau Ceti modules imported fails with “Unknown identifier”, while `#check @Padic.integerRingEquiv` prints `(p : ℕ) → [Fact p.Prime] → 𝒪[ℚ_[p]] ≃+* ℤ_[p]`.

**Exact repair:** Replace `TauCeti.integerRingEquiv` by `Padic.integerRingEquiv` at lines 130, 627, 633, 650 and 660. Nothing else changes: the type and file cited at line 130 are already correct.

## R02 (P3) — The ℤ₃[ζ₃] negative control says both endomorphisms reduce to the identity; one reduces to x−1 ↦ −(x−1)

**Location:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:645`, “Its two ℤ₃-algebra endomorphisms x↦x and x↦−1−x both reduce to the identity of 𝔽₃[x]/((x−1)²), which has three endomorphisms x−1↦c(x−1) for c∈𝔽₃”.

**Claim:** The two roots ζ₃ and ζ₃² do reduce to the same residue root 1, but the two endomorphisms do not reduce to the same map. Modulo 3, x↦−1−x is x↦2−x=1−(x−1), which is the endomorphism with c=−1, not c=1. So reduction End_(ℤ₃-alg)(ℤ₃[ζ₃])→End(𝔽₃[x]/((x−1)²)) is injective and misses c=0; the Check's conclusion (counts 2 and 3, the bijection fails) stands, but its stated mechanism (non-injectivity) is wrong. The LocalFieldsRamification Check at line 135 cites this control by its counts only and is unaffected.

**Witness:** In 𝔽₃[x]/((x−1)²) put t=x−1, t²=0. The reduction of x↦−1−x sends x=1+t to −1−(1+t)=−2−t=1−t, so t↦−t=2t, c=2≠1. The previous report's adversarial row for this statement computed the same: “reductions c=1 and c=−1, c=0 missed”.

**Exact repair:** Replace “both reduce to the identity of 𝔽₃[x]/((x−1)²), which has three endomorphisms x−1↦c(x−1) for c∈𝔽₃” by “reduce to x−1↦x−1 and x−1↦−(x−1), two of the three endomorphisms x−1↦c(x−1) for c∈𝔽₃ of 𝔽₃[x]/((x−1)²); the endomorphism with c=0 has no lift”. The sentence that follows (“the counts are 2 integrally and 3 on the reduction, so the bijection fails without the unramified hypothesis”) stays.

## R03 (P3) — The `stacks-algebra` manifest entry is orphaned and still lacks authors, title and year

**Location:** `packages/StableHomotopyKTheoryPartII/sources.toml:187`–`197`, the entry with `id = "stacks-algebra"`, `cited_for = ["4.8"]`.

**Claim:** The repair deleted the Stacks citation from the README (the References entry and every “Tag 04GK” locator are gone; a search of the README for “Stacks”, “04GK” and “stacks-algebra” finds nothing), which was the first branch of the previous R02's repair, but the manifest entry was left in place. It now records a work the roadmap cites nowhere, with `cited_for` pointing at a section that no longer uses it, and it still has none of the `authors`, `title` and `year` fields the schema requires and the other eleven entries carry.

**Witness:** `sources.toml:187`–`197` lists `id`, `locator_scheme`, `locator`, `url`, `fetched_from`, `fetched_at`, `sha256`, `licence_class`, `status`, `accessed`, `cited_for` only; README occurrences of “stacks-algebra”, “Stacks” and “04GK”: 0.

**Exact repair:** Delete the `stacks-algebra` entry from `packages/StableHomotopyKTheoryPartII/sources.toml` (lines 186–197, including its `[[source]]` header). Re-raised: the previous report's R02, whose first repair branch was taken only on the README side.

## Previous findings

- R01 — repaired: line 17, “LocalFieldsRamification Layer 2 owns the unramified/étale comparison of integer rings and the residue correspondence with its Frobenius element … §4.8 here identifies the ℤ_p-algebra endomorphisms of W(k) with Gal(L/ℚ_p)”; §4.8 at line 627 now imports étaleness and the residue correspondence and proves only the gluing; the InverseGaloisAndArithmeticFundamentalGroups contract, the Stacks locators and the StandardEtale/Henselian sentences are gone. The repair introduced the misnamed declaration of R01 above and the false clause of R02 above.
- R02 — partly repaired: the README's References line and “p.850 of the complete book” are deleted, but the manifest entry remains without `authors`, `title` or `year` and now cites nothing (R03 above).

## Verified sound

**Gate, dependency direction and elaboration.** Run by me on this head:

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 204 roadmaps, 1651 edges, 0 problem(s)
```

The worker's gate on this head, which includes the targeted build, reports `build=0 OK`. No UPWARD, CYCLE or moved line. The edge count fell from 1652 to 1651 because the InverseGaloisAndArithmeticFundamentalGroups edge is gone; LocalFieldsRamification is a completed roadmap on main (`Completed/LocalFieldsRamification/README.md`), so it is consumable without a merge-order line, and PadicHodgeRegulators (order line 304) and RefinedTraceMethods (308) are above this roadmap (311). `git diff --stat origin/main...HEAD` excluding the folder is empty; the worktree is clean at 9e5492a. `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean` from the pull-request worktree exited 0 with no diagnostics in 5 s: 64 lines, `import Mathlib`, a module docstring and the namespace, zero declarations, so the signature inventory and the one-tactic padding probe both have zero entries and the 14 headline groups remain named as not statable in the docstring (unchanged since PRREVIEW~3).

**Pinned declarations opened this round.** All sixteen names the changed passages cite were elaborated in one scratch `#check` file against the pinned Mathlib and Tau Ceti; fifteen resolve with the hypotheses the README states, one does not (R01).

| Pinned file and line | Declaration; what it supplies, as elaborated |
|---|---|
| TauCeti/NumberTheory/LocalField/Unramified/Basic.lean:113, 275 | `TauCeti.IsUnramified K L` (fields `ramificationIndex K L = 1` and `Algebra.IsSeparable 𝓀[K] 𝓀[L]`, as line 130 says); `TauCeti.isUnramified_iff_etale : IsUnramified K L ↔ Algebra.Etale 𝒪[K] 𝒪[L]`, under `[IsNonarchimedeanLocalField K] [IsNonarchimedeanLocalField L] [Algebra K L] [ValuativeExtension K L]` only; no finite-dimensional or Galois hypothesis, as line 130 says. |
| TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:150, 164, 178, 237 | Under the further `[FiniteDimensional K L] [IsGalois K L] [IsUnramified K L]`: `residueFieldAutEquiv : Gal(L/K) ≃* Gal(𝓀[L]/𝓀[K])`, `frobeniusAlgEquiv : Gal(L/K)` (defined as the preimage of `FiniteField.frobeniusAlgEquivOfAlgebraic 𝓀[K] 𝓀[L]`, line 164–166), `orderOf_frobeniusAlgEquiv : orderOf frobeniusAlgEquiv = inertiaDegree K L`, `eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one : (∀ y : 𝒪[L], valuation L (σ y − y ^ Nat.card 𝓀[K]) < 1) → σ = frobeniusAlgEquiv`. Lines 130 and 627 state exactly these hypotheses and conclusions. |
| TauCeti/NumberTheory/LocalField/Frobenius.lean:61 | `frobeniusAlgEquiv_teichmullerLift : teichmullerLift L (frobeniusAlgEquiv • a) = teichmullerLift L (a ^ Nat.card 𝓀[K])`. |
| TauCeti/NumberTheory/LocalField/Padic.lean:54, 86 | `namespace Padic`; `Padic.integerRingEquiv : 𝒪[ℚ_[p]] ≃+* ℤ_[p]`. `TauCeti.integerRingEquiv` is an unknown identifier (R01). |
| Mathlib/RingTheory/WittVector/Basic.lean:343 | `WittVector.constantCoeff : 𝕎 R →+* R`, a ring homomorphism as line 38 says. |
| Mathlib/FieldTheory/Finite/Basic.lean:363, 392 | `FiniteField.frobeniusAlgEquivOfAlgebraic K L : Gal(L/K)` under `[Fintype K] [Algebra.IsAlgebraic K L]`, coercing to `(· ^ q)` (:366); `orderOf_frobeniusAlgEquivOfAlgebraic : orderOf … = Module.finrank K L` under `[Finite L]`. Line 38 states both with these hypotheses. |
| Mathlib/RingTheory/WittVector/Frobenius.lean:255, 275; IsPoly.lean:314; Compare.lean:199 | `coeff_frobenius_charP` (needs `[CharP R p]`), `frobenius_zmodp`, `IsPoly.map`, `WittVector.equiv : 𝕎 (ZMod p) ≃+* ℤ_[p]`: unchanged citations, re-elaborated. |

**Supplier citations resolved this round.** PadicHodgeRegulators at its open head c1443be4: “Supplier: Finite unramified étale Q_p-algebras” (README line 344) gives L ≅ W(k)[1/p] with O_L = W(k), rank [L:ℚ_p] = dim_𝔽_p k, and φ_L the Witt-vector Frobenius after inverting p (line 347), as this README's line 120 and §4.8 consume; “Supplier: Frobenius on the roots of unity of an unramified field” (line 225) defines φ_L as the unique field automorphism of L over ℚ_p whose reduction is x↦x^p and names the pinned `TauCeti.frobeniusAlgEquiv_teichmullerLift` and `TauCeti.frobeniusAlgEquiv_rootsOfUnity` with K=ℚ_p (lines 227–231), as line 120 says. LocalFieldsRamification on main (`Completed/LocalFieldsRamification/README.md`): “Layer 2: unramified extensions and Frobenius” is the heading at line 576; its first item plans `IsUnramified`, its comparison with the étale notions (line 602) and names `TauCeti.IsUnramified`, `isUnramified_iff_formallyUnramified` and `isUnramified_iff_isUnramifiedAt` (lines 584–590); its residue-correspondence item names `TauCeti.residueFieldAutEquiv`, `frobeniusAlgEquiv`, `orderOf_frobeniusAlgEquiv`, `zpowers_frobeniusAlgEquiv`, `valuation_frobeniusAlgEquiv_sub_pow`, `eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one` and `frobeniusAlgEquiv_teichmullerLift` (lines 616–622); “Existence and uniqueness, stated precisely” is at line 638, and its item 4 (line 648) states that Gal(K_f/K) is cyclic of order f generated by the arithmetic Frobenius, which is what line 627's “Galois with cyclic group of order d” consumes. RefinedTraceMethods §6.1 is unchanged (spectral étale equivalence only), and line 111 now attributes étaleness of W(k) to LocalFieldsRamification rather than to §6.1.

**Ownership.** `roadmaps grep` over main and the 440 open heads for “endomorphisms of W(”, “End_(ℤ_p-alg)” and “ℤ_p-algebra endomorphism(s) of W” hits only this README (lines 17, 111, 120, 627, 634, 635, 643): no other roadmap states the identification End_(ℤ_p-alg)(W(k)) = Gal(L/ℚ_p), so §4.8 is its single owner, and the three facts it previously claimed (étaleness, the reduction bijection, uniqueness of the Frobenius lift) are now attributed to LocalFieldsRamification Layer 2 and the pinned declarations. Ownership against open pull requests whose files the brief does not give was not checked beyond `roadmaps grep`.

**Seeded sample.** The fifteen seeded targets (2.1, 2.4, 2.6, 2.7, 3.3, 4.7, 5.1, 5.2, 5.4, 5.5, 6.1, 6.2, 7.1, 7.5, 8.1) were verified against the cached texts in PRREVIEW~3; the diff touches none of their passages (its hunks are at lines 14–17, 35–38, 108–136, 624–660 and the References), so their verdicts carry. No new source locator was added this round; the only locator change is the deletion of the Stacks one.

**Declared gaps.** `steenrod-finite-hopf-chain` is unchanged: the plan's `gaps` list has the slug with supplier BordismFormalGroups, section “F6.3 Finite height, periodicity and telescopes”, and the README states the same contract with the named supplier in the BordismFormalGroups subsection at line 86 (“The additional BordismFormalGroups §F6.3 contract is the exhaustive finite Hopf-algebra chain: …”), as in PRREVIEW~3–~5. The README states it in prose rather than in the `What <Supplier> must provide (gap:<slug>)` form; the contract and the plan slug agree, so this is a form note only. No other gap is declared.

**Adversarial mathematics.** New rows first (the changed statements, values computed this round), then the previous report's rows for the untouched statements.

| Statement | Instances tried | Values computed on each side / excluded model | Result | Change |
|---|---|---|---|---|
| §4.8 line 627: every ℤ_p-algebra endomorphism of W(k) is injective, extends to an automorphism of L, and restriction is a bijection Gal(L/ℚ_p)→End_(ℤ_p-alg)(W(k)) | W(𝔽₄); W(𝔽₂); ℤ₃[ζ₃]; multiplication by p; the zero map | Kernel of σ is an ideal of the DVR W(k) with uniformizer p (k perfect), so 0 or pⁿW(k), n≥1; σ(pⁿ)=pⁿ≠0 excludes the latter. W(𝔽₄)=ℤ₂[x]/(x²+x+1): endomorphisms x↦x and x↦−1−x, (−1−(−1−x))=x so each squares to the identity; |End|=2=|Gal(ℚ₂(ζ₃)/ℚ₂)|=[L:ℚ₂]=2. W(𝔽₂)=ℤ₂: 1=1. Extension to L: a ℚ_p-linear injection of a d-dimensional space is bijective; a ℚ_p-automorphism preserves the unique extension of the valuation, hence O_L. Multiplication by p and the zero map are not unital, excluded. (ℤ₃[ζ₃] also has End=Aut, 2=2; it is excluded from the statement because it is not W(k) of a field, and it fails the next row.) | Pass | None |
| §4.8 line 627: reduction is `residueFieldAutEquiv`, a bijection End_(ℤ_p-alg)(W(k))→End_(𝔽_p-alg)(k), both of size d | 𝔽₄; 𝔽₂, 𝔽₃; ℤ₃[ζ₃] | Reduction = `constantCoeff` composed with W(k)/pW(k)=k: the kernel of `constantCoeff` is VW(k)=pW(k) for perfect k, so this is the residue map of O_L. 𝔽₄: x↦x reduces to a↦a, x↦−1−x to a↦a+1=a²; 2=2; `orderOf_frobeniusAlgEquiv`=inertiaDegree=2 and `orderOf_frobeniusAlgEquivOfAlgebraic`=finrank_𝔽₂ 𝔽₄=2. 𝔽₂, 𝔽₃: 1=1 and the Frobenius is the identity. ℤ₃[ζ₃] (not unramified): x↦x and x↦−1−x reduce to x−1↦x−1 and x−1↦−(x−1), c=1 and c=−1; c=0 unlifted; 2 versus 3, reduction injective and not surjective. | Pass; the Check's “both reduce to the identity” is wrong (c=−1≠1) | R02 |
| §4.8 line 627 and bullet 635: Witt Frobenius is a ℤ_p-algebra endomorphism, reduces to a↦a^p, is the unique such, and extends to `frobeniusAlgEquiv` via the congruence | y=[a]∈W(𝔽₄); general y; d=1; the identity map | `IsPoly.map` with the structure map W(𝔽₂)→W(𝔽₄) and `frobenius_zmodp` give ℤ₂-linearity. Zeroth coordinate of φ(y) is y₀^p (`coeff_frobenius_charP`, n=0) and of y^p is y₀^p (`constantCoeff` is a ring map), so φ(y)−y^p∈pW(k) and v(φ(y)−y^p)<1 for every integral y, with q=|𝓀[ℚ_p]|=p: the hypothesis of `eq_frobeniusAlgEquiv_of_valuation_sub_pow_lt_one`. On [a]: φ([a])=[a²]=[a+1]; [a]²=[a²]; difference 0. d=1: φ=id (`frobenius_zmodp`) and y≡y^p mod p in ℤ_p. The identity map on W(𝔽₄): id(ζ₃)−ζ₃²=ζ₃−ζ₃², whose square is ζ₃²−2+ζ₃=−3, a unit of ℤ₂, so v=1, not <1: excluded. | Pass | None |
| LocalFieldsRamification contract, line 130: hypotheses of the seven declarations | the pin | `isUnramified_iff_etale`: local fields, `Algebra`, `ValuativeExtension` only (matches “under the hypotheses `Algebra K L` and `ValuativeExtension K L`”). `residueFieldAutEquiv`, `frobeniusAlgEquiv`, `orderOf_frobeniusAlgEquiv`, `eq_frobeniusAlgEquiv_…`, `frobeniusAlgEquiv_teichmullerLift`: plus `FiniteDimensional`, `IsGalois`, `IsUnramified` (matches “under the further hypotheses”). Order = `inertiaDegree K L` (matches “the inertia degree”). `integerRingEquiv` lives in `Padic`, not `TauCeti`. | Pass except the name | R01 |
| LocalFieldsRamification Checks, lines 134–136 | 𝔽₄/ℚ₂(ζ₃); ℚ₃(ζ₃); L=K=ℚ_p | ℚ₂(ζ₃): x²+x+1 irreducible mod 2, e=1, f=2; |Gal|=2=|Gal(𝔽₄/𝔽₂)|; Frobenius ζ₃↦ζ₃² since a↦a² on 𝔽₄; (ζ₃²−ζ₃)²=−3 is a unit of ℤ₂, so the identity fails the congruence, as the Check says. ℚ₃(ζ₃): (ζ₃−1)²=−3ζ₃, so e=2, f=1, not unramified; ℤ₃[ζ₃]=ℤ₃[ζ₃−1] is the full integer ring (Eisenstein), and `isUnramified_iff_etale` denies its étaleness. L=K: Gal trivial, inertiaDegree 1, Frobenius the identity of order 1. | Pass | None |
| PadicHodgeRegulators contract, line 120: φ_L is Witt Frobenius after inverting p and the unique automorphism reducing to x↦x^p | 𝔽₄; 𝔽₂; 𝔽₃ | PHR line 347: φ_L=W(Frob_k)[1/p]; line 227: unique automorphism reducing to x↦x^p, arithmetic Frobenius. 𝔽₄: [a]↦[a²]=[a+1]≠[a], square fixes [a]. 𝔽₂, 𝔽₃: rank 1, φ_L=id. Both PHR sections use one symbol φ_L; §4.8 re-derives the identification from the congruence anyway. | Pass | None |
| Scope line 17 and RTM line 111: ownership split | the pin; LFR Layer 2; `roadmaps grep` | Étaleness, residue correspondence, Frobenius uniqueness: LFR Layer 2 lines 584–622 and the pinned declarations above. Gluing End=Gal: this README only (7 hits, all here). One owner per object. | Pass | None |
| Mathlib paragraph, line 38 | `constantCoeff`; `frobeniusAlgEquivOfAlgebraic` | `constantCoeff : 𝕎 R →+* R` (Basic.lean:343). `frobeniusAlgEquivOfAlgebraic` needs `[Fintype K] [Algebra.IsAlgebraic K L]`, coerces to `(· ^ q)`; order = finrank needs `[Finite L]`: line 38 states “for an algebraic extension L of a finite field K … for finite L its order is [L:K]”. | Pass | None |
| Manifest | `sources.toml` fields | 11 of 12 entries have authors/title/year, `stacks-algebra` has none and `cited_for = ["4.8"]` with 0 README citations. | Record defect | R03 |
| 1.1 Coefficients and weights | p=2,3,5; integral/mod-p; generator rescaling | At 2, HZ Tate has (π₀,π₁)=(𝔽₂,0), HF₂ has (𝔽₂,𝔽₂). At 3, deg(t²)=−4 and βe=1; replacing e by −e gives −1. At 5, a=2 gives weights t:2 and b:3. At 3, b′=2b gives t′²=t² and e′=e. | Pass (carried from PRREVIEW~5) | None |
| 1.2 Continuous homological Tate SS, duality and products | S,C₂,p=2; G=1 and C₃,p=2; a=2,p=5 | Sphere E² is 𝔽₂ on t=0 for every s, hence continuous H_n=𝔽₂ for all n; ordinary H_n(S₂^∧) is 0 for n≠0. Prime-to-p Tate gives 0 versus group H₀=𝔽₂. Weight 2 dualizes to 3; t·t⁻¹=1 and e²=0. | Pass (carried from PRREVIEW~5) | None |
| 2.1 Continuous cohomology | Constant tower; zero transitions; Singer sphere tower | Constant maps give H_c^*=H^* and identity comparison. Zero transitions give colimit 0. At p=2 the Singer tower has negative-degree classes while H^*(S₂^∧) has none there. | Pass (carried from PRREVIEW~5) | None |
| 2.2 Inverse-limit Adams | 0; constant HF_p; Singer sphere tower | Zero gives 0 pages/abutment. For HF_p, Ext_A(A,𝔽_p) is 𝔽_p at (0,0), 0 elsewhere. Sphere stage bottom degrees at 2 are 1,0,−1. | Pass (carried from PRREVIEW~5) | None |
| 2.3 Singer module/action/augmentation | M=0,𝔽₂,𝔽₃; exponent −1 | M=0 gives 0. ε(Σx⁻¹)=1 at 2; ε(Σxy⁻¹)=1 at odd p. Sq¹x⁻¹=binom(−1,1)=1 mod 2; β(xy⁻¹)=1. The coefficientwise trivial action gives 0 and fails. | Pass (carried from PRREVIEW~5) | None |
| 2.4 Singer Tor-equivalence | M=0; unit coefficient module; shifts | Zero gives Tor=0 on both sides. The degree-zero augmentation comparison sends 1 to 1; the zero augmentation gives 0. Shifting down one shifts both sides by −1. | Pass (carried from PRREVIEW~5) | None |
| 2.5 Singer approximation | B=S, n=0,1,2; p=2,3; suspension | Bottom degree 1−(p−1)n is (1,0,−1) at 2 and (1,−1,−3) at 3. U₀(ΣS) has bottom p+1, ΣU₀(S) has bottom 2. | Pass (carried from PRREVIEW~5) | None |
| 2.6 Singer realization and unit | B=0,S; p=2,3 | Zero gives 0 on both sides. The degree-zero generator maps to 1; negating gives 2 at p=3. Omitting the suspension puts the unit in degree −1. | Pass (carried from PRREVIEW~5) | None |
| 2.7 Finite-type Segal | S,HF_p,Hℚ; p=2,3 | Sphere completion and tensor-Tate target have π₀=ℤ_p. HF_p has one 𝔽_p in degree 0 on both sides. Hℚ gives 0 and 0. | Pass (carried from PRREVIEW~5) | None |
| 3.1 Finite towers/pro-isomorphism | Empty; two-point constant; {a,b}←{a}; binary-prefix; constant S₃ | Limit/stable image cardinalities 0/0, 2/2, 1/1. Binary-prefix limit has size 2^ℵ₀ and evaluation identifies 0^∞ and 0ⁿ10^∞. Constant S₃ has six elements. | Pass (carried from PRREVIEW~5) | None |
| 3.2 Truncated tensor Tate | X=0,HF_p,HF_p⊕HF_p; n<0 | Zero stages 0. For n<0 the connective tensor truncates to 0. Two summands: 2 diagonal contributions, 2^p−2 mixed words in free orbits with Tate value 0. | Pass (carried from PRREVIEW~5) | None |
| 3.3 Arbitrary-dimensional HF_p | V=0,𝔽_p,𝔽_p²,⊕_κ𝔽_p | π₀ are 0,𝔽_p,𝔽_p²,⊕_κ𝔽_p; all other groups vanish. The all-ones vector in ∏_κ𝔽_p is not in the sum. | Pass (carried from PRREVIEW~5) | None |
| 3.4 Bounded-below Segal | Σ⁻¹HF_p; Hℚ; KU at 2 | Σ⁻¹HF_p: π₋₁=𝔽_p both sides. Rational: 0. KU₂^∧/2 has 𝔽₂ in each even degree, T₂(KU)/2=0. | Pass (carried from PRREVIEW~5) | None |
| 4.1 Weyl refinement | p=2,3; S and S[ℕ] | Weyl orders 1 and 2, prime to p. Unit maps to 1; z↦z^p by both routes; the unit-valued map gives 1 and fails. | Pass (carried from PRREVIEW~5) | None |
| 4.2 Underlying-space diagonal | X=HZ at 2; 0 | Lift of 2 is 2·unit+Nm(1): restriction 4, can 2 in ℤ₂. Additive lift restricts to 2; scalar lift 4·unit has Tate value 4. | Pass (carried from PRREVIEW~5) | None |
| 4.3 Norm splitting | 0; HF₂,p=2 | 0=0⊕0. Kernel and quotient 𝔽₂ with middle ℤ/4; an additive split would give 𝔽₂². | Pass (carried from PRREVIEW~5) | None |
| 4.4 Degree-zero power | KU,HZ,HF₄; p=2 | P₂(2) in KU is 3·1+sign: rank 4, trace 2 on a transposition. In HZ, P₂(2)=4≠2. In 𝔽₄, a²=a+1≠a. | Pass (carried from PRREVIEW~5) | None |
| 4.5 Young-transfer ideal | HZ,p=5; HF_p; zero ring | Indices (5,10,10,5) generate (5); 30↦0 mod 5 but 30 mod 120. In HF_p, I=0. Zero ring: 0. | Pass (carried from PRREVIEW~5) | None |
| 4.6 Degree-zero Frobenius | HZ,p=2; H𝔽₃[z]; empty X | Both routes: 2↦0 mod 2; z↦z³. Empty X: zero ring, unique map. | Pass (carried from PRREVIEW~5) | None |
| 4.7 Ordinary/finite examples | Hℤ₃,Hℚ,0,S_p^∧ | 2↦2³ mod 3=2; rational and zero give 0; sphere Frobenius 1↦1; colim π₀Map(S_p^∧,S_p^∧)=ℚ_p≠0. | Pass (carried from PRREVIEW~5) | None |
| 4.8 SW(k) spectral statements (bullets 636–639, Checks 646–648) | 𝔽₂, 𝔽₃, 𝔽₄; identity map | d=1: SW(𝔽_p)≃S_p^∧, rank 1, φ=id. 𝔽₄: rank 2, [a]↦[a+1]≠[a], second iterate fixes [a]; the identity fails the first-iterate test. Unchanged text (ns18 line 4858). | Pass (carried from PRREVIEW~5) | None |
| 5.1 Virtual twists | rank 0,−1; Möbius; ρ₂ | Rank 0 gives Σ∞_+X. Rank −1 at a point gives π₁R. Möbius H¹=ℤ/2 versus ℤ. Swap degrees −1,+1. | Pass (carried from PRREVIEW~5) | None |
| 5.2 Thom adjunction | n=0,−1; p=2; ΣHZ,Σ²HZ | n=0: Borel R⁰. n=−1: π₂R, i.e. 0 and ℤ; rank −1 would give ℤ and 0. | Pass (carried from PRREVIEW~5) | None |
| 5.3 All-degree power | n=1,0,−2; HF₂,KU | Degree one: ub+u²↦u². n=0: 3+sign. Bott: β². n=−1: rank 0, not 2p. | Pass (carried from PRREVIEW~5) | None |
| 5.4 Tate suspension | HZ,S; p=2,n=±1 | HZ twist: 𝔽₂ in odd degrees; trivial rank 2 gives the opposite parity. Reflection of S^ρ gives +1 on π₁. | Pass (carried from PRREVIEW~5) | None |
| 5.5 Extended-power Thom comparison | X=*, V=0,±1; 0; p=2 | D_p(S) has π₀=ℤ; D_p(0)=0. Rank +1: −ρ, dimension −2, sign −1. Rank −1: +ρ, dimension 2. Möbius ℤ/2 versus ℤ. | Pass (carried from PRREVIEW~5) | None |
| 5.6 All-degree Frobenius equality | n=0,1,−1; p=2 | 2↦0 either route; u↦u+u²s, degree 1; at n=−1 rank 0. | Pass (carried from PRREVIEW~5) | None |
| 6.1 EM decompositions | p=2,3; HZ vs HF_p | First positive shifts at 3 are 4,5. HZ Tate π₁=0, HF₂ Tate π₁=𝔽₂. Ext between different summands 0, Hom on the same 𝔽_p. | Pass (carried from PRREVIEW~5) | None |
| 6.2 Power coefficients and Euler signs | u at 2; v,x,z at 3; 5,7 | u(u+b)/b=u+u²s; v−v³t²; (x−ye)(z−we)=xz+(yz−xw)e; (2!)²=−1 mod 5, (3!)²=1 mod 7. | Pass (carried from PRREVIEW~5) | None |
| 6.3 Stable total Steenrod map | unit,u,x,xz; HZ | Unit component 1, higher 0; Sq¹u=u²; θ₀x=−y, θ₀(xz)=yz−xw; both suspension routes −ι×βx. | Pass (carried from PRREVIEW~5) | None |
| 7.1 Atiyah cyclic power | virtual 0,1,2,−1; L; p=2 | Values 0,1; rank 4 trace 2; sign has trace −1; L^p agrees with ψ^p. | Pass (carried from PRREVIEW~5) | None |
| 7.2 KU Tate coefficients | p=2,3; r=1,2 | Even dimensions (1,3) at 2, (2,8) at 3; odd 0; p-series at 0 is 0, (x−1)^p−1 gives −2. | Pass (carried from PRREVIEW~5) | None |
| 7.3 Stable Adams/Frobenius | β,β⁻¹; p=2,3 | pβ·β⁻¹/p=1; (1+β)^p=1+pβ. | Pass (carried from PRREVIEW~5) | None |
| 7.4 Unbounded orbit failure | KU trivial C_(p²); Hℚ[β±¹] | Dimensions 3/1 at 2, 8/2 at 3; periodic rational Tate terms 0. | Pass (carried from PRREVIEW~5) | None |
| 7.5 Unbounded tensor-Segal failure | KU at 2; sphere | KU₂^∧/2 has π₀=π₂=π₋₂=𝔽₂, T₂(KU)/2 has 0; T₂(S) has π₀=ℤ₂. | Pass (carried from PRREVIEW~5) | None |
| 8.1 Free-loop totalization | Y=*,S²,∨_κS²; S¹ | Point: identity. S² bottoms (n,n+2). S¹: n−n=0 for every n. | Pass (carried from PRREVIEW~5) | None |
| 8.2 Controlled orbit/Tate limit | constant; ΣⁿHF_p; G=1 | Identity comparisons; π₀=0 for n≥1; Tate sides 0 for G=1. | Pass (carried from PRREVIEW~5) | None |
| 8.3 Free-loop Segal and genuine comparison | Y=*; S²; n=0,1,2 | π₀=ℤ_p; genuine ℤ² versus ℤ⊕ℤ_p, both complete to ℤ_p²; bounds (n,n+2). | Pass (carried from PRREVIEW~5) | None |
| Extended powers and tensor convention | k=0,1,3; S₃; S,0 | D₁(E)=E; D_(S₃)(S) π₀=ℤ; empty tensor S; swap degrees −1/+1. | Pass (carried from PRREVIEW~5) | None |
| Steenrod composition and Milnor conventions | p=2,3 | Sq¹Sq¹=0, Sq¹Sq²=Sq³, P¹P¹=2P²; Sq¹u=u², Sq²u=0; dual dims 1,1,1. | Pass (carried from PRREVIEW~5) | None |
| Announced finite Hopf-chain contract | p=2,3; n=−1,0,1 | Dimensions 1,2,8 at 2 and 1,2,12 at 3; E(Q₀,Q₁) has dimension 4. | Precise distinct obligation (carried from PRREVIEW~5) | None |
| Finite norm and induced vanishing | G=1,C₂; HZ | Identity norm cofiber 0; C₂ norm cokernel 𝔽₂; induced Tate 0. | Pass (carried from PRREVIEW~5) | None |
| Completion conventions | Hℚ,HF_p,Σ⁻¹HF_p | Completions 0,HF_p,Σ⁻¹HF_p with π₋₁=𝔽_p. | Pass (carried from PRREVIEW~5) | None |
| Unramified hypothesis | ℚ₃(ζ₃) vs ℚ₃ | Eisenstein T²+3T+3: e=2, f=1; W(𝔽₃)[1/3]=ℚ₃ has degree 1. | Pass (carried from PRREVIEW~5) | None |
| Line 107 / §2.7 sphere Segal and residual counterexample | p=2,3 | π₀ both sides ℤ_p; (S^(hC_p))^(t(C_(p²)/C_p)) has π₀=ℤ_p, mod-p quotient 𝔽_p≠0; bounded-above fails for S. | Pass (carried from PRREVIEW~5) | None |

**Headline theorems and padding.** Unchanged: `Suggested.lean` declares nothing and its docstring names the 14 headline groups as not statable at the pins (verified in PRREVIEW~3; the file is byte-identical since aec0155b). No padding exists to probe.

## Not verifiable

- PadicHodgeRegulators and RefinedTraceMethods were read at their open heads (c1443be4 and the head given by the brief), not on main.
- Whether the Tau Ceti local-field instances (`IsNonarchimedeanLocalField L`, `ValuativeRel L`, `ValuativeExtension ℚ_p L`, `IsGalois ℚ_p L`, `IsUnramified ℚ_p L`) are provided for the abstract L=W(k)[1/p] of PadicHodgeRegulators was not checked; the pinned worked examples construct them for concrete unramified extensions (TauCeti/NumberTheory/LocalField/WorkedExamples/UnramifiedQuadratic.lean), so this is implementer plumbing, not a missing owner.
- Ownership of the End=Gal gluing against open pull requests whose files the brief does not give was checked only through `roadmaps grep`.

## Source issues

- none

# FIX-RT-StableHomotopyKTheoryPartII~1

This round repairs red-team round 1, reviews r1a (five findings) and r1b (four findings). Every finding was checked against the cached legal sources, the cited sibling roadmaps (on main or at the open heads given in the brief), and the pinned Mathlib. All nine are right. Seven were applied as asked, and two were applied by a different correct route (review r1a F01 and F05). Review r1b F02 also asks for a report on another roadmap's job; that part is listed for the maintainer.

Files edited: `packages/StableHomotopyKTheoryPartII/README.md` and the top-level `gaps` list of `packages/StableHomotopyKTheoryPartII/design/plan.json`. `Suggested.lean` (no declarations), `metadata.toml` and `sources.toml` are unchanged. The two passes number their findings independently. The first five finding sections below (F01–F05) refer to review r1a; the following four (F01–F04) refer to review r1b, and repeated IDs keep the reviews' own spelling. Review r1a F04 and review r1b F01 both concern sphere Segal statements attributed to suppliers, but they are separate claims about different suppliers and are settled separately.

## F01 (P1) — applied differently

Change: §2.6 route, "Construct the geometric map B≃Φ^(C_p)(N_e^(C_p)B)→… identifies it with Δ_p" → "work with the imported Δ_p itself; no genuine equivariant norm and no Segal equivalence enter". This is followed by the unit, suspension and representability argument. In *Needs*, RefinedTraceMethods §§2.11–2.13 → KTheoryFiniteLocalFields §4.5 (multiplicative Tate spectral sequence).

Evidence:
- No supplier states N_e^G or Φ^G N_e^G≃id. RefinedTraceMethods §2.11 at the head has GSp, Φ^H and S^V, but no norm. KTheoryFiniteLocalFields §4.0 only says "norms". `roadmaps grep` found no owner.
- The norm is not needed. The lnr12 proof of Proposition 5.12 (lnr12 lines 2046–2071) uses only four properties of the map: naturality, suspension compatibility (its Lemma 5.11), being a ring map on H𝔽_p, and factorization through ε (its Corollary 3.5).
- The imported Δ_p has all four. It is exact and lax symmetric monoidal (AInfCohomology §AI.7.2; ns18 line 3236). Its exactness comparison is induced by the diagonal S¹→S^ρ, which is the tower reindexing U_n(ΣB)=ΣU_(n−1)(B).
- Pattern search: "N_e", "Φ^" and "geometric" occur nowhere else in the README.

## F02 (P1) — applied

Change: "Together with BordismFormalGroups §F6.3's finite Hopf pieces, this includes freeness of A_p over A_p(n)" → "…not part of this contract…; they are the BordismFormalGroups gap below". A new line "What BordismFormalGroups must provide (gap:steenrod-finite-hopf-chain)" carries the explicit ideals at odd p and p=2. The matching `plan.json` entry was added, and the gap is cited in §2.4, the Layer 2 Dependencies and Scope. Three Checks were added.

Evidence:
- BordismFormalGroups §F6.3 on main constructs only E(Q_i), T_t and Margolis criteria (`TauCetiRoadmap/BordismFormalGroups/README.md` lines 1003–1016).
- TangentialBordism §B4 item 8 gives freeness over the infinite exterior algebra only.
- agm85 defines the chain at line 214 and uses the freeness at line 290.
- The p=2 ideal, ξ_s^(2^r) with r+s≥n+2, was checked: n=0 gives 𝔽₂[ξ₁]/(ξ₁²), and n=1 gives 𝔽₂[ξ₁,ξ₂]/(ξ₁⁴,ξ₂²), of dimension 8.

## F03 (P2) — applied

Change: "as H𝔽_p-modules through const … and integrally the summands by the corresponding even monomials" → mod-p splittings are H𝔽_p-modules through const and can; integral splittings are Hℤ-modules through const, built from two-term complexes with differential p. The text now says that no H𝔽_p-module structure through const is asserted integrally. A new Check computes Ext^(2k−2j)_ℤ(ℤ/p,ℤ/p) and records the witness p·1=0↦p.

Evidence:
- const has source Hℤ, and no unital map H𝔽_p→Hℤ exists.
- I did not claim that no ring map H𝔽_p→Hℤ^(tC_p) exists. τ_(≥0)Hℤ^(tC_p)≃THH(𝔽_p) is an H𝔽_p-algebra, so such a claim would be false.
- "through const" occurred only here. The §6.3 route already used the integral two-term pieces.

## F04 (P3) — applied

Change: "The sphere Segal equivalence appearing as its Check is an output of Layer 2 here" → "The sphere Check of the Tate diagonal fixes the map S→S^(hC_p)→S^(tC_p); its identification as the p-completion of S is proved in §2.7 here and is not an input of any layer."

Evidence: the AInfCohomology "Spectral Tate diagonal" Checks (its README lines 3855–3857 at the head) concern only the sphere map, mixed orbits and Hℚ. No other README sentence attributes a Segal statement to AInfCohomology.

## F05 (P3) — applied differently

Change: the Check "At n=0 the comparison is the identity" → a Check that the reflection of S^ρ in its sign coordinate (underlying degree −1) acts as the identity on (S^ρ⊗R)^(tC₂), visible on π₁=ℤ₂ for R=S. The H𝔽₂ Check → R=Hℤ: the correct target has ℤ/2 in odd degrees, while a trivial two-sphere gives ℤ/2 in even degrees. The inverse-twist Check is kept.

Evidence:
- The suggested first replacement (R=S, n=0, 1↦1) still restates the n=0 normalization. The reflection Check instead pins the comparison by the fixed-point inclusion S¹→S^ρ.
- For the second Check, Hℤ replaces S so that it needs no Segal input. The S-version (π₁=ℤ₂ against 0) gives the same verdict.

## F01 (P2) — applied

Change: in Scope, the RefinedTraceMethods contract, the Layer 7 Examples and Dependencies, and Downstream consumers, "imported from RefinedTraceMethods §2.3" → derived in the Layer 7 Examples. The derivation applies residual Tate to the norm sequence, kills the orbit term with the Tate orbit lemma, and uses §2.7 twice and §2.3(iii) once. RefinedTraceMethods §2.3(iii) is now consumed explicitly.

Evidence:
- RefinedTraceMethods at the head records the sphere value at line 579 and S^(tC_p)≃S_p^∧ at lines 567 and 694, with no route.
- ns18 Example I.2.3(i) (ns18 lines 618–635) derives the sphere value from S^(tC_p)≃S_p^∧, which is §2.7 here, later in the merge order (218 against 217).
- The residual action on S^(tC_p) is trivial because S→S^(hC_p) is the unit of the inflation adjunction, not by §4.1.

## F02 (P3) — applied

Change: Scope now reads "(§4.8 owns the spherical lift SW(k) of a finite field k as the marked étale lift over S_p^∧; spherical lifts of general perfect p-complete δ-rings are not constructed in this roadmap)". Downstream consumers now reads "Roadmaps that construct spherical lifts of general perfect p-complete δ-rings import §4.8 for the finite-field case W(k) rather than constructing SW(k) again."

Evidence: HabiroCohomologyFoundationsPartII §0.1 (its README line 146 at the head given in the brief) builds S_B for perfect p-complete δ-rings, including W(k). It is at position 224, so §4.8 is the earlier owner. That roadmap is not named in this README, since naming it would cite a later roadmap. The reviewer's request to report the overlap on that roadmap's job is outside this package and is listed for the maintainer below.

## F03 (P3) — applied

Change: the Mathlib contract now cites `WittVector.equiv` (Mathlib/RingTheory/WittVector/Compare.lean). In the README gap line and in `plan.json`, "free of rank d over W(𝔽_p)=ℤ_p" → "free of rank d over ℤ_p, identified with W(𝔽_p) by the pinned `WittVector.equiv`". The name was also added to the §4.8 *Needs* line and the Layer 4 Dependencies.

Evidence: `WittVector.equiv : (p : ℕ) → [Fact p.Prime] → WittVector p (ZMod p) ≃+* ℤ_[p]` elaborates at the pin (Compare.lean line 199). The rest of the gap stands: no pinned Mathlib or Tau Ceti file proves freeness, finrank or étaleness for Witt vectors. Tau Ceti's RingTheory/WittVector files contain only Teichmüller and completeness lemmas.

## F04 (P3) — applied

Change:
- §2.1: "The zero tower has zero continuous cohomology" → the tower Σ^(−n)H𝔽_p with zero transitions, where H_c^*=0 but ⊕_nH*(Y_n)≠0.
- §2.5: "All stages are zero when B=0" → U_0(ΣS) has bottom cell p+1 against 2 for ΣU_0(S), and U_n(ΣB)=ΣU_(n−1)(B).
- §4.4: the 𝔽_p Check → H𝔽₄, p=2: P_2(a)=a+1, while the pullback gives a.

Evidence:
- The reviewer's §4.4 text compared P_p with an "identity map on R⁰(X×BΣ_p)", which does not typecheck. The correct wrong model is the pullback along the projection.
- The §2.1 Check is stated against the ⊕ model and not against H*(holim), which is also 0 here.
- Pattern search over all definitions: §2.3, §3.2 and §5.3 each keep three other discriminating Checks.

## Checks run

- **Dependency check** (`gate --depcheck … --movable`), exit 0:

  ```text
  depcheck: 56 roadmaps, 645 edges, 0 problem(s)
  ```

  There is no UPWARD, CYCLE or moved line.
- **Elaboration:** `lake env lean packages/StableHomotopyKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0 with no messages. The file has no `TauCeti.*` import, so nothing needed building.
- **Signature check:** Suggested.lean declares nothing, so there is no `#check @name` to compare and no binder to lose. To check the README's Mathlib citations, a scratch file put `#check @…` on `WittVector.equiv`, `WittVector.frobenius`, `WittVector.coeff_frobenius_charP`, `WittVector.frobenius_zmodp`, `frobenius` and the eight cofiltered-system names. All elaborate with the hypotheses the README states: `Fact p.Prime`; `CharP`; `ExpChar`; nonempty, finite and surjective hypotheses with `Finite F.sections` for `eventually_injective`. Nothing changed as a result.
- **Citation resolver:** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name found nowhere.
- **Style scan:** the README contains no LaTeX delimiters, process words, pull-request numbers or local paths.
- **Gate failures:** the brief listed none.
- **Sources:** no new source and no `needs-references.toml`. The new locators are agm85 lines 214 and 290 (pp.439 and 441), lnr12 line 2046 (proof of Proposition 5.12) and ns18 line 3236 (Definition III.1.4, p.286; Remark III.1.5, p.287). All three works are already in `sources.toml`, and their recorded locators cover these pages.

## Ownership

- **Genuine norm N_e^G:** no owner on main, at the open heads listed in the brief, or in the `roadmaps grep` index. It is now unused here.
- **AGM chain A_p(n):** BordismFormalGroups §F6.3 declares ownership of finite Steenrod sub-Hopf algebras and free-module criteria but does not plan this chain, so it is declared as a supplier gap rather than stated here.
- **Spherical Witt lift:** see review r1b F02.

Ownership against open pull requests was checked through the sibling checkouts given in the brief and the `roadmaps grep` index of all open heads; no other open work was sought.

## Adversarial pass on the changed statements

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| §2.6 route: Δ_p^* = g_B∘ε with g_B natural | B=0; B=H𝔽_p at p=2 and p=3; B=ΣH𝔽_p; wrong model −Δ_p | B=0: both 0. H𝔽_p: unit class Σx⁻¹⊗1 (p=2), Σxy⁻¹⊗1 (odd p) ↦1, so g(1)=1. ΣH𝔽_p: U_n(ΣH𝔽_p)=ΣU_(n−1)(H𝔽_p), so g(ι₁)=ι₁. −Δ_p sends 1 to −1≠1 at p=3, so it is not a ring map | Sound; the norm is removed |
| §2.5 Check: U_0(ΣS) against ΣU_0(S) | p=2, p=3; reindexing at n=1 | Bottom cells: p=2 gives 3 against 2; p=3 gives 4 against 2. U_1(ΣS)=Σ²D_(C_p)(S)=Σ²Σ∞_+BC_p=ΣU_0(S) | Sound; replaces B=0 |
| §2.1 Check: zero-transition tower | Y_n=Σ^(−n)H𝔽_p; ⊕ model; holim | H_c^*=0; ⊕_nH*(Y_n)≠0 (𝔽_p in degree −n from A_p^0); holim=0 (lim=lim¹=0), so H*(holim)=0 | Discriminates against ⊕, not against H*(holim); stated as such |
| gap:steenrod-finite-hopf-chain | n=−1,0,1 at p=2 and p=3; Sq¹-homology of A₂; trivial 𝔽₂ | dim A_p(−1)=1; dim A_p(0)=2; dim A₂(1)=8; dim A₃(1)=12; dim E(Q₀,Q₁)=4. Sq¹: Sq⁰↦Sq¹, Sq¹↦0, Sq²↦Sq³ (binom(1,1)=1), Sq³↦0 (binom(2,1)=0 mod 2), Sq²Sq¹↦Sq³Sq¹; homology 0 in degrees 0–3. Trivial 𝔽₂ has homology 𝔽₂ | Sound; p=2 ideal checked against the standard A(n) |
| gap:finite-field-witt-etale-frobenius (edited) | d=1; d=2, p=2 | d=1: rank 1, W(𝔽_p)≅ℤ_p by `WittVector.equiv`, Frobenius = id (`WittVector.frobenius_zmodp`). 𝔽₄: rank 2, a↦a²=a+1, square = id | Sound; only the pinned clause changed |
| §4.4 Check: P_2 on H𝔽₄ | a with a²+a+1=0; 𝔽₂ control | P_2(a)=a+1, pullback gives a. Over 𝔽₂: 0²=0, 1²=1, identical to the pullback | Discriminating |
| §5.4 Check: reflection on S^ρ, p=2 | underlying Σ²S; Tate with R=S | Underlying degree −1 on π₂=ℤ. On (S^ρ)^(tC₂) it is the identity, since r∘incl=incl and the cofiber S¹∧ΣC₂₊ is free. On π₁=ℤ₂ it acts by 1, not −1 | Sound |
| §5.4 Check: R=Hℤ, n=1, p=2 | correct S^ρ; trivial S²; H𝔽₂ control | Correct: π₁=ℤ/2, π₀=0. Trivial S²: π₁=0, π₀=ℤ/2. H𝔽₂: 𝔽₂ in all degrees for both | Discriminating |
| §6.1 integral splitting over Hℤ | k=j, j±1; p=2; unital H𝔽_p→Hℤ | Ext⁰=𝔽_p at k=j; Ext² and negative Ext are 0. p=2: π₀=𝔽₂, π₁=0. p·1=0↦p≠0, so no unital map | Sound; scalars are Hℤ |
| Layer 7 sphere counterexample | p=2, p=3; zero spectrum; bounded-above control | p=2: π₀=ℤ₂, mod 2 = 𝔽₂. p=3: π₀=ℤ₃. Zero spectrum gives 0. The orbit term vanishes because S is bounded below; the fixpoint lemma's 0 does not apply since π₃S≠0 | Sound; no supplier depends on §2.7 |
| AInfCohomology contract sentence | sphere Check | The Check fixes S→S^(hC_p)→S^(tC_p) (1↦1). The equivalence with S_p^∧ (π₀=ℤ_p) is §2.7 | Attribution corrected |
| Scope: SW(k) ownership | d=1; k=𝔽̄_p | SW(𝔽_p)=S_p^∧. For 𝔽̄_p, W(k) is not finite over ℤ_p, so the case is outside this roadmap | Definite scope |

## For the maintainer

- **RefinedTraceMethods §§2.3 and 2.6:** these state S^(tC_p)≃S_p^∧, and the sphere value of the fixpoint lemma, with no proof route. The only owner of S^(tC_p)≃S_p^∧ is §2.7 of this later roadmap. This roadmap no longer consumes either statement. The supplier should drop them or cite them only as consequences, since it cannot cite a later roadmap.
- **HabiroCohomologyFoundationsPartII §0.1:** this builds spherical lifts S_B of perfect p-complete δ-rings, including W(k) for finite k, which §4.8 here also owns. It is later in the merge order, so it should import §4.8 for the finite-field case. This needs to be raised on that roadmap's job (review r1b F02).
- **New supplier gap:** `steenrod-finite-hopf-chain` asks BordismFormalGroups (on main, §F6.3) to add the AGM chain A_p(n) and the freeness of A_p over it. §2.4, and hence Layers 2–3, depend on it.
- **Names:** no Lean name changed, since Suggested.lean declares none. The citable gap `finite-field-witt-etale-frobenius` keeps its slug; only its `needs` text changed.
- **Untrusted text:** neither review contained instructions directed at the worker or other suspicious text.

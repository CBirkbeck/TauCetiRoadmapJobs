# FIX-PKG-LocalFieldsRamificationPartII~3

Repair round for `packages/LocalFieldsRamificationPartII`, settling the seven findings of
`REV-PKG-LocalFieldsRamificationPartII~2` (R01–R07). Files changed:
`packages/LocalFieldsRamificationPartII/README.md`, `packages/LocalFieldsRamificationPartII/Suggested.lean`
(header and one docstring clause only; no declaration changed) and
`packages/LocalFieldsRamificationPartII/sources.toml` (locators and `cited_for` only). `metadata.toml` and
`design/plan.json` are unchanged: no new supplier gap is needed.

## REV-PKG-LocalFieldsRamificationPartII~2/R01 (P2) — applied

Checked at the head of ClassicalAdicEtaleCohomology (open roadmap pull request adding a new folder;
merge order 75, this roadmap 388). Its §5.1 states that the strict henselization of a valuation
ring of any rank is a strictly henselian valuation ring with the same value group, describes it
through the inertia invariants and gives `D/I ≅ Gal(L/κ)`. Its §5.3 states (i)–(iii) of our old
§2.2 for an arbitrary value group. These are the same objects and hypotheses.

Old → new: §2.2 deleted, §§2.3–2.11 → §§2.2–2.10; §1.2's strict part, the tower's fixed field of
`I`, `D/I` and `Gal(Kᵗ/Kᵘ)` now cite ClassicalAdicEtaleCohomology §§5.1, 5.3 (also §§2.4, 2.6, 2.8,
2.9, 5.5); new supplier section; reversed downstream bullet, KPR Proposition 2.4 note and citation
deleted. No mapping table: nothing cites these subsection numbers (consumers cite plan ids
`GF.k/<slug>`).

## REV-PKG-LocalFieldsRamificationPartII~2/R02 (P1) — applied

Verified on main (`5fc1aa8f`): SchemeAndStackFoundations §0.12 owns `henselization_at_prime`; §0.13
owns `henselization_integral_base_change` and `henselization_coprime_product`. `local_henselization`,
`IndEtale.henselization`, `henselization_flat` and `henselization_filtered_colimit` occur nowhere.

Old → new: the drifted names → pinned `TauCeti.Henselization.*` (`algebra`, `henselianLocalRing`,
`existsUnique_isLocalHom`, `map`, `indEtale`, `directLimitEquiv`, `algEquivOfRadicalEq`, …) in the
contracts and §§1.2–1.4, 2.5, 2.8, 4.2; SchemeAndStackFoundations cited only for its three owned
targets. Same pattern: ModularCurves 4D names are pinned `TauCeti.StrictHenselization.*`; that
supplier section is removed.

## REV-PKG-LocalFieldsRamificationPartII~2/R03 (P2) — applied

Verified: `stacks-more-algebra` line 2909 puts flatness on `M`. The reviewer's witness is correct
(`A` with value group `ℚ`, `B = A`, `M = A/𝔪`).

Old → new: §1.5 restated with named `A`, `B`, `M` for both base classes. Prüfer route: homogenize as
in 053E (lines 2910–2919). Flat ⇔ torsion free over a Prüfer domain is Mathlib
`Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`. Then 0537 (line 2382),
053D (lines 2879–2894) and 05GS(3) (line 2899). Added the `B = A`, `M = A/𝔪` Check. Raynaud–Gruson
stays as the algebra theorem Temkin uses.

## REV-PKG-LocalFieldsRamificationPartII~2/R04 (P2) — applied

Verified against `cks23` lines 610–653: Theorem 14 uses an arbitrary tolerance; Theorem 16 uses the
computed `ε := v(f−g)/n + γ*(f)`. The README conflated the two and divided by `n = 0`.

Old → new: §4.1 now requires `n ≥ 1` and defines `v(f−g)` by the Gauss valuation (`v(0) = ∞`). It
defines `ε_{f,g}` (`∞` for `f = g`) and asserts conclusions at every tolerance
`0 < ε ≤ ε_{f,g}`, with uniqueness when `ε > kras(f)`, and nothing for `n = 0`. Checks recomputed,
plus a new `γ*` negative control and an `n = 0` Check. Layer 4 Examples reworded.

## REV-PKG-LocalFieldsRamificationPartII~2/R05 (P3) — applied

Verified both witnesses. For `P = ∅`, the positivity-free predicate at `0` is false: `2 ∣ 0` and
`2 ∉ ∅`. For `ℚ(√2)/ℚ` at `7`, `ℚ(√2) ⊆ ℚ_7ʰ ⊆ Kᵗ`, so it is not purely wild, while `Eʰ = Kʰ`.

Old → new: §0.1 Check now explains the case by the reversed-inclusion model, which accepts all `n`
for `∅`. §4.3 Check is restricted to henselian extensions: `ℚ(p^{1/ℓ})/ℚ` is Eisenstein, tame, and
stays non-purely-wild after henselization; `ℚ(√2)/ℚ` at `7` is the negative control. §0.2's prose
laws became five API bullets. A scan of every other "would…"/"cannot be dropped" Check found no
further false control.

## REV-PKG-LocalFieldsRamificationPartII~2/R06 (P2) — applied

Verified: Layer 5's Needs lines use only §1.5, §§2.1, 2.3, 2.4, 2.7 and ClassicalAdicEtaleCohomology
§5.3. The order 4-before-5 is not forced. I applied the review's second option, explicit parallel
branches. Renumbering would break the plan stage ids `GF.4`/`GF.5` (plan nodes are not editable
here). The two later consumers cite those ids with those meanings.

Old → new: the build paragraph now says that Layers 3–4 and Layer 5 are independent branches over
Layers 1–2, that "its number expresses no dependency", and that the branches join in Layer 6. Layer
5 has an introduction saying the same. Dependencies of Layers 4, 5 and 6 now list exactly what they
use. Layer numbers and Lean section comments are unchanged.

## REV-PKG-LocalFieldsRamificationPartII~2/R07 (P3) — applied

Old → new: `module` and `@[expose] public section` removed. The three `public import` lines are now
`import Mathlib` followed by the two `TauCeti.*` modules, as the acceptance-test form prescribes.
Elaborates cleanly (below).

## Checks

**Elaboration.** `lake env lean packages/LocalFieldsRamificationPartII/Suggested.lean`, run from the
content checkout: exit 0, exactly seven warnings "declaration uses `sorry`", at lines 105, 113,
128, 145, 160, 171 and 181. The two `TauCeti.*` object files already existed, so nothing was built.

**Signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all 14 declarations
elaborated with exit 0 under `pp.universes`. I compared each type with its README statement. The
elaborated types are identical to the pre-round signature file: `[HenselianLocalRing ↥V]`,
compactness and total disconnectedness on both `E` and `G`, `[vK.HasExtension vL]`,
`Algebra.trdeg K L = ↑n`, and `[Fact p.Prime]` with `[CharP F p]`. No binder was lost and no
declaration changed.

The same scratch file also checked every newly cited pinned name: the 11 `TauCeti.Henselization.*`
/ `TauCeti.Algebra.IndEtale.flat` names, the 7 `TauCeti.StrictHenselization.*` names,
`Module.Flat.flat_iff_torsion_eq_bot_of_valuationRing_localization_isMaximal`,
`Module.FinitePresentation`, `Polynomial.Monic`, `Algebra.FinitePresentation` and `ValuationRing`.
All elaborated, with hypotheses as described. `directLimitEquiv` (`DirectLimit.lean:153`, needs a
nonempty directed index) and `algEquivOfRadicalEq` (`Radical.lean:42`) were read in source at the pin,
not `#check`ed: their object files are not built, and building them is outside the permitted
commands.

**Dependency check** (exact command of the brief):

```
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

**Citations.** `roadmaps resolve` on the README reports no cross-roadmap citation and no Lean name
found nowhere. The earlier lead `Henselization.fixed_of_henselian` is gone.

**Ownership against open work.** Searched main and the open roadmap pull-request heads with
`roadmaps grep` and `roadmaps show`. ClassicalAdicEtaleCohomology (R01) is the only earlier owner
found. No other roadmap states the §1.5 Prüfer statements or the 0ASJ/0ASK valuation-ring results.
The consumers AdicCoefficientsAndComparisonsPartII and QuadraticFormInvariantsPartII come later
(389, 391) and are not named as suppliers.

**Sources.** No new source was needed. `needs-references.toml` was not written. `serre-cg` and `rg71`
remain settled uncertified.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result / change |
|---|---|---|---|
| §0.1 Check, `P = ∅` | n = 0, 1, 2; reversed model | actual: 0 ✗ (positivity, 2∣0), 1 ✓, 2 ✗; reversed "∀q∈P, q∣n": vacuous ⇒ 0,1,2 all ✓ | Check discriminates; old claim false |
| §0.2 tower law | P={3}: ℚ ⊂ ℚ(2^{1/3}) ⊂ ℚ(2^{1/3},ζ₃); P=∅ | M/K deg 6 ✗; M/L deg 2 ✗; L/K deg 3 ✓: both sides false. P=∅: M/K trivial ⇔ both trivial | iff holds; descent-of-coefficients route checked |
| §1.2 étale/henselization | A field; ℤ_(p); ℤ_(p)[√p]_(√p) | Γ: 0→0; ℤ→ℤ with residue 𝔽_p; ½ℤ (finite, not étale) | Unchanged maths; strict part imported |
| §1.2 strict part (CAEC §5.1(a)) | ℤ_(p); field K | (ℤ_(p))ˢʰ: Γ = ℤ, residue 𝔽̄_p; Kˢʰ = Kˢ, Γ = 0 | Matches supplier |
| §1.4 radical step | B integral semilocal over V | primes over 𝔪_V = maximal ideals ⇒ rad(𝔪_V B) = ∩𝔪_i = J(B) | Uses `algEquivOfRadicalEq` correctly |
| §1.5 valuation module statement | Γ=ℚ: B=A, M=A/𝔪; M=B=A; M=0 | A/𝔪: cyclic, 𝔪 not f.g. ⇒ not f.p., torsion ⇒ not flat; A free rank 1 ✓; 0 flat, f.p. ✓ | Flatness on M needed; Check added |
| §1.5 Prüfer statements | ℤ: M=ℤ[x]/(2x−1), ℤ[x]/(2x); field A | ℤ[1/2] torsion free, f.p. ✓; x≠0, 2x=0 ⇒ torsion, excluded ✓; field: Noetherian ⇒ all f.p. ✓ | Route: torsion of N_f = (N_tors)_f, so dehomogenization is unchanged |
| §1.5 Boolean Check | A=∏𝔽₂, I=⊕𝔽₂ | A not a domain ⇒ outside both hypotheses | Consistent with new route (only flatness localized) |
| §2.2 tower via CAEC | trivial valuation; ℚ_p | trivial: Kᵘ=Kᵗ=Kˢ, I=W=1, D/I=G_K; ℚ_p: D=G, I=Gal(Kˢ/Kᵘ), W unique Sylow of I | Fixed fields/D/I as imported; homeomorphism by compact→Hausdorff |
| §2.2 W = Gal(Kˢ/Kᵗ) | p=1; p prime | p=1: Kᵗ=Kˢ, W=1; p: CAEC §5.3(iii) for Kᵘ gives unique Sylow of G_{Kᵘ}=I | "the Sylow pro-p subgroup" justified |
| §4.1 tolerance form, Ex. 15 | f=g=(X−1)(X+1)/ℚ₂ | kras=1, ε_{f,g}=∞; at ε=1: v(1−1)=∞, v(1+1)=1 ⇒ 2 roots; at ε=2: 1 root | Uniqueness needs ε>kras |
| §4.1 linear case | f=X, g=X−2/ℚ₂ | v(f−g)=1, γ*=min(0,∞)=0, ε_{f,g}=1, distance v(2)=1 | Non-strict bound attained |
| §4.1 γ* necessity | f=X²−1/16, g=X²+2X−1/16/ℚ₂ | v(f−g)=1; 1/2>0 but ε_{f,g}=−3/2; roots of g: 5/4+8w, −13/4−8w (√17≡9 mod 32); distances to ±1/4: (0,−1), (−1,0) | Without γ* the claim "≥1/2" fails |
| §4.1 n=0 | f=g=1 | no roots, no division | Excluded explicitly |
| §4.1 uniqueness below ε_{f,g} | kras<ε≤ε_{f,g} | β within ε of α, α′ ⇒ v(α−α′)≥ε>kras ⇒ α=α′; β in B_ε(α) ⇒ paired with α ⇒ β∈B_{ε_{f,g}}(α), one root (Thm 16(g)) | Route valid |
| §4.3 Check | ℚ(p^{1/ℓ})/ℚ at p, ℓ≠p; ℚ(√2)/ℚ at 7 | Eisenstein ⇒ unique prolongation, e=ℓ, tame ⇒ not purely wild; Eʰ degree ℓ over ℚ_pʰ, tame; ℚ(√2)⊆ℚ_7ʰ, Eʰ/Kʰ = id purely wild | Reflection only for henselian E/K |
| Build paragraph / deps (R06) | Needs of §§5.1–5.6, 4.1–4.5, 6.1–6.5 | Layer 5: §1.5, §§2.1,2.3,2.4,2.7, CAEC §5.3; Layer 4: Layers 0–3; Layer 6: §§0.3–0.5, 2.4, 2.7, 2.8, 2.10, 4.5, 5.1, 5.3, 5.6 | Branch claims verified |
| Headline signatures | 14 `#check @` | identical to pre-round types | No change |

## For the maintainer

- Layer 2 subsections are renumbered: old §2.3 → §2.2, §2.4 → §2.3, …, §2.11 → §2.10, and old §2.2
  is gone (imported from ClassicalAdicEtaleCohomology §5.3). No roadmap on main or at an open head
  cites these subsection numbers. AdicCoefficientsAndComparisonsPartII and
  QuadraticFormInvariantsPartII cite the plan ids `GF.k/<slug>` and layer labels `GF.1`, `GF.4`,
  `GF.5`, which are unchanged; no Lean name changed.
- This roadmap now consumes ClassicalAdicEtaleCohomology §§5.1 and 5.3. That roadmap is an open pull
  request earlier in the order (75), and it must merge first. It no longer appears here as a
  consumer.
- The ModularCurves supplier edge is removed: everything cited from its Layer 4D is pinned Tau Ceti,
  except the separable closedness of the residue field, which ClassicalAdicEtaleCohomology §5.1
  supplies for valuation rings.
- R06 was settled with the parallel-branch option, not by renumbering. Renumbering would change the
  meaning of `GF.4`/`GF.5` for the two consumers and would make the README disagree with
  `design/plan.json`, whose nodes this job may not edit.

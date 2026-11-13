# FIX-PKG-ModpRepresentationsOfGL2OverLocalFields~3

Repair round for the review REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2 of
`packages/ModpRepresentationsOfGL2OverLocalFields` (eleven findings R01–R11: two P1, five P2, four
P3). Each finding was checked against the cached sources, the pinned Mathlib and Tau Ceti, and the
cited roadmaps before it was repaired. All eleven are mathematically right; R10 is repaired
differently because the pinned Mathlib already has the carrier it asks for.

Files changed: `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`, `.../Suggested.lean`
(module docstring only; no declaration changed), `.../sources.toml` (three locators/version notes).
`metadata.toml` and `design/plan.json` are unchanged: no new supplier gap is needed.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R01 (P1) — applied

Verified (BP12 line 1470 assumes `p > 2` for `f = 1`; `Ext¹_{S₃}(k,k) = k`). §3.3: adjacency
formula for every `p` → formula for `(p,f) ≠ (2,1)`, citing Corollary 5.6(i) with its hypothesis,
with the exceptional value 1 in the target. New Checks: the `S₃` extension, `p = 2, f ≥ 2`
(value 0), `p = 3, f = 1`.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R02 (P1) — applied

Verified (`(h_tφ)(x) = χ(ad)φ(qx/c)`; the witness gives 3, not 1). §2.2: "multiplication by `q/ϖ`;
`t` rescales by `ϖ`" → `χ(ad)` times multiplication by `q/c`, with `c = a/d` and `v_F(c) = 1`; `q/ϖ`
only for `t = diag(ϖ,1)`. The `t = diag(ϖ,1)` Check is made explicit, and a unit-twisted Check
(value 3, square zero) is added.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R03 (P2) — applied

Verified (`F = ℚ₅`, `k = 𝔽₅`: `ω₂` needs order 24, `𝔽₅^×` has 4). Conventions: `ω_{f′}` →
through the unramified `F′/F` of degree `r`. It uses the Artin map of `F′` and assumes
`k ⊇ σ′_0(k_{F′})`. Norm compatibility stated; geometric normalisation kept. Same repair
in §3.4 (statement, *Needs*, order Check `24`/`4`) and the §7.6 example (`k ⊇ 𝔽_{p²}`).

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R04 (P2) — applied

Verified (Tau Ceti `Lift.lean:89`, `Reduction.lean:73`; GL2AutomorphicRepresentationsAndTransfer
§R17.5.11 owns the projective pairing). §5.4: lifting existence/uniqueness targets → cited, with
their instantiation in the Tau Ceti contracts. Reciprocity → the reviewer's Hom chain through
R17.5.11. ModularCharactersAndBlocks (#1775) is not cited: it is absent from the merge order.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R05 (P2) — applied

Verified (`𝔽₅[[t]]`, `Γ = 1`: `P̃[1/5] = 0 ≠ 1`). §5.4: lifting stays valid over any complete
DVR. The multiplicity identity → `𝒪 = 𝒪_L` of characteristic zero, `L ⊗_𝒪 P̃_σ`, with `L` and `k`
splitting. The "`𝒪 = k`" Check → equal-characteristic control `Γ = ℤ/p` (`p ≠ 1`). Pattern fixed in
§5.5 and §9.1 (`L′ ⊗_𝒪 P̃_σ`).

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R06 (P2) — applied

Verified (CompletedCohomologyAndLocalGlobalCompatibility §0.1 constructs `Ord_B` and the adjunction
for `GL₂(ℚ_p)`; merge order 251 < 263). Scope → owns only the extension to every `F`. New deferral
and contract. §2.1 → imports the `ℚ_p` case and proves the two functors agree on the common domain.
*Needs*, Layer 2 dependencies and a compatibility Check were added.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R07 (P3) — applied

Verified (design ids in `design/plan.json`, cited by #1745, #1757 and four board packages). Added a
"Former identifier (MP numbering) | Section here" table under Downstream consumers. Its 39 rows
cover every cited id and the stage ids `MP.0`–`MP.9`, e.g. `MP.0/torsion-admissibility` → §0.1,
`MP.3/weight-coordinates` → §3.1, `MP.8/projective-lattice` → §8.4.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R08 (P3) — applied

All three verified false. §0.2: false commutativity clause → explicit `S₃` products, plus a
`ℤ_p ⋊ C₂` crossed-product Check (`sTs⁻¹ = (1+T)⁻¹ − 1` versus `T`). §1.4: now requires `δ² ≠ 1`
(`p = 5`, `δ(4) = 4`); quadratic `δ` is the negative control. §4.1: the false exactness claim
→ `−∞` from grade `+∞`, tested by the pair `(−∞, 0)`.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R09 (P3) — applied

Verified (BP12 lines 479–487 and 805; EMERTON1 lines 686, 753, 762, 780). §3.1 → "BP12, equation
(2), pp. 13–14". §2.1 → "Definition 3.1.3, Lemma 3.1.7, equation (3.1.8) and Definition 3.1.9,
pp. 15–17". Pattern: §5.5 BP12 pages → p. 21 and p. 23. Manifest locators were updated in place.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R10 (P3) — applied differently

Verified, but the pinned Mathlib already has the carrier: `ContRepresentation.coind`
(`Continuous/Basic.lean:558`). §2.6: "define as an inverse limit" → cite Mathlib (new contract).
Owned here: functoriality and the finite-quotient comparison (Mittag-Leffler). Added Checks:
`σ = 0`, `σ` killed by `ϖ_L`, and the non-locally-constant `Σϖ_L^n 1_{U_n}`. §6.4 code span
closed.

## REV-PKG-ModpRepresentationsOfGL2OverLocalFields~2/R11 (P2) — applied

Verified (`Module.lean:322` requires `R`, `Γ` and `M` compact; `:99` is the level action). Tau Ceti
contract → fully qualified names and hypotheses; it covers compact modules only. §0.2 → assembles the action from the finite orbit spans
`M_v` through `toQuotientEnd`. Added a `⊕k` Check.

## Checks

**Elaboration** of `Suggested.lean`, run from the content checkout (`lake env lean`; only
`import Mathlib`, so no Tau Ceti module needed building):

```
Suggested.lean:102:8: warning: declaration uses `sorry`
Suggested.lean:119:8: warning: declaration uses `sorry`
Suggested.lean:131:8: warning: declaration uses `sorry`
Suggested.lean:149:8: warning: declaration uses `sorry`
Suggested.lean:164:8: warning: declaration uses `sorry`
Suggested.lean:178:8: warning: declaration uses `sorry`
exit 0
```

(The line numbers moved by three because the module docstring grew; no declaration changed.)

**`#check @name` pass.** I put `#check @name` for all 11 declarations into one scratch copy and
elaborated it (exit 0). I compared each elaborated type, after normalising whitespace and the
namespace, with the worker's `signatures.md` for the reviewed head. All 11 are identical:
`IsSmoothRep`, `IsTorsionAdmissible`, `IsFinitelyPresented`, `smoothDualSpan`, `GL2ModScalar`,
`isFinitelyPresented_ker`, `isFinitelyPresented_of_finite`,
`isFiniteLength_of_bounded_semisimple_quotients`, `isFiniteLength_iff_finite_smoothDualSpan`,
`isFiniteLength_of_admissible_of_finitelyPresented`,
`isFinitelyPresented_subrepresentation_of_admissible`. No binder was lost, and the types still
match the README statements of §§0.1, 0.3, 0.5, 1.3, 1.5, 1.6 and 2.4. Only the module docstring
changed. It now says that the induced module exists at the pin (`ContRepresentation.coind`). What
is missing is `Ord_B`, and for the supersingular clause the supersingular notion and a
principal-series constituent API.

**Dependency check** (command of the brief):

```
depcheck: 236 roadmaps, 2146 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. There are three more edges than at review, among them
CompletedCohomologyAndLocalGlobalCompatibility (line 251) and
GL2AutomorphicRepresentationsAndTransfer (line 100), both earlier than this roadmap (line 263).

**Citations** (`roadmaps resolve` on the README): no cross-roadmap citation and no Lean name found
nowhere. The resolver did not check library names on this host. I opened every new library name at
the pins:
- `TauCeti.completedGroupAlgebra.{proj, of, toQuotientEnd, toQuotientEnd_eq, toQuotientEnd_of, factor_toQuotientEnd}`
- `TauCeti.IsCompactModule.completedGroupAlgebraModule`
- `TauCeti.exists_projective_quotient_smul_top_linearEquiv`
- `Ideal.nonempty_linearEquiv_of_quotient_smul_top`
- `ContRepresentation.{coindV, coind}`

`sources.toml` parses (18 sources). No gate failures were listed in the brief.

## Adversarial pass on new and changed statements

| Statement | Instances tried | Values computed (both sides) | Result | Change |
| --- | --- | --- | --- | --- |
| §3.3 Ext adjacency, `(p,f) ≠ (2,1)` | `p=2,f=1`; `p=2,f=2`; `p=3,f=1,μ=(0,0)`; `p=17,μ=(5,0)` | `S₃`: Ext 1 vs adjacency 0. `q=4`: Ext 0 = 0. `𝔽₃`: `t_μ(1)=(−1,−1)=det`, `Ext¹(det,1)=1`, `Ext¹(1,1)=Hom(C₂,𝔽₃)=0`. `ω′=±1`: 1 = 1, `ω′=2`: 0 = 0 | holds except `(2,1)` | restated, exception stated |
| §3.3 Check "`f ≥ 2`: `Ext¹(σ,σ)=0`" | `p=2`; `p=3,f=2` | BP12 5.6(i)(a),(b) force `s_j=r_j±1 ≠ r_j` | true for all `p` | none |
| §2.2 Hecke `χ(ad)·(q/c)^*` | `ℚ_p, t=diag(p,1)`; `ℚ_{p²}`; `ϖ²=p`; `ℚ₅(√5), t=diag(2ϖ,1)` | multipliers `1`, `p` (zero on `𝒪_F/p`), `ϖ` (square zero), `ϖ/2≡3ϖ`: `ℓ↦3` vs old 1; `(q/c)²=5/4∈5𝒪_F` | nilpotent iff `ef≥2` | restated; Check added |
| Conventions/§3.4 `ω_{f′}` via `F′` | `F=ℚ₅,k=𝔽₅,r=2`; `k=𝔽₂₅`; `r=1` | order 24 > `|𝔽₅^×|=4`; with `𝔽₂₅`: 24, `ω₂^6=ω₁` of order 4; `r=1`: `F′=F`, `ω_f` | needs `k⊇k_{F′}` | restated; Check added |
| §5.4 lifting (Tau Ceti) | `Γ=ℤ/p`; `|Γ|` prime to `p`; `𝒪=𝔽_p[[t]]` | lift `𝒪[ℤ/p]` of rank `p = dim k[ℤ/p]`; any lattice of `σ` projective; `End_A(A^n)` finite over `𝒪` so complete | holds in both characteristics | cited, not proved |
| §5.4 multiplicity identity (char 0) | `Γ=ℤ/p, μ_p⊆L`; `Γ=ℤ/p` equal char.; `Γ=1` with `[1/p]` | `[L[ℤ/p]:χ]=1=[χ̄:k]`; equal char.: `p` vs `1`; `[1/p]`: `0` vs `1` | needs char 0 | restated with `L ⊗_𝒪`, mixed char |
| §5.4 Hom base change | `M = V°`; `M` killed by `ϖ` | `Hom(P̃,M)/ϖ ≅ Hom(P̃,M/ϖM) = Hom(P,M/ϖM)` from right exactness | holds in both characteristics | API bullet |
| §2.1 `ℚ_p` identification with CCLGC §0.1 | `χ∘det`; `Ind_{B̄}U`; `Ind_Bχ, χ≠χ^w` | `0=0`; `U=U` (unit); `χ^w=χ^w` (CCLGC Check, §2.1 Check); a `U^w`-twisted map gives `χ^w≠χ` | agree | target + Check |
| §2.6 `Ind σ ≅ lim Ind(σ/ϖ^n)` | `σ=0`; `σ=k`; `σ=𝒪` trivial | `0`; constant system = smooth induction; `C(ℙ¹(F),𝒪)` contains `f=Σϖ_L^n1_{U_n}`, `f(0)=(1−ϖ_L)⁻¹`, `f−f(0)∈ϖ_L^{v(x)+1}𝒪`, infinitely many values near 0 | comparison holds; smooth ≠ continuous over `𝒪` | API + Checks |
| §2.6 kernel `= ϖ^n Ind σ` | `σ` torsion-free; `σ = 𝒪/ϖ` | kernel `Ind(ϖ^nσ)`: `ϖ^n Ind σ`; for `σ=𝒪/ϖ`, `n=1`: kernel `Ind(0)=0 = ϖ·Ind σ` | stated only for torsion-free | as stated |
| §0.2 assembled action | `V=⊕_ℕ k`, `U=ℤ_p` trivial; `M_v⊆M_w` | each `M_v` finite (`|M_v| = |k|^{dim}`), `U_v=U`, `T` acts by 0; both actions factor through `𝒪[U/(U_v∩U_w)]` | well defined, unique | new route + Check |
| §0.2 crossed product | `S₃,U=1`; `ℤ_p⋊C₂` | `(123)` vs `(132)`; `sTs⁻¹=−T+T²−⋯` vs `T` (and `T+T²+⋯` vs `T` mod 2) | noncommutative | Checks rewritten |
| §1.4 no central character | `p=5, δ(2)=2`; `δ` quadratic; `p=3` | `δ(4)=4≠1`; `δ(z²)=1`; `𝔽₃^×={±1}`, every `δ²=1` | needs `δ²≠1`, `p>3` | Check restated |
| §4.1 value at 0 | `0`; `k`; `0→V→V→0` | `j(0)=+∞` so `−∞`; `dim k = 0`; both conventions give `dim V = dim V` | convention fixed by grade | Check restated |
| §3.1/§2.1 locators | BP12 p. 13 (l.481), p. 14 (l.484); EMERTON1 l.686/753/762/780 | equation (2) tensor form `(r₀+1)(r₁+1)`, e.g. `6·7=42`; Def/Lemma/(display)/Def | correct kinds | locators fixed |
| Former-id table | `MP.0/torsion-admissibility`, `MP.3/weight-coordinates`, `MP.8/projective-lattice`, `MP.2/category-c` | §0.1 (torsion admissibility), §3.1 (weights, depth), §8.4 (gluing lattice), §2.4 (category `𝒞`) | match plan statements | new table |

## For the maintainer

- **Source issue** (not in the review's list). BHHMS23 Lemma 2.4.6, p. 17 (lines 768–785) has no
  prime hypothesis. Its proof cites BP12 Corollary 5.6, whose case `f = 1` assumes `p > 2`
  (BP12 line 1470). For `(p,f) = (2,1)` the self-extension of the trivial weight of `GL₂(𝔽₂)` is
  one-dimensional, so the lemma fails there. This is recorded in the BHHMS23 `version_note`.
- **New supplier edges** (both earlier in the merge order, both new-roadmap pull requests):
  - CompletedCohomologyAndLocalGlobalCompatibility §0.1 (#1270), for the `ℚ_p` ordinary parts;
  - GL2AutomorphicRepresentationsAndTransfer §R17.5.11 (#931), for the projective-cover pairing.
- **ModularCharactersAndBlocks** (#1775) is not in the merge order, so it was not cited. Its §3.1
  (general Brauer reciprocity) and §1.3 (projective lifting) cover the same objects. When it is
  placed, it should cite Tau Ceti and R17.5.11 as this roadmap now does, or this roadmap's §5.4.
- **ScholzeFunctorAndModpCohomologyOfTheLubinTateTower** (#1757, merge-order line 382, later) states
  the postcomposition functoriality of `ContRepresentation.coind`. §2.6 here states it for
  `B̄ → G`; the later roadmap can cite §2.6. Not changed here.
- **LocalGaloisDeformationRingsPartII** (board package) declares `gap:fundamental-character-artin`
  on PadicLocalLanglandsForGL2Qp §0.3, comparing the Kummer and Artin definitions. The Conventions
  here define `ω_{f′}` directly from the Artin map of `F′`, and the route needs only
  ClassFieldTheory Layer 7. No gap was added.
- **Possible future headline.** With `ContRepresentation.coind` at the pin, principal series exist
  as induced modules. A reviewer may ask whether the "no supersingular constituents" clause of
  §2.4 has become statable. The docstring says what is still missing: the supersingular notion and
  a constituent API. No headline was added in this round, by the scope rule.
- **Names.** No Lean name of this roadmap changed, and no section was renumbered. The §5.4 heading
  is now "Rational constituents of projective lifts". The former-identifier table lets consumers
  of the design ids follow.
- **Ownership against open pull requests** was checked with `roadmaps grep`/`show` for: Emerton's
  `Ord_B`; continuous induction; completed-group-algebra actions on discrete modules; projective
  lifting; Brauer reciprocity. Heads read: #1270, #931, #1775, #1312, #1757, #1745, #856. The only
  duplications found are the ones settled above.
- No source was fetched and no `needs-references.toml` was written: every new locator is in an
  already cached text, and SERRE-LRFG stays settled as uncertified.

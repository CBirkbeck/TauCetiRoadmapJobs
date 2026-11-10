# Review of QuantumGroups (pull request #1649 at 5155098)

**Verdict:** needs changes

This is an incremental re-review of the 115 lines changed since `50d79b7` (review `~29`); only `README.md` changed. The folder itself has no remaining defect: the three README findings of `~29` (R01's folder part, R04, R05) are repaired and the repair introduced no new problem. The gate passes, the dependency check reports no problem, and `Suggested.lean` (byte-identical to `50d79b7`) elaborates with four `sorry` warnings.

Two findings remain. Neither is repaired by an edit in this folder; both need the author to act on pull-request text or on two other pull requests:

- **R01 (P2):** the Layer 0 objects still have a second claimed owner in two open roadmaps, and each side says the other consumes from it.
- **R02 (P3):** the description describes an earlier head, and the conflict with #1705 has no stated order.

Locations are in `TauCetiRoadmap/QuantumGroups/README.md` unless stated otherwise.

## R01 (P2) — Layer 0's objects are still claimed by two open roadmaps

Re-raised: H02 of the repair report on `~29` (with the part of H01 that report leaves to another pull request).

**Location:** `:29–46`: "Layer 0 … is the single home of the following objects … CategoricalOperatorAlgebras CA1a–CA2a and TemperleyLiebOperatorAlgebras 1.3 and 2.1 come later in the build and consume these objects from §§0.1–0.2". Repeated at `:1741–1746`.

**Claim:** at the open heads, the same objects have two owners that hand them to each other. The repair report answers that no edit in this folder repairs it. That is right about where the edit goes, but it does not remove the defect: the two other heads are unchanged, and nothing a reader of this pull request sees says which claim stands.

**Witness:**
- CategoricalOperatorAlgebras at `b9c0a6f`, `README.md:39–46`: C*-categories, standard solutions, intrinsic dimension, unitary dual functors and signed self-dualities "have their single home here; QuantumGroups consumes CA1a and CA2a". `:2625` says the same.
- TemperleyLiebOperatorAlgebras at `ba43cc7`, `README.md:72–76`: "the sign isomorphism 2.1 … are the single home … Roadmaps that need these objects consume them from here". `:1155` builds `s` over every commutative ring, which §0.2 now also states at the same generality. It never cites QuantumGroups.

**Repair (no folder edit; the three pull requests have one author):**
- In this pull request's description, state that CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras follow QuantumGroups in the merge order and cite §§0.1–0.2. This roadmap is on main and cannot consume an open roadmap, so its allocation is the admissible one.
- In CategoricalOperatorAlgebras, `README.md:39–46` and `:2625`: CA1a and CA2a cite QuantumGroups §0.1.
- In TemperleyLiebOperatorAlgebras, `README.md:64`, `:72–76` and 2.1 (`:1152–1213`): cite QuantumGroups §0.2 for `s`, its Markov-trace relation and the radical identification; `:106`, `:1336`, `:1369` cite §0.1 for CA1a and CA2a.

If the opposite order is wanted, that is a decision for a human: this README cannot name either roadmap as a supplier while it is not on main.

## R02 (P3) — The description describes an earlier head, and the conflict with #1705 has no stated order

Re-raised: H03 of the repair report on `~29`. Carried from `~27` and `~29`.

**Location:** this pull request's description (data): "Current head `d7a6c540…`"; "It adds Q1.ClassicalMultipliers and its necessary scope qualification only. All pre-existing public README bytes, Suggested.lean and metadata remain unchanged". The dependency block names only #860.

**Claim:** the description is false for this head, and two open pull requests change this roadmap and conflict with no stated order. The repair report answers that a repair does not edit pull-request text. That is so, but the text is what the final approver reads, and only the author can change it.

**Witness:**
- `git diff --stat origin/main...HEAD` rewrites `README.md` and `Suggested.lean` throughout: Layer 0 (§§0.1–0.2), Layers 1–8 in house form, six declarations.
- `roadmaps overlaps QuantumGroups`: "#1649 and #1705 conflict in `README.md`, `Suggested.lean`". #1705 at `f4ad8e4` numbers Layer 0 as §0.1 free-module legs, §0.2 C*-categories, §0.3 unitary Temperley–Lieb category, and makes §0.3 "the single home" of a category this head leaves to TemperleyLiebOperatorAlgebras Layer 3 (`:50–52`).

**Repair (pull-request text):**
- Rewrite the description for `5155098`: §1.1 ClassicalMultipliers; Layer 0 as §§0.1–0.2 with the sign map over every commutative ring; Layer 8 on the native `TauCeti.UqSl2`; the six-declaration `Suggested.lean`.
- State which of #1649 and #1705 is rebased on the other, which Layer 0 numbering survives, and which roadmap owns the unitary Temperley–Lieb category. The repair report's proposal (this one merges first; #1705 takes §§0.1–0.2 and either drops its §0.3 or keeps it with TemperleyLiebOperatorAlgebras Layer 3 citing it) is consistent with this head.

## Previous findings

- R01 — partly repaired: `:38–43` and `:282–311` now state `s` "for every commutative ring k and every δ∈k" and the radical identification "at every δ∈ℂ"; the hand-off clauses are gone. TemperleyLiebOperatorAlgebras 2.1 still builds `s`. Residual in R01 above.
- R02 — not repaired: CategoricalOperatorAlgebras at `b9c0a6f` `:45–46` still reads "have their single home here; QuantumGroups consumes CA1a and CA2a". R01 above.
- R03 — not repaired: the description still opens "Current head `d7a6c540…`" and names neither #1705 nor the Layer 0 move. R02 above.
- R04 — repaired: `:195–198`: "item k of Q8 is §8.k for k=1,…,7: Q8 item 1 is §8.1 … and Q8 item 5 is §8.5, the finite Hopf-module category `TauCeti.FiniteHopfModuleCat`".
- R05 — repaired: `:259` reads `CategoryTheory.Idempotents.Karoubi`; `:1582` reads "`IsGroupLikeElem k g` (Mathlib `RingTheory/Coalgebra/GroupLike.lean`)"; `:1806–1807` ends "it extends this mathematical scope."

## Verified sound

**Gate.** Rerun on this head: every scanner 0, ending `stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate also reports `build=0`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`, the same as main's.

**Dependency check** (the required command, output unmodified):

```text
depcheck: 235 roadmaps, 2267 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The repair adds no supplier: its new inputs are Tau Ceti declarations and TemperleyLieb Layer 4, which is on main and was already a supplier. QuantumGroups is not listed in the merge order; CategoricalOperatorAlgebras and TemperleyLiebOperatorAlgebras are, and no *Needs:* line names either.

**Elaboration.** `lake env lean` on `Suggested.lean` exits 0 with four `declaration uses sorry` warnings (`:83`, `:111`, `:122`, `:130`) and nothing else. `git diff 50d79b7 HEAD` touches only `README.md`, so the six elaborated signatures, the 16-probe padding check and the headline list of `~29` stand unchanged; `scratch/signatures.md` matches `~29`'s reading (`[StarModule ℂ A]` is absent only from `AlgebraicHaar`, whose fields do not use it).

**Pinned declarations opened for the changed passages (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`).**
- `TauCeti.TemperleyLieb R δ n` (`Algebra/TemperleyLieb/Basic.lean:97–140`): `Semiring` over a `CommSemiring`, `Ring` over a `CommRing` (`:137`), so `−e_i` needs the commutative ring the README asks for.
- `lift` (`:196`) takes the three relations `hself`, `hadj`, `hdist` into any `R`-algebra; `hom_ext` (`:215`); `strandIncl : TemperleyLieb R δ (n+1) →ₐ[R] TemperleyLieb R δ (n+2)` (`:233`) with `strandIncl_e` (`:239`); `twoStrandRep_e = !![0,0;1,δ]` (`:317`), the matrix of the new Check at δ=1.
- `IsMarkovTrace` (`Algebra/TemperleyLieb/Trace.lean:54–61`): `tr n 1 = δ^n`, traciality, `tr (n+2) (strandIncl x) = δ * tr (n+1) x`, `tr (n+2) (strandIncl x * e δ (Fin.last n)) = tr (n+1) x`. `IsMarkovTrace.unique` (`:88`) holds over `[CommSemiring R]` with no condition on δ, as `:183–185` says.
- `isMarkovTrace_markovTrace` (`Algebra/TemperleyLieb/MarkovTrace.lean:509`).
- No sign isomorphism exists at the pin (grep of `Algebra/TemperleyLieb/` for a map between parameters δ and −δ: no hit), so §0.2's `s` duplicates nothing in the library.
- `CategoryTheory.Idempotents.Karoubi` (`Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43`, inside `namespace CategoryTheory`, `namespace Idempotents`); `IsGroupLikeElem` (`Mathlib/RingTheory/Coalgebra/GroupLike.lean:37`). The README now has no link to a library commit.

**Cross-roadmap citations resolved on main (`f8836c4`) for the changed passages.**
- TemperleyLieb Layer 4 (`README.md:545–604`): `presentedTLEquiv : TauCeti.TemperleyLieb R δ n ≃ₐ[R] TLAlg R δ n` (`:564`); the `StarRing` by vertical reflection with `star (r • x) = r • star x` (`:551–553`), which fixes every `e_i` (`:923`); `tr̂` with its four properties (`:580–583`); `existsUnique_isMarkovTrace` over every commutative ring and every δ, with existence `tr̂ ∘ presentedTLEquiv` (`:595–596`).
- TemperleyLieb Layer 6 (`:713–723`): the negligible ideal is the `f` with `tr̂(f ≫ g) = 0` for all `g`; its endomorphisms of n are the set `:308–310` names.
- Subfactors 3.1 (`:678`, `:691`): `†` exists for real δ only. Subfactors 3.2 (`:699–700`, `:704–710`, `:726`): `T_n` and Markov uniqueness "for every δ ∈ ℂ"; `R_n = {x : T_n(xy) = 0 for all y}` is defined under "For real δ". The README's wording ("this radical, which for real δ is Subfactors 3.2's R_n") matches.
- Q8 items: main's `README.md:601`, `:639`, `:660`, `:682`, `:701`, `:775`, `:797` carry the seven titles of §§8.1–8.7 at this head (`:1323`–`:1694`), in order.
- No roadmap on main owns the sign map or the radical identification (`roadmaps grep`, TemperleyLieb and Subfactors READMEs read).

**Seeded sample.** The diff touches no source locator. Of the sampled targets only §0.1's *Needs:* line changed (the Mathlib name, checked above). §0.2's Neshveyev–Tuset §2.5 citation moved with its sentence, unchanged; `~29` read it at `nt` lines 2462–2516. The other sampled locators are in untouched text and stand as `~29` records them.

**Adversarial table: changed statements** (values computed in this review):

| # | Statement | Instances | Values | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A | `s(e_i)=−e_i` defines an algebra map TL_n(k,−δ)→TL_n(k,δ) (`:282–288`) | quadratic; adjacent; distant; 𝔽₂; δ=0; n≤1 | (−e)²=e²=δe=(−δ)(−e). (−e₁)(−e₂)(−e₁)=−e₁=s(e₁). (−e₁)(−e₃)=e₁e₃=(−e₃)(−e₁). 𝔽₂: −1=1, s=id. δ=0: 0=0·(−e). n≤1: no generators | pass | none |
| B | s is invertible (`:289–290`) | generators | the map built at −δ sends −e_i to e_i; composite fixes generators, so it is id by `hom_ext` | pass | none |
| C | s commutes with `strandIncl` and generator-fixing involutions (`:290–294`) | e_i; w=e₁e₂ on 3 strands; λe₁ with λ=i | strandIncl(−e_i)=−e_(castSucc i). ρ(s w)=ρ(e₁e₂)=e₂e₁=s(ρ w). †(s(ie₁))=†(−ie₁)=ie₁=s(−ie₁)=s(†(ie₁)); † needs real δ on both sides | pass | none |
| D | tr_n(s x)=(−1)^n tr'_n(x) (`:294–301`) | the four axioms for φ_n(y)=(−1)^n tr'_n(s⁻¹y); n=1; n=2, x=e; n=3, x=e₁e₂ | φ_n(1)=(−1)^n(−δ)^n=δ^n. φ_(n+2)(incl x)=(−1)^(n+2)(−δ)tr'_(n+1)(s⁻¹x)=δφ_(n+1)(x). φ_(n+2)(incl x·e_last)=(−1)^(n+3)tr'_(n+1)(s⁻¹x)=φ_(n+1)(x). n=1: δ=−(−δ). n=2: tr(−e)=−δ, tr'(e)=−δ. n=3: tr(e₁e₂)=δ, −tr'(e₁e₂)=−(−δ)=δ | pass | none |
| E | parity ℓ+c≡n (`:301–303`) | 1 on n strands; e on 2; e₁e₂ on 3 | (0,n,n); (1,1,2); (2,1,3) | pass | none |
| F | s preserves δ^(−n)T_n for invertible δ (`:305–306`) | δ=2, n=1; δ=5/2, n=2, x=e | 2⁻¹·2=1=(−2)⁻¹·(−2). (4/25)(−5/2)=−2/5 on both sides | pass | none |
| G | s carries the radical at −δ onto the radical at δ; radical = negligible endomorphisms (`:306–311`) | n=2 at δ=1, −1, 0, 3 | δ=1: T(1)=T(e)=1, radical ℂ(1−e)=ℂf₂, and [3]=δ²−1=0. δ=−1: T(1)=1, T(e)=−1, T(e²)=1, radical ℂ(1+e); s(1+e)=1−e. δ=0: T≡0, radical all of TL₂ on both sides. δ=±3: 9a±3b=0 and ±3a+9b=0 force a=b=0 | pass | none |
| H | Negative control (`:349`) | ℤ, δ=1 | e↦e would give e²=−e in TL₂(ℤ,1), where e²=e, so 2e=0; `twoStrandRep` sends 2e to [[0,0],[2,2]]≠0 | pass | none |
| I | s carries Jones–Wenzl projections to Jones–Wenzl projections (`:341`) | f₂ | at −δ, f₂=1+δ⁻¹e; s gives 1−δ⁻¹e, which is f₂ at δ; [j] at −δ is (−1)^(j−1)[j], so the nonvanishing hypotheses agree | pass | none |
| J | "Return to the cup" (`:313–322`) | ε=−1 | T^(d)((sx)†(sx))=T^(d)(s(x†x))=(−1)^n T^(−d)(x†x)=ε^n T_n(x†x) | pass | none |
| K | item k of Q8 is §8.k (`:195–198`) | items 1 and 5 | main `:601` "Presentation, PBW and Hopf API" = §8.1; main `:701` "Tensor, dual and explicit Clebsch–Gordan theory" = §8.5 | pass | none |
| L | Mathlib names (`:259`, `:1582`) | declarations at the pin | `Karoubi.lean:43` in `CategoryTheory.Idempotents`; `GroupLike.lean:37` | pass | none |
| M | Ownership of Layer 0 (`:29–46`) | #888 `:45–46`; #867 `:72–76`, `:1155` | both other heads claim the single home | fail | R01 |
| N | Description vs head | description text; `git diff --stat` | "README bytes … unchanged" against a full rewrite; #1705 unnamed | fail | R02 |

**Adversarial table: carried rows.** The diff leaves the statements of rows 1–4 and 6–34 of `~29` untouched; each row is carried from `~29` with the values recorded there, all pass. Row 5 of `~29` (the sign map over ℂ) is replaced by rows A–G above. The headline and sampled rows, with their recorded values:

| # (`~29`) | Statement | Values recorded in `~29` | Result |
| --- | --- | --- | --- |
| 1 | §0.1 minimal norm product vs standardness | ‖R‖‖R̄‖=√5·√(5/4)=5/2>2=d; rescaled standard pair has product 2 with R*R=8≠½ | pass |
| 2 | §0.1 signed self-duality | SU(2) cup gives ε=−1, symmetric cup ε=+1 | pass |
| 10 | §1.2 cancellation and Haar states | monoid {1,0}: dim 3<4; C(C₂): h(1[e])=½ | pass |
| 12 | §2.2 unitarization | T=½(I+U*U)=[[1,1],[1,3]], det 2; U=0 gives T=0 | pass |
| 13 | §2.3 regular corepresentation | 1+1=2; 1+1+4=6 | pass |
| 14 | `schur_orthogonality` | q=½: h(a*a)=1/5, h(c*c)=4/5, h(aa*)=4/5; reducible u=I₂ gives 1≠0 | pass |
| 15 | `AlgebraicHaar` | ℂ[C₂]: h((1+u)*(1+u))=2, h(1)=1; zero functional and counit excluded | pass |
| 19 | `compactType_iff` | ℂ: both sides hold; zero ring excluded by `[Nontrivial A]`; ℂ[x]: both sides false | pass |
| 20 | `haar_modular_automorphism` | ℂ[S₃]: θ=id; SUq(2): θ(a)=4a, θ⁻¹ gives 1/20≠4/5 | pass |
| 21 | `haar_trace_iff_antipode_involutive` | ℂ[S₃]: both true; SUq(2): 4/5≠1/5 and S²(c)=c/4 | pass |
| 22 | `unitaryCoefficientSet` | ℂ[C₂]: 1 and u; `Fin 0` contributes nothing | pass |
| 18, 19 | §4.1, §4.3 | σ_(−i)(a)=4a, h(aa*)=4/5=h(a*·4a); Bédos–Murphy–Tuset Thm 2.12 for 0<\|q\|<1 | pass |
| 25, 26 | §6.2, §6.3 | dim A_≤1=2; Rep S₃: 1+1+4=6 | pass |
| 29–34 | §§8.1–8.3, 8.5–8.7 | KF=4FK; Casimir 10/9, 17/9, 65/18; α₁=−½; tr K⁻¹=5/2; h₁=½; [E,F]=H | pass |

**Shape of the changed passages.** §0.2 keeps its API list (three bullets, the second rewritten to the new generality) and seven Checks, the new one a negative control. The *Needs:* line (`:353`), the layer's Dependencies paragraph (`:363–366`), the TemperleyLieb supplier row (`:123`), the Tau Ceti contract (`:178–185`), the scope paragraph (`:37–52`) and Downstream consumers (`:1744–1746`) state the same generality. No process word, LaTeX or pull-request number was added.

**Ownership against open work.** Read at their heads: CategoricalOperatorAlgebras (`b9c0a6f`), TemperleyLiebOperatorAlgebras (`ba43cc7`) and #1705 (`f4ad8e4`, through `roadmaps show`). `scratch/overlaps.md` lists no dropped id in either direction; `scratch/citations.md` lists nothing unresolved.

## Not verifiable

- Timmermann, *An Invitation to Quantum Groups and Duality* (EMS 2008), is recorded `uncertified` and cited by locator only; none of its locators is in a changed passage.
- The descriptions of #888, #867 and #1705 were not read; their README texts were.

## Source issues

- none

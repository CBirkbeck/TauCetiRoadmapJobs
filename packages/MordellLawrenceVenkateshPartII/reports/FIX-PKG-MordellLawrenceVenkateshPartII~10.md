# FIX-PKG-MordellLawrenceVenkateshPartII~10: repair report

The review `REV-PKG-MordellLawrenceVenkateshPartII~9` has three findings: one P2 and two P3. I checked
each one against the cached LS text, the roadmap's own sections and a script over the README. All three
are correct.

- F01 is applied differently. The suggested wording reused a term the README never defines ("classical
  rank"). It also left out two hypotheses that §§1.5 and 2.1 need (`E ≠ 0`, `N > 0`) and one the
  inequality needs (`c ≥ 1`). The review says §6.1 already introduces `E`, `H` and `G`; it does not.
  §6.1 had the same defect and is repaired in the same words.
- F02 and F03 are applied. The pattern searches found one more section citing LS that the manifest
  omitted ("Worked examples") and two lemmas, §§4.4 and 5.12, that used `H` without saying where it comes
  from.

Files changed:

- `packages/MordellLawrenceVenkateshPartII/README.md`
- `packages/MordellLawrenceVenkateshPartII/sources.toml`: the `cited_for` of `LS` only.

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged. No gap was added, and no Lean
name was added, renamed or deleted.

## REV-PKG-MordellLawrenceVenkateshPartII~9/F01 (P2) — applied differently

**Verified.** LS Theorem 7.3 (LS lines 3259–3279) fixes a constant H⁰-algebra `E` and takes `H` to be one
of `GL_N`, `GSp_N`, `GO_N`. It takes `V` to be an `E`-module with `H`-structure in the sense of LS
Definition 5.27 (LS lines 2187–2193, which require equidimensionality of rank `N`). It uses the groups of
LS §5.7. Those groups are LS §5.6's Weil restriction and its normalizer (LS lines 2411–2426), which are
`B` and `G` of README §2.1. The old §4.5 named none of `E`, `H` or `G`.

§6.1 had the same defect, contrary to the review:

- it named no `E`;
- it used `H` ("profile `h` on `H`", `dim H`, `rank H`) with no antecedent;
- it used the undefined phrase "classical rank `N`";
- its route used `G` with no antecedent.

**Old → new (§4.5 and §6.1, same sentence).** "Let `V` be an integral polarized pure Hodge–Deligne
system … with uniform coefficient filtration and strongly c-balanced monodromy" (§6.1: "… classical rank
`N` over a constant étale H⁰-algebra with the required coefficient pairing (§1.5)") → "Let `E` be a
nonzero constant étale H⁰-algebra on `𝒳` (§§0.4, 1.1), let `H` be `GL_N`, `GSp_N` or `GO_N`, and let `V`
… be an equidimensional `E`-module of rank `N > 0` with an `H`-structure (§§1.4–1.5). Let `G` be the
semilinear coefficient normalizer of §2.1 … Assume … uniform … profile `h` on `H` (§2.8) … strongly
c-balanced … for an integer `c ≥ 1` (§4.2) …".

**Other changes in the two sections.**

- §4.5's conclusion now says "global Galois representations into `G(ℚ_p)` are G-completely reducible
  (§2.3)".
- §6.1 now says "`t = rank H` (the dimension of a maximal torus)", as LS line 3820 does.
- In both sections "in `ℤ[t]`" became "with integer coefficients". §6.1 also uses `t` for `rank H`, so
  the old wording gave `t` two meanings.
- A fourth Check was added to §4.5: the cases `E = ℚ` and `E = ℚ × ℚ`, which separate `dim H` from
  `dim G`.

**Why the review's wording was changed.**

- "Classical rank" is defined nowhere. §1.4 defines "rank".
- §1.5 assumes `E ≠ 0` and `N > 0`, and §2.1 does too. Its Checks show that `E = 0` breaks the parity
  claim.
- `c = 0` makes `(d + dim H)/c` a division by zero. LS asks for "a positive integer `c`" (LS line 3267).

**Pattern.**

- §4.4 (LS Lemma 7.2) and §5.12 (LS Lemma 8.16) also used `H` without an antecedent. LS sets both in "the
  setting of Section 5.6" (LS lines 3206 and 3723), and LS §5.6 is README §2.1. Both now begin "In the
  setting of §2.1". §5.12's "rank `t` for `H`" became "`t = rank H`".
- *Needs:* lines:
  - §4.4: §§2.2, … → §§2.1–2.2, …
  - §4.5: → §§0.2, 0.4, 1.1, 1.4–1.5, 1.9, 2.1, 2.3, 2.8–2.9, 3.4, 4.2, 4.4
  - §5.12: adds §2.1
  - §6.1: → §§0.2, 0.4, 1.1, 1.4–1.5, 1.9, 2.1, 2.7–2.9, 3.4, 4.2, 5.8, 5.12
- §§2.8, 5.11 and 8.5 were checked. They take `H` from §2.1 ("coefficient-normalizer object", "the
  coefficient normalizer") or from §8.1's explicit `GL`/`GSp`/`GO` choice, so they need no change.
- The consumer §10.5 builds exactly the `GL_N`/`GSp_N`/`GO_N`-structures of §1.5 over a nonzero `E` with
  `N = n!·d > 0`, so it still meets §6.1's hypotheses.

## REV-PKG-MordellLawrenceVenkateshPartII~9/F02 (P3) — applied

**Verified.** I wrote my own scan that compares each layer's *Needs:* items, both external names and
internal layers, with its Dependencies line. It confirms exactly the four omissions the review lists.

**Old → new.**

- Layer 2 Dependencies: appended "; Mathlib `Finsupp`".
- Layer 3 Dependencies: appended "; `TauCeti.Cocharacter.parabolic`; Mathlib
  `Ideal.iInf_pow_eq_bot_of_isLocalRing`".
- Layer 9 Dependencies: "Layers 7 and 8" → "Layers 0, 7 and 8", and appended "; Mathlib
  `MvPolynomial.pderiv`, `AlgebraicClosure`".
- Layer 6 Dependencies: "Layers 1–5" → "Layers 0–5".
- §6.1's *Needs:* line is the review's list plus §§0.4, 1.1, 1.4 and 2.1, which the F01 statement now
  cites.

After the edits, the rerun scan finds every *Needs:* item of every layer in its Dependencies line.

## REV-PKG-MordellLawrenceVenkateshPartII~9/F03 (P3) — applied

**Verified.** §7.1 cites "LS, Lemma 5.43, pp. 58–59". My scan of every README section for LS citations
also found the "Worked examples" section, which cites "(LS, Example 8.6, pp. 75–76)". The manifest
already lists the unnumbered section "Source corrections", so "Worked examples" belongs there too. The
lists for LV, Beauville, BC and Serre cover every section that cites them.

**Old → new.** The `cited_for` of `LS` in `sources.toml` gains `"7.1"` after `"6.1"` and
`"Worked examples"` before `"Source corrections"`. Nothing else in the entry changed. The file parses
as TOML, and its keys are unchanged (`LS`, `LV`, `Beauville`, `BC`, `Serre`).

## Checks

- **Elaboration.** `lake env lean packages/MordellLawrenceVenkateshPartII/Suggested.lean`, run from
  the content checkout: exit 0. The only output is `declaration uses 'sorry'` at 69:8 and 109:8. The
  file was not edited.
- **Signatures.** I copied the file to scratch with `#check @name` for all six declarations and
  elaborated it once. Exit 0. Each elaborated type is unchanged and agrees with its README statement,
  and no section binder was lost:
  - `eulerian : ℕ → ℕ → ℕ`
  - `eulerian_central_mass_le_half : ∀ (n : ℕ), 2 ≤ n → 2 * ∑ q ∈ Finset.range n, eulerian n q ^ 2 ≤ n.factorial ^ 2`
  - `HypersurfaceMonomial : ℕ → ℕ → Type`
  - `@IsSmoothHypersurface : {k : Type u_1} → [inst : Field k] → {n : ℕ} → MvPolynomial (Fin (n + 1)) k → Prop`
  - `@HasGoodReductionOutside : {n : ℕ} → Finset ℕ → MvPolynomial (Fin (n + 1)) ℤ → Prop`
  - `integralHypersurfaces_not_zariskiDense`: as in the file (`∃ n₀, ∀ n ≥ n₀, ∃ D₀, ∀ d ≥ D₀, ∀ S, ∃ G, G ≠ 0 ∧ (∃ e, G.IsHomogeneous e) ∧ ∀ F, F.IsHomogeneous d → HasGoodReductionOutside S F → eval (coeff F) G = 0`)
- **Dependency check** (the prescribed command):

  ```text
  depcheck: 243 roadmaps, 2289 edges, 0 problem(s)
  ```

  It shows no UPWARD, CYCLE or moved line. The edits add no edge to another roadmap; every name added to
  a Dependencies line was already in a *Needs:* line.
- **Citations.** `roadmaps resolve` on the edited README finds no unresolved cross-roadmap citation and
  no unresolved Lean name. The worker's single lead, `VanishingCycles.lisseDirectImageTransport` (README
  line 470), is a name planned by EtaleCohomologyFoundations: its README line 1135 uses it, under §F.3.
  It is not a pinned declaration, and the README cites it as that roadmap's.
- **Gate failures.** The brief lists none.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.5 hypotheses (new) | `E = 0` | No geometric embeddings, so `V = 0` is "rank `N`" for every `N` and the §1.5 parity fails (§1.5 Check) | Excluded by "nonzero `E`" | Added `E ≠ 0` |
| §4.5 | `N = 0` | `H = GL₀`, `dim H = 0`, `A = 0`, so `A ≥ d/c` fails for `d ≥ 1`; §1.5 assumes `N > 0` | Excluded twice | Added `N > 0` to match §1.5 |
| §4.5, §6.1 | `c = 0` | `(d + dim H)/0` is undefined; LS line 3267 asks for a positive integer | Was unstated | Added `c ≥ 1` |
| §4.5 | `E = ℚ`, `H = GL_N` | `B = G = GL_N`, `dim H = N²`; `GL_N`-complete reducibility (a Levi in every parabolic containing the image) is "every invariant subspace has an invariant complement", that is semisimplicity | LS Thm 7.3 recovered | New Check |
| §4.5 | `E = ℚ × ℚ`, `H = GL_N` | `B = GL_N × GL_N`, `G = B ⋊ C₂`, `dim G = 2N²` against `dim H = N²` | Single-factor cost, as in LS line 3276 and §2.2 | New Check |
| §4.5 | `H = GSp_N`, `N` odd | No perfect alternating form in odd rank over `E ≠ 0` (§1.5 Check, `N = 1`) | No such `V`, so the statement is not vacuous in a wrong way | None |
| §4.5 route against §4.4 | `e = d` | §4.4 asks `A ≥ (e + dim H)/c`, which becomes `A ≥ (d + dim H)/c`, §4.5's hypothesis | Consistent | None |
| §4.5 | `d = 0`; larger `S` | A point is dense in itself; a larger `S` gives more integral points | Old Checks still hold | None |
| §6.1 (new) | `H = GL₂`, weights `(1, 0)` | `t = rank GL₂ = 2` (maximal torus `diag`), `h = (1, 2, 1)`, `(h⁰ − t)/2 = 0`, `D = 4 = dim H` | Agrees with the §5.10 Check (`t = 2`) and the §8.5 Check | `t` defined as LS line 3820 does |
| §6.1 | `t` and `ℤ[t]` in one statement | The old text used `t` for both the polynomial variable and `rank H` | Clash | Now "with integer coefficients" |
| §6.1 route against §5.12 | `e = d` | §5.12's two inequalities with `e = d` are §6.1's two inequalities; the domain `[0, dim H]` is `[0, D]` because `D = Σ_a h^a = dim Lie H` | Consistent | None |
| §6.1 consumer §10.5 | Symmetric `n = 4`; nonsymmetric | `GSp_N` structure (pairing sign `(−1)^(n−1) = −1`); `GL_N` structure with no pairing; `E = ℚ(μ_r)`-type algebra ≠ 0; `N = n!·d > 0` | Hypotheses met | None |
| §4.4 (setting clause) | LS Lemma 7.2 | "Setting of Section 5.6" (LS line 3206), and LS §5.6 is "An algebraic group" (LS line 2411) = README §2.1 | Correct antecedent | "In the setting of §2.1" |
| §5.12 (setting clause) | LS Lemma 8.16 | "Setting of Section 5.6 and Section 5.7" (LS line 3723); LS §5.7 is §§1.4–1.5 and 2.1 here | Correct antecedent | "In the setting of §2.1" |
| Layer Dependencies (F02) | All 11 layers, scripted | Every *Needs:* item, external and internal, found in its layer's Dependencies line after the edit; before it, missing were Layer 2 `Finsupp`, Layer 3 `TauCeti.Cocharacter.parabolic` and `Ideal.iInf_pow_eq_bot_of_isLocalRing`, Layer 9 Layer 0, `MvPolynomial.pderiv` and `AlgebraicClosure`, and Layer 6 Layer 0 (from the new §6.1) | Complete | As listed under F02 |
| `cited_for` of LS (F03) | Scan of all sections | LS cited in 0.1–0.7, 1.1–1.9, 2.1–2.10, 3.1–3.4, 4.1–4.5, 5.1–5.12, 6.1, 7.1, 8.1–8.5, 10.1–10.10, Worked examples, Source corrections | Was missing 7.1 and Worked examples | Both added |

## Ownership and suppliers

The repairs introduce no new object, carrier or target. They add three things:

- antecedents for objects the roadmap already defines (§§0.4, 1.1, 1.4–1.5, 2.1, 2.3, 2.8, 4.2);
- dependency entries that the targets already list;
- one manifest field.

So no ownership question arises, and I did not run a new search against open pull requests. No supplier
citation was added or changed. No notion moved down.

## For the maintainer

- No name that other roadmaps cite changed. No Lean declaration changed, and the section numbering is
  unchanged.
- §§4.5 and 6.1 now state their hypotheses in full. `roadmaps grep` finds no roadmap, on main or in an
  open pull request, that cites MordellLawrenceVenkateshPartII by name. LogicAndDefinabilityInNumberTheory
  mentions Hodge–Deligne systems (its README line 1921) but cites no section of this roadmap, so no
  other roadmap is affected.
- The review raises no instruction-like text. Its "For the human reviewers" section has two licence
  notes (Serre uncertified; the LV cache host). Following the brief, they were not acted on.

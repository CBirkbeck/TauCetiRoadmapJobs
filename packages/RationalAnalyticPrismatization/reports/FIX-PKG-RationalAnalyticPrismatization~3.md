# FIX-PKG-RationalAnalyticPrismatization~3

This round repairs the three findings of `REV-PKG-RationalAnalyticPrismatization~2`, which form round 3 of the package.

Two files changed:

- `packages/RationalAnalyticPrismatization/README.md`: the routes of 0.4, 0.5 and 2.8, the statement of 2.4(3), the statement, API, *Needs:* and Checks of 10.5, and the route of 10.11.
- `packages/RationalAnalyticPrismatization/sources.toml`: the ABLB locator list gains Lemma 4.4.3 and Proposition 4.5.5. The README already cited both before this round.

`Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged.

The review's summary paragraph calls the findings R01–R03. These are its F01–F03.

## F01 (P2) — applied differently

**What changed.** In the 0.5 route, the Proposition 9.4 sentence that followed Gest line 3057–3059 is replaced by my own wording:

- Σ_f is composition with f.
- A correspondence f^*U → V over Y and a correspondence U → Σ_f V over X are the same datum. Reversing the spans gives the other side.
- So `Corr(Σ_f)` is adjoint to `Corr(f^*)` on both sides.
- This passes to `Fun(Corr(C_{/−}), 1Pr)` and then to `K_{D,−}`.

**Verification.** Gest line 3057–3059 is the whole proof of Gest Proposition 9.4. The old sentence shared runs of 11 and 10 words with it. The finding is right.

**Why differently.** The proposed sentence is correct and would also have done. I used my own text so that the route also shows why the adjunction is two-sided on correspondences and not on C. Take f: {a, b} → ∗ in finite sets, U = ∗ and V = (∗, ∗) over {a, b}:

- Hom_{C/Y}(f^*U, V) has 1 element.
- Hom_C(U, Σ_f V) = Hom(∗, ∗ ⊔ ∗) has 2 elements.

So in C, Σ_f is only the left adjoint of f^*. On spans, both Hom-sets are pairs (W_a, W_b) with maps to U and to V_a, V_b.

**Pattern.** I compared every "A proof route" paragraph with all 24 cached sources for shared runs of 8 or more words, and the whole README for runs of 9 or more. Two more routes followed a source's proof sentence.

- **0.4 (ambidexterity).** It shared 11 words with Gest line 2246, and its clauses followed Gest line 2232–2240. The rewritten route names the two adjoints and why each exists:
  - The unit of F = f^*_m ⊣ f_{m,*} is f^*_{m−1}: 1 → (B/A)_m. It has a right adjoint because f is 0-prim.
  - The counit is the image, under the kernel functor, of 1 → (B/(B ⊗_A B))_m. It has a right adjoint because the diagonal is 0-prim.
  - The statement needs m ≥ 1. For k[x] over k, f^*_0 has no left adjoint (second Check of 0.3).
- **2.8 (perfectoidization).** It shared 10 words with ALRS line 1012. It is rewritten as a left Kan extension along the basis of separable totally disconnected perfectoid rings (ABLB line 2743–2745).
  - The rewrite exposed a wrong input. The route cited 2.4(3), which covers qfd perfectoid rings only. The totally disconnected case it needs is ABLB Lemma 4.4.3 (p. 46, ABLB line 2414–2417), whose rings are not assumed qfd.
  - 2.4(3) now states both clauses and cites ABLB Lemma 4.4.3. Its route already ran through ABLB Lemmas 4.4.3–4.4.9.

**After the repair.** No route shares a run of 9 or more words with a cached source except one: line 1049, "by the universal property of the de Rham complex" (ALRS line 2017). That is the name of a universal property, and the rest of the sentence differs.

The 8-word runs left in routes are standard phrases: "finite dimensional compact Hausdorff space", "a countable limit of finite disjoint unions of". The remaining runs of 9 or more words in statements are forced by the statement, as the review found: Gest Remark 9.6 at 0.5, ALRS Definition 2.7.7 at 4.4, ALRS Definition A.2.2 at 4.6, and a list of names at 4.1.

## F02 (P3) — applied

**What changed.** In 10.5, "for compact G, H: `M^{(G×H)-la} = (M^{G-la})^{H-la}`" becomes a statement for all p-adic Lie groups G, H and every M ∈ D(B(G^cont × H^cont)):

- `s_{G×H}` = (id × s_H) ∘ (s_G × id), and each factor is a base change of the 0-proper map s_G or s_H.
- The pushforward along each factor is computed by proper base change.
- For compact G and H this reads as before.

The API bullet changes the same way. *Needs:* gains §2.2. A new Check covers G = ℤ, and the 10.11 route is updated.

**Verification.** ALRS Remark 5.2.25 (ALRS line 5659–5662) is stated for p-adic Lie groups and M ∈ D(B(G^cont × H^cont)), and 10.11 states ALRS Proposition 5.8.9 for p-adic Lie groups (ALRS line 7595). So 10.5 was narrower than its source. The finding is right.

- **The square is cartesian.** B(G × H) = BG × BH, and BG^la → B(G^la × H^cont) is id × (∗ → BH^cont). So B(G^cont × H^cont) ×_{B(G^la × H^cont)} BG^la = BG^cont × (BH^cont ×_{BH^cont} ∗) = BG^cont.
- **Proper base change applies.** It holds for 0-proper maps by 2.2, whose pullbacks have linear right adjoints satisfying base change.
- **Effect on 10.11.** ALRS's own proof of 5.8.9 first restricts to compact groups (ALRS line 7607) and then uses ALRS Lemma 5.2.28 (ALRS line 7620). The new 10.11 route names both the general form and that reduction.

**Pattern.** I searched the README for other statements stated for compact groups only but used for non-compact ones:

- The other `(G×H)-la` occurrence is 10.7 (ALRS Lemma 5.4.7), which is already stated for p-adic Lie groups.
- 10.3 already states ALRS Lemma 5.2.10(1)–(2) for non-compact G.
- ALRS Lemmas 5.2.26–5.2.28 are compact-only in the source: ALRS line 5664 and 5721, with 5.2.27 inside §5.2.2, where G is compact (ALRS line 5086).

## F03 (P3) — applied differently

**What changed.** The second Check of 10.5, "R itself decompletes, since C^la_G `⊗_{C^la_G}` R = R", is replaced. The new Check:

- computes R^la = C^la_G against three wrong models for G = ℤ_p;
- shows that N with trivial action is locally analytic;
- derives (N ⊗ R)^la = N ⊗ C^la_G from ALRS Lemma 5.2.27(2).

In the third Check, the tautological half is now labelled as such, and a negative control is added: A = C^la(ℤ_p) ⊂ B = C(ℤ_p).

**Verification.** For every R, R^la `⊗_{R^la}` R = R, so the old clause holds for every algebra and every functor (−)^la. The finding is right.

**Why differently.** The suggested Check ends with N = ℚ_p, where N ⊗ R = R decompletes over R. That is the same tautology again. The new second Check puts its weight on the value of (−)^la instead:

- the identity would give C(ℤ_p, ℚ_p);
- invariants would give ℚ_p;
- smooth vectors would give the locally constant functions;
- each of these differs from C^la(ℤ_p, ℚ_p), as (1 + p)^a and Σ_k p^k binom(a, p^k) show (10.4).

The notion of decompletion is then tested in the third Check, where it fails over a non-trivial algebra. B does not decomplete over A, since B^la `⊗_{A^la}` A = C^la ≠ B. Then M = B decompletes over B and not over A. So the hypothesis of ALRS Lemma 5.2.27(1) cannot be dropped.

**Pattern.** The third Check's "although it decompletes over R = C(ℤ_p, ℚ_p)" was the same tautology, with M = R. It is now labelled as such and paired with the A/B control.

The other decompletion Checks of Layer 10 are not tautological. For example, 10.7's "C(G, ℚ_p) is classically decompleted" needs C^la_G to be dense for the sup norm.

## Checks run

- **Elaboration.** `lake env lean packages/RationalAnalyticPrismatization/Suggested.lean`, run from the content checkout: exit 0, no output. The file is unchanged. It declares nothing, because no headline theorem is statable at the pins, and it imports no `TauCeti.*` module.
- **`#check @name` comparison.** Not applicable: `Suggested.lean` has 0 declarations, and no README target that names a Lean declaration changed.
- **Dependency direction** (output of the gate's `--depcheck`):

      depcheck: 251 roadmaps, 2404 edges, 0 problem(s)

  There is no UPWARD, CYCLE or `moved:` line.
- **Citation resolver** (`roadmaps resolve` on the edited README). It reports one lead, "MotivesAndAlgebraicCyclesPartII Layer 0", which was there before. That roadmap is a board package at line 407 of the merge order, with this roadmap at line 408, and its Layer 0 is "The Banach arc-site". No Lean name is unresolved.
- **The gate's text scanners** (`tex`, `latex`, `prnum`, `private-paths`, `process`, `long-fences`) on the edited README: 0 hits each. My first draft had 12 `_{`/`^{` hits outside code spans in lines 283, 1709 and 1724. Those symbols are now code spans, and nothing else changed.
- **Gate failures listed in the brief:** none.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| 0.5 route: Corr(Σ_f) two-sided adjoint of Corr(f^*) | f = id; f: {a,b} → ∗, U = ∗, V = (∗,∗) | id: both sides trivial. On C: Hom(f^*U, V) has 1 element and Hom(U, Σ_f V) has 2, so Σ_f is only the left adjoint there. On spans: both sides are pairs (W_a, W_b) with maps to U and to V_a, V_b | two-sided on Corr only, as the route says | reworded |
| 0.4 route: ambidexterity, unit and counit | f = id; k[x] over k; m = 0 | id: every (B/A)_m = 1. k[x]: f and Δf are 0-affine, hence 0-prim, so f is 1-suave. m = 0: f^*_0 has no left adjoint, since ⊕_n M·x^n does not commute with ∏ (0.3, second Check) | m ≥ 1 is needed and stated | reworded |
| 2.4(3), new clause: totally disconnected A | A = C_p; A = C(S, C_p), S light profinite; A = C_p⟨T^{1/p^∞}⟩ | C_p: in both clauses. C(S, C_p): M(A) = S, totally disconnected. Perfectoid disc: M(A) connected, so not totally disconnected; it is qfd (quasi-pro-étale over A¹), so the first clause covers it | the two clauses overlap without either containing the other; agrees with ABLB Lemma 4.4.3 (ABLB line 2414–2417) | clause added with locator |
| 2.8 route: left Kan extension | R in the basis; non-perfectoid ℚ_p | ABLB line 2743–2745: the basis property and hyperdescent suffice. ℚ_p is totally disconnected but not perfectoid, so it is not in the basis | route matches ABLB Proposition 4.5.5's proof | reworded, citation corrected |
| 10.5: pushforward one factor at a time | G = H = 1; G = ℤ, H = ℤ_p; G = H = ℤ_p, M = C(ℤ_p², ℚ_p) | 1: identities. ℤ: s_G = id and the result is M^{H-la} with ℤ acting. ℤ_p²: M^{G-la} = C^la ⊗ C (locally analytic in a), and its H-la part is C^la ⊗ C^la = C^la(ℤ_p², ℚ_p). g(a, b) = Σ p^k binom(b, p^k) lies in M^{G-la} but not in (M^{G-la})^{H-la}, consistent with g ∉ C^la(ℤ_p²) | holds; the cartesian square is computed above | generalized, Check added |
| 10.5 Check 2 (new) | G = ℤ_p, R = C(ℤ_p, ℚ_p); N with trivial action | (−)^la: C^la. Identity: C. Invariants: ℚ_p. Smooth vectors: C^sm. (1 + p)^a ∈ C^la ∖ C^sm (p odd, derivative log(1 + p)(1 + p)^a ≠ 0). Σ p^k binom(a, p^k) ∈ C ∖ C^la. N^la = Γ(G, C^la_G) ⊗ N = N. (N ⊗ R)^la = N ⊗ C^la_G | discriminates (−)^la from three wrong models | replaced |
| 10.5 Check 3, A ⊂ B control | A = C^la(ℤ_p), B = C(ℤ_p), M = B; and A = ℚ_p, B = C^la | M^la ⊗_{A^la} A = C^la ≠ M, while M^la ⊗_{B^la} B = C = M. With A = ℚ_p, B = C^la: B decompletes over A, and for M = C(ℤ_p) both sides are C^la ≠ M, so M decompletes over neither, as ALRS Lemma 5.2.27(1) predicts | negative control for 5.2.27(1)'s hypothesis | added |
| 10.11 route | G trivial; G, H compact | G trivial: Y = W, and the formula reduces to 10.7 (third Check of 10.11). Compact: the general form gives `(−)^{(G×H)-la} = ((−)^{G-la})^{H-la}`, which is ALRS line 7620 | consistent | route updated |

## Ownership

The touched objects are owned here:

- the !-equivalence for arc-hypercovers of Gelfand spectra;
- locally analytic vectors as pushforward along BG^cont → BG^la.

AnalyticStacks hands Gelfand rings and Gelfand stacks to this roadmap.

`roadmaps grep -i --readme-only 'arc-hypercover'` finds two other roadmaps, and neither owns these objects:

- ArcTopologyAndDescent has integral arc-hyperdescent for perfectoid ℤ_p-algebras, a different statement.
- SchemeAndStackFoundationsPartII has arc-covers of ordinary rings.

A search for iterated (G × H)-locally analytic vectors found no owner either.

Ownership against open pull requests was checked through the roadmap search tools at the heads they index (index of 2026-11-16T05:59:11Z).

## Sources

No source was fetched and none is missing, so `needs-references.toml` was not created. All new locators are in ALRS, ABLB and Gest, which the manifest already records with these sections in `cited_for`:

- ALRS line 1012, 5659, 5664, 5721, 7607, 7620;
- ABLB line 2414 and 2743;
- Gest line 2232–2249 and 3043–3059.

ABLB Lemma 4.4.3 (p. 46) and Proposition 4.5.5 (p. 52) were added to the ABLB locator list in `sources.toml`; the printed page agrees with the extraction's page marker.

## For the maintainer

- No section or target id moved, and no Lean name changed. 2.4(3) gained a clause and 10.5 was generalized, so roadmaps that cite either still find their content there.
- No suspicious instruction was found in the review text.
